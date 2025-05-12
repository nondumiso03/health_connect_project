package za.ac.tut.web;


import ac.za.tut.entity.Appointment;
import ac.za.tut.entity.bl.AppointmentFacadeLocal;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ConfirmAppointmentServlet", urlPatterns = {"/ConfirmAppointmentServlet.do"})
public class ConfirmAppointmentServlet extends HttpServlet {

    @EJB
    private AppointmentFacadeLocal appointmentFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long appointmentId = Long.parseLong(request.getParameter("appointmentId"));
            String status = request.getParameter("status");

            Appointment appointment = appointmentFacade.find(appointmentId);

            if (appointment != null) {
                // assuming Appointment has a `status` field
                appointmentFacade.edit(appointment);
                request.setAttribute("message", "Appointment status updated successfully.");
            } else {
                request.setAttribute("error", "Appointment not found.");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid appointment ID format.");
        } catch (Exception e) {
            request.setAttribute("error", "Error updating appointment: " + e.getMessage());
        }

        request.getRequestDispatcher("confirmAppointment_output.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to confirm or update appointment status.";
    }
}
