package za.ac.tut.web;



import ac.za.medical.bl.medicalFacadeLocal;
import ac.za.medical.medical;
import javax.ejb.EJB;
import javax.servlet.ServletException;

import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


public class viewMedicalRecords extends HttpServlet {

    @EJB
    private medicalFacadeLocal medicalRecordFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve all medical records from the database
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         List<medical> records = medicalRecordFacade.findAll();

        // Set the list as a request attribute
        request.setAttribute("records", records);

        // Forward to JSP
        request.getRequestDispatcher("viewMedicalRecordsOutcome.jsp").forward(request, response); // Allow POST requests to behave like GET
    }

    @Override
    public String getServletInfo() {
        return "Servlet to view all medical records";
    }
}
