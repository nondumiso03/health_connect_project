package bl.admin;

import javax.ejb.Local;
import za.ac.admin.Admin;
import java.util.List;

@Local
public interface AdminFacadeLocal {

    void create(Admin admin);

    void edit(Admin admin);

    void remove(Admin admin);

    Admin find(Object id);

    List<Admin> findAll();

    List<Admin> findRange(int[] range);

    int count();
    
    // Add the method for finding an Admin by email and password
    Admin findByEmailAndPassword(String email, String password);
    
    boolean emailExists(String email);
}
