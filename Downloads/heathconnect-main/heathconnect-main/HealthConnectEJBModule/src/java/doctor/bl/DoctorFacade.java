/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package doctor.bl;

import entity.doctor.Doctor;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import za.ac.admin.Admin;

/**
 *
 * @author frank
 */
@Stateless
public class DoctorFacade extends AbstractFacade<Doctor> implements DoctorFacadeLocal {

    @PersistenceContext(unitName = "HealthConnectEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DoctorFacade() {
        super(Doctor.class);
    }
        @Override
    public Doctor findByEmailAndPassword(String email, String password) {
        try {
            String jpql = "SELECT a FROM Doctor a WHERE a.email = :email AND a.password =:password";
            Query query = em.createQuery(jpql);
            query.setParameter("email", email);
            query.setParameter("password", password);  // Ensure password is hashed in production!
            return (Doctor) query.getSingleResult();  // Return the Admin if found
        } catch (NoResultException e) {
            return null;  // Return null if no matching Admin is found
        }
    }



@Override
public Long countPatientsWithAppointments() {
    String jpql = "SELECT COUNT(DISTINCT a.patient.id) FROM Appointment a";
    return em.createQuery(jpql, Long.class).getSingleResult();
}

 @Override
public Long countPatientsWhoShowedUp(Long id) {
     Query query = em.createQuery("SELECT COUNT(a) FROM Doctor a WHERE a.id = :Pid");
        query.setParameter("Pid", id);
        return (Long) query.getSingleResult();
}


  @Override
public Long countPatientsWhoDidNotShowUp(Long id) {
 Query query = em.createQuery("SELECT COUNT(a) FROM Doctor a WHERE a.id = :Pid");
        query.setParameter("Pid", id);
        return (Long) query.getSingleResult();
}



    
}
