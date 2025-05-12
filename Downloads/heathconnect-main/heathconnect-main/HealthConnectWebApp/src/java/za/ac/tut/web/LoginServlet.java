package za.ac.tut.web;

import bl.admin.AdminFacadeLocal;
import doctor.bl.DoctorFacadeLocal;
import entity.bl.UserFacadeLocal;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @EJB
    private DoctorFacadeLocal doctorFacade;
    @EJB
    private UserFacadeLocal userFacade;
    @EJB
    private AdminFacadeLocal adminFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        Object user = null;

        if (role.equals("patient")) {
            user = userFacade.findByEmailAndPassword(email, password);
        } else if (role.equals("doctor")) {
            user = doctorFacade.findByEmailAndPassword(email, password);
        } else if (role.equals("admin")) {
            user = adminFacade.findByEmailAndPassword(email, password);
        }

        if (user != null) {
            if (role.equals("patient")) {
                response.sendRedirect("PetientMenu.jsp");
            } else if (role.equals("doctor")) {
                response.sendRedirect("doctorDashboard.jsp");
            } else if (role.equals("admin")) {
                response.sendRedirect("adminDashboard.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid credentials.");
            request.getRequestDispatcher("login.jsp").forward(request, response); // FIXED
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "LoginServlet for HealthConnect";
    }
}
