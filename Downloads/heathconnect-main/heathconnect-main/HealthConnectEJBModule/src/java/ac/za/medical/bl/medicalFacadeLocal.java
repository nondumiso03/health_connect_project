/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.medical.bl;

import ac.za.medical.medical;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Potego
 */
@Local
public interface medicalFacadeLocal {

    void create(medical medical);

    void edit(medical medical);

    void remove(medical medical);

    medical find(Object id);

    List<medical> findAll();

    List<medical> findRange(int[] range);

    int count();
    
}
