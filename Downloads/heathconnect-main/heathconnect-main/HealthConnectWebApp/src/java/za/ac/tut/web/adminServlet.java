/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import ac.za.tut.entity.Appointment;
import ac.za.tut.entity.bl.AppointmentFacadeLocal;
import entity.User;


import entity.bl.UserFacadeLocal;
import java.io.IOException;

import java.util.List;
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
public class adminServlet extends HttpServlet {
@EJB

private AppointmentFacadeLocal afl;
@EJB
private UserFacadeLocal    sfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        List<Appointment> list = afl.findAll();
        Long nn = afl.countTotalAppointments();
      
       
        request.setAttribute("list", list);
        
          request.setAttribute("total", nn);
        
        RequestDispatcher disp = request.getRequestDispatcher("admin_outcome.jsp");
        disp.forward(request, response);
        
        
        
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
