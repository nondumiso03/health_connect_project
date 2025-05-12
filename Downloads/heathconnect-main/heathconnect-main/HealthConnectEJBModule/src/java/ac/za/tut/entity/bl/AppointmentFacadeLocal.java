/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.entity.bl;

import ac.za.tut.entity.Appointment;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Potego
 */
@Local
public interface AppointmentFacadeLocal {

    void create(Appointment appointment);

    void edit(Appointment appointment);

    void remove(Appointment appointment);

    Appointment find(Object id);

    List<Appointment> findAll();

    List<Appointment> findRange(int[] range);

    int count();
    Long countTotalAppointments();

// Returns how many patients made at least one appointment
Long countPatientsWithAppointments();

// Returns how many patients showed up for their appointment
Long countPatientsWhoShowedUp();

// Returns how many patients missed their appointment
Long countPatientsWhoDidNotShowUp();
    
}
