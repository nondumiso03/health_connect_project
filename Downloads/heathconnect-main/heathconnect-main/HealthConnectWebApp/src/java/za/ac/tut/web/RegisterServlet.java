package za.ac.tut.web;

import entity.User;
import entity.bl.UserFacadeLocal;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal ufl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Collect form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String idNumber = request.getParameter("idNumber");
        String cellphone = request.getParameter("cellphone");
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String occupation = request.getParameter("occupation");
        String primaryCareDoctor = request.getParameter("primaryCareDoctor");
        String insuranceProvider = request.getParameter("insuranceProvider");
        String insurancePolicyNumber = request.getParameter("insurancePolicyNumber");
        String allergiesDetails = request.getParameter("allergiesDetails");
        String currentMedications = request.getParameter("currentMedications");
        String familyHistory = request.getParameter("familyHistory");
        String pastMedicalHistory = request.getParameter("pastMedicalHistory");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean consentToTreatment = request.getParameter("consentToTreatment") != null;
        boolean isOver18 = request.getParameter("isOver18") != null;

        // ID number validation (13 digits)
        if (idNumber == null || !idNumber.matches("\\d{13}")) {
            request.setAttribute("error", "ID Number must be exactly 13 digits.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Password validation
        String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{6,}$";
        if (password == null || !password.matches(passwordPattern)) {
            request.setAttribute("errors", "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Handle file upload
        Part filePart = request.getPart("uploadedIdCopy");
        String uploadedIdFileName = (filePart != null && filePart.getSubmittedFileName() != null)
                ? filePart.getSubmittedFileName()
                : "";

        // Extract date of birth from ID number if not provided
        Date dateOfBirth = null;
        if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                dateOfBirth = sdf.parse(dateOfBirthStr);
            } catch (ParseException | NullPointerException e) {
                request.setAttribute("error", "Invalid date format. Please use yyyy-MM-dd.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
        } else {
            // If date of birth is not provided, try extracting it from the ID number
            if (idNumber != null && idNumber.length() == 13) {
                try {
                    // Extract year, month, and day from the ID number
                    String year = idNumber.substring(0, 2);  // First 2 digits
                    String month = idNumber.substring(2, 4); // Next 2 digits
                    String day = idNumber.substring(4, 6);   // Next 2 digits

                    int currentYear = Integer.parseInt(String.valueOf(java.util.Calendar.getInstance().get(java.util.Calendar.YEAR)).substring(0, 2));

                    // If year from ID is greater than the current year prefix, assume it's 1900s
                    if (Integer.parseInt(year) > currentYear) {
                        year = "19" + year;
                    } else {
                        year = "20" + year;
                    }

                    // Format the date as yyyy-MM-dd
                    String formattedDate = year + "-" + month + "-" + day;
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    dateOfBirth = sdf.parse(formattedDate);
                } catch (Exception e) {
                    request.setAttribute("error", "Invalid ID number format.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                    return;
                }
            } else {
                request.setAttribute("error", "ID number is invalid. Please ensure it is a 13-digit number.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
        }

        // Create and populate User
        User newUser = createUser(firstName, lastName, idNumber, cellphone, dateOfBirth,
                gender, address, occupation, primaryCareDoctor, insuranceProvider,
                insurancePolicyNumber, allergiesDetails, currentMedications,
                familyHistory, pastMedicalHistory, uploadedIdFileName, email,
                password, consentToTreatment, isOver18);

        // Persist user
        ufl.create(newUser);

        // Store the user in session
        request.getSession().setAttribute("user", newUser);

        // Redirect to personalized dashboard
        response.sendRedirect("successregister.jsp");
    }

    private User createUser(String firstName, String lastName, String idNumber, String cellphone,
                            Date dateOfBirth, String gender, String address, String occupation,
                            String primaryCareDoctor, String insuranceProvider, String insurancePolicyNumber,
                            String allergiesDetails, String currentMedications, String familyHistory,
                            String pastMedicalHistory, String uploadedIdFileName, String email,
                            String password, boolean consentToTreatment, boolean isOver18) {

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setIdNumber(idNumber);
        user.setCellphone(cellphone);
        user.setDateOfBirth(dateOfBirth);
        user.setGender(gender);
        user.setAddress(address);
        user.setOccupation(occupation);
        user.setPrimaryCareDoctor(primaryCareDoctor);
        user.setInsuranceProvider(insuranceProvider);
        user.setInsurancePolicyNumber(insurancePolicyNumber);
        user.setAllergiesDetails(allergiesDetails);
        user.setCurrentMedications(currentMedications);
        user.setFamilyHistory(familyHistory);
        user.setPastMedicalHistory(pastMedicalHistory);
        user.setUploadedIdFileName(uploadedIdFileName);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole("PATIENT");
        user.setConsentToTreatment(consentToTreatment);
        user.setIsOver18(isOver18);

        return user;
    }

    @Override
    public String getServletInfo() {
        return "Handles user registration and persistence";
    }
}
