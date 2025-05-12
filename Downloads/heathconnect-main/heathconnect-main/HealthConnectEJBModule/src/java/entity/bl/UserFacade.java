/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.bl;

import entity.User;
import entity.doctor.Doctor;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author frank
 */
@Stateless
public class UserFacade extends AbstractFacade<User> implements UserFacadeLocal {

    @PersistenceContext(unitName = "HealthConnectEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }
    @Override
    public User findByEmailAndPassword(String email, String password) {
        try {
            String jpql = "SELECT u FROM User u WHERE u.email = :email AND u.password = :password";
            Query query = em.createQuery(jpql);
            query.setParameter("email", email);
            query.setParameter("password", password);  // Ensure password is hashed in production!
            return (User) query.getSingleResult();  // Return the Admin if found
        } catch (NoResultException e) {
            return null;  // Return null if no matching Admin is found
        }
    }

    @Override
    public Long countPatientsWithAppointments() {
        Query query = em.createQuery("SELECT COUNT(a) FROM User a ");
      Long nn =(Long)query.getSingleResult();
      return nn;
      
    }

    @Override
    public Long countPatientsWhoShowedUp() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Long countPatientsWhoDidNotShowUp() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
