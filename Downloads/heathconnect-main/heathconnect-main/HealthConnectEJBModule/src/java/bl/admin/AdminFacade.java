
package bl.admin;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import za.ac.admin.Admin;

@Stateless
public class AdminFacade extends AbstractFacade<Admin> implements AdminFacadeLocal {

    @PersistenceContext(unitName = "HealthConnectEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdminFacade() {
        super(Admin.class);
    }

    @Override
    public Admin findByEmailAndPassword(String email, String password) {
        try {
            String jpql = "SELECT a FROM Admin a WHERE a.email = :email AND a.password = :password";
            Query query = em.createQuery(jpql);
            query.setParameter("email", email);
            query.setParameter("password", password);  // Ensure password is hashed in production!
            return (Admin) query.getSingleResult();  // Return the Admin if found
        } catch (NoResultException e) {
            return null;  // Return null if no matching Admin is found
        }
    }
    @Override
    public boolean emailExists(String email) {
        TypedQuery<Admin> query = em.createQuery("SELECT a FROM Admin a WHERE a.email = :email", Admin.class);
        query.setParameter("email", email);
        return !query.getResultList().isEmpty();
    }
    
}



