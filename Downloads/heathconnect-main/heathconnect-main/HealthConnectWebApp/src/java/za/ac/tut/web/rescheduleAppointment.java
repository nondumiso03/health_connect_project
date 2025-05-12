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
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class rescheduleAppointment extends HttpServlet {
@EJB
private AppointmentFacadeLocal afl;
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String doctor = request.getParameter("doctor");
      String dateOfBirthStr= request.getParameter("date");
      String time = request.getParameter("time");
      Long id = Long.parseLong(request.getParameter("appointment_id"));
       Date dateOfBirth = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            dateOfBirth = sdf.parse(dateOfBirthStr);
        } catch (ParseException | NullPointerException e) {
            request.setAttribute("error", "Invalid date format. Please use yyyy-MM-dd.");
            request.getRequestDispatcher("edit_appointment.jsp").forward(request, response);
            return;
        }
        Appointment app = create(id,doctor, dateOfBirth, time);
        afl.edit(app);
        request.setAttribute("appointment", app);
        RequestDispatcher disp = request.getRequestDispatcher("edit_appointment.jsp");
        disp.forward(request, response);
      
    }
    private Appointment create(Long id,String doctor,Date date,String time){
    Appointment app = afl.find(id);
  
    app.setDoctor(doctor);
    app.setDateOfBirth(date);
    app.setTime(time);
    
    return app;
    }

  
}
