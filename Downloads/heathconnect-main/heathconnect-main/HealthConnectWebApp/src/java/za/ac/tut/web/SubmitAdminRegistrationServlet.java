package za.ac.tut.web;

import bl.admin.AdminFacadeLocal;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import za.ac.admin.Admin;

@WebServlet(name = "SubmitAdminRegistrationServlet", urlPatterns = {"/SubmitAdminRegistrationServlet"})
public class SubmitAdminRegistrationServlet extends HttpServlet {

    @EJB
    private AdminFacadeLocal adminFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dobStr = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (!isAlphabetic(firstName) || !isAlphabetic(lastName)) {
            request.setAttribute("error", "First and Last names must contain only letters.");
            request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
            return;
        }

        if (!isValidIdNumber(phone)) {
            request.setAttribute("error", "ID number must be 13 digits long and contain only numbers.");
            request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
            return;
        }

        if (!isValidPassword(password)) {
            request.setAttribute("error", "Password must be at least 8 characters and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.");
            request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
            return;
        }

        if (adminFacade.emailExists(email)) {
            request.setAttribute("error", "This email is already registered.");
            request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
            return;
        }

        Date dob = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            dob = sdf.parse(dobStr); // Parsing the formatted DOB (yyyy/MM/dd)
        } catch (ParseException | NullPointerException e) {
            request.setAttribute("error", "Invalid date format. Please use yyyy/MM/dd.");
            request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
            return;
        }

        Admin admin = new Admin();
        admin.setFirstName(firstName);
        admin.setLastName(lastName);
        admin.setDob(dob);
        admin.setGender(gender);
        admin.setEmail(email);
        admin.setPhone(phone);
        admin.setUsername(username);
        admin.setPassword(password);
        admin.setRole("ADMIN");

        adminFacade.create(admin);
        RequestDispatcher rd = request.getRequestDispatcher("successregisteradmin.jsp");
        rd.forward(request, response);
    }

    private boolean isAlphabetic(String name) {
        return name != null && name.matches("^[A-Za-z]+$");
    }

    private boolean isValidIdNumber(String id) {
        return id != null && id.matches("^\\d{13}$");
    }

    private boolean isValidPassword(String password) {
        String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,}$";
        return password != null && password.matches(regex);
    }

    @Override
    public String getServletInfo() {
        return "Handles admin registration";
    }
}
