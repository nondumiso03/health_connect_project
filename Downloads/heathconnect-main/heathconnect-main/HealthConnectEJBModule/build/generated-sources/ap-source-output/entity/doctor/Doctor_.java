package entity.doctor;

import entity.doctor.Doctor.Role;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-12T12:50:10")
@StaticMetamodel(Doctor.class)
public class Doctor_ { 

    public static volatile SingularAttribute<Doctor, Boolean> isOver18;
    public static volatile SingularAttribute<Doctor, String> lastName;
    public static volatile SingularAttribute<Doctor, String> specialty;
    public static volatile SingularAttribute<Doctor, String> address;
    public static volatile SingularAttribute<Doctor, String> occupation;
    public static volatile SingularAttribute<Doctor, Role> role;
    public static volatile SingularAttribute<Doctor, String> gender;
    public static volatile SingularAttribute<Doctor, String> bio;
    public static volatile SingularAttribute<Doctor, Boolean> consentToTreatment;
    public static volatile SingularAttribute<Doctor, Date> dateOfBirth;
    public static volatile SingularAttribute<Doctor, String> idNumber;
    public static volatile SingularAttribute<Doctor, Integer> experience;
    public static volatile SingularAttribute<Doctor, String> firstName;
    public static volatile SingularAttribute<Doctor, Date> licenseExpiryDate;
    public static volatile SingularAttribute<Doctor, String> password;
    public static volatile SingularAttribute<Doctor, String> cellphone;
    public static volatile SingularAttribute<Doctor, String> licenseNumber;
    public static volatile SingularAttribute<Doctor, Long> id;
    public static volatile SingularAttribute<Doctor, String> hospital;
    public static volatile SingularAttribute<Doctor, String> email;

}