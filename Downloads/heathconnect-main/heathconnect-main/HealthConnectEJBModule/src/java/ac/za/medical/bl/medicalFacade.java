/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.medical.bl;

import ac.za.medical.medical;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Potego
 */
@Stateless
public class medicalFacade extends AbstractFacade<medical> implements medicalFacadeLocal {

    @PersistenceContext(unitName = "HealthConnectEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public medicalFacade() {
        super(medical.class);
    }
    
}
