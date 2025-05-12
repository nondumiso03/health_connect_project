package za.ac.tut.web;

import doctor.bl.DoctorFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ViewAttendanceServlet", urlPatterns = {"/ViewAttendanceServlet.do"})
public class ViewAttendanceServlet extends HttpServlet {

    @EJB
    private DoctorFacadeLocal appointmentService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String patientIdStr = request.getParameter("patientId");
        String action = request.getParameter("action");
        
        Long patientId = Long.parseLong(patientIdStr); // Ensure the value exists and is valid
Integer countShow=0;
Integer countNot=0;
        // You must create this method in your EJB to update the appointment status
        if ("showed_up".equals(action)) {
           Long nn= appointmentService.countPatientsWhoShowedUp(patientId);
            request.setAttribute("message", "showed up");
            request.setAttribute("show", nn);
            countShow ++;
            
          response.sendRedirect("attendanceoutcome.jsp"); 
        } else if ("did_not_show".equals(action)) {
          Long np=  appointmentService.countPatientsWhoDidNotShowUp(patientId);
          request.setAttribute("not", np);
             request.setAttribute("message", "dis not showed up");
            
             response.sendRedirect("attendanceoutcome.jsp");
        }
        
        

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<html><body>");
        response.getWriter().println("<h2>Attendance marked successfully for patient ID: " + patientId + "</h2>");
        response.getWriter().println("<a href='ViewAttendance.jsp'>Go Back</a>");
        response.getWriter().println("</body></html>");
    }

    @Override
    public String getServletInfo() {
        return "Handles attendance marking for patients.";
    }
}
