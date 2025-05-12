package za.ac.tut.web;

import doctor.bl.DoctorFacadeLocal;
import entity.doctor.Doctor;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "submitDoctorRegistrationServlet", urlPatterns = {"/submitDoctorRegistrationServlet"})
public class submitDoctorRegistrationServlet extends HttpServlet {

    @EJB
    private DoctorFacadeLocal doctorFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String idNumber = request.getParameter("idNumber");
        String phone = request.getParameter("phone");
        String dobStr = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String occupation = request.getParameter("occupation");

        String specialty = request.getParameter("specialty");
        String licenseNumber = request.getParameter("licenseNumber");
        String licenseExpiryDateStr = request.getParameter("licenseExpiryDate");
        String hospital = request.getParameter("hospital");
        String experienceStr = request.getParameter("experience");
        String bio = request.getParameter("bio");

        boolean isOver18 = request.getParameter("over18") != null;
        boolean consentToTreatment = request.getParameter("consent") != null;

        // Required checkbox validation
        if (!isOver18 || !consentToTreatment) {
            request.setAttribute("error", "You must confirm you are over 18 and consent to treatment.");
            request.getRequestDispatcher("registerDoctor.jsp").forward(request, response);
            return;
        }

        // Name validation
        if (!isAlphabetic(firstName) || !isAlphabetic(lastName)) {
            request.setAttribute("error", "First and Last names must contain only letters.");
            request.getRequestDispatcher("registerDoctor.jsp").forward(request, response);
            return;
        }

        // ID number validation
        if (idNumber == null || !idNumber.matches("\\d{13}")) {
            request.setAttribute("error", "ID Number must be exactly 13 digits and contain only digits.");
            request.getRequestDispatcher("registerDoctor.jsp").forward(request, response);
            return;
        }

        // Phone number validation
        if (phone == null || !phone.matches("\\d{10}")) {
            request.setAttribute("error", "Phone number must be exactly 10 digits and contain only digits.");
            request.getRequestDispatcher("registerDoctor.jsp").forward(request, response);
            return;
        }

        // Password validation
        if (password == null || !isStrongPassword(password)) {
            request.setAttribute("error", "Password must be at least 8 characters and include uppercase, lowercase, digit, and special character.");
            request.getRequestDispatcher("registerDoctor.jsp").forward(request, response);
            return;
        }

        // Date parsing
        Date dob;
        Date licenseExpiryDate;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            dob = sdf.parse(dobStr);
            licenseExpiryDate = sdf.parse(licenseExpiryDateStr);
        } catch (ParseException | NullPointerException e) {
            request.setAttribute("error", "Invalid date format. Please use yyyy-MM-dd.");
            request.getRequestDispatcher("registerDoctor.jsp").forward(request, response);
            return;
        }

        // Experience parsing
        int experience;
        try {
            experience = Integer.parseInt(experienceStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number for experience.");
            request.getRequestDispatcher("registerDoctor.jsp").forward(request, response);
            return;
        }

        // Create and persist Doctor entity
        Doctor doctor = new Doctor();
        doctor.setFirstName(firstName);
        doctor.setLastName(lastName);
        doctor.setIdNumber(idNumber);
        doctor.setCellphone(phone);
        doctor.setDateOfBirth(dob);
        doctor.setGender(gender);
        doctor.setEmail(email);
        doctor.setPassword(password); // Suggest hashing in real application
        doctor.setAddress(address);
        doctor.setOccupation(occupation);
        doctor.setSpecialty(specialty);
        doctor.setLicenseNumber(licenseNumber);
        doctor.setLicenseExpiryDate(licenseExpiryDate);
        doctor.setHospital(hospital);
        doctor.setExperience(experience);
        doctor.setBio(bio);
        doctor.setIsOver18(isOver18);
        doctor.setConsentToTreatment(consentToTreatment);
        doctor.setRole(Doctor.Role.DOCTOR);

        doctorFacade.create(doctor);

        // Forward to success page
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("email", email);
        request.setAttribute("specialty", specialty);
        request.setAttribute("hospital", hospital);

        RequestDispatcher rd = request.getRequestDispatcher("successRegisterDoctor.jsp");
        rd.forward(request, response);
    }

    // Validates names (letters only)
    private boolean isAlphabetic(String name) {
        return name != null && name.matches("^[A-Za-z]+$");
    }

    // Validates password strength
    private boolean isStrongPassword(String password) {
        return password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,}$");
    }

    @Override
    public String getServletInfo() {
        return "Handles doctor registration with strict input validation";
    }
}
