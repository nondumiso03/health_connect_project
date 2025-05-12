package za.ac.tut.web;

import ac.za.medical.bl.medicalFacadeLocal;
import ac.za.medical.medical;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet(name = "AddMedicalRecordServlet", urlPatterns = {"/AddMedicalRecordServlet.do"})
public class AddMedicalRecordServlet extends HttpServlet {

    @EJB
    private  medicalFacadeLocal medicalRecordFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data
        Long patientId = Long.parseLong(request.getParameter("patientId"));
        String diagnosis = request.getParameter("diagnosis");
        String treatment = request.getParameter("treatment");
        String notes = request.getParameter("notes");

        // Create a new MedicalRecord object
        medical record = new medical();
        record.setId(patientId);
        record.setDignosis(diagnosis);
        record.setTreatment(treatment);
        record.setNote(notes);

        // Save it using the EJB
        medicalRecordFacade.create(record);

        // Redirect to confirmation or dashboard
        response.sendRedirect("addMedicaloutput.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Handles medical record submission";
    }
}
