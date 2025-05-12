/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.bl;

import entity.User;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author frank
 */
@Local
public interface UserFacadeLocal {

    void create(User user);

    void edit(User user);

    void remove(User user);

    User find(Object id);

    List<User> findAll();

    List<User> findRange(int[] range);

    int count();
    
    User findByEmailAndPassword(String email, String password);
    // Returns how many patients made at least one appointment
Long countPatientsWithAppointments();

// Returns how many patients showed up for their appointment
Long countPatientsWhoShowedUp();

// Returns how many patients missed their appointment
Long countPatientsWhoDidNotShowUp();
}
