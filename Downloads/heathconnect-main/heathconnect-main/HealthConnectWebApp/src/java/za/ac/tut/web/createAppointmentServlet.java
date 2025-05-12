/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import ac.za.tut.entity.Appointment;
import ac.za.tut.entity.bl.AppointmentFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Potego
 */
public class createAppointmentServlet extends HttpServlet {

 @EJB
    private AppointmentFacadeLocal afl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String doctor = request.getParameter("doctor");
      String dateOfBirthStr= request.getParameter("date");
      String time = request.getParameter("time");
      Long id = Long.parseLong(request.getParameter("id"));
       Date dateOfBirth = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            dateOfBirth = sdf.parse(dateOfBirthStr);
        } catch (ParseException | NullPointerException e) {
            request.setAttribute("error", "Invalid date format. Please use yyyy-MM-dd.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        Appointment app = create(id,doctor, dateOfBirth, time);
        afl.create(app);
        request.setAttribute("appointment", app);
        RequestDispatcher disp = request.getRequestDispatcher("AdminCreate_output.jsp");
        disp.forward(request, response);
      
    }
    private Appointment create(Long id,String doctor,Date date,String time){
    Appointment app = new Appointment();
    app.setDoctor(doctor);
    app.setDateOfBirth(date);
    app.setTime(time);
        app.setId(id);
    return app;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
