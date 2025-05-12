/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package doctor.bl;

import entity.doctor.Doctor;
import java.util.List;
import javax.ejb.Local;


/**
 *
 * @author frank
 */
@Local
public interface DoctorFacadeLocal {

    void create(Doctor doctor);

    void edit(Doctor doctor);

    void remove(Doctor doctor);

    Doctor find(Object id);

    List<Doctor> findAll();

    List<Doctor> findRange(int[] range);

    int count();
    
    Doctor findByEmailAndPassword(String email, String password);
    // Returns the total number of appointments made
    Long countPatientsWithAppointments();

// Returns how many patients showed up for their appointment
Long countPatientsWhoShowedUp(Long id);

// Returns how many patients missed their appointment
Long countPatientsWhoDidNotShowUp(Long id);

    
}
