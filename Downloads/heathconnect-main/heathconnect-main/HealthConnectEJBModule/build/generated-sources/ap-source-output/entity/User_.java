package entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-12T12:50:10")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, Boolean> isOver18;
    public static volatile SingularAttribute<User, String> lastName;
    public static volatile SingularAttribute<User, String> address;
    public static volatile SingularAttribute<User, String> occupation;
    public static volatile SingularAttribute<User, String> role;
    public static volatile SingularAttribute<User, String> gender;
    public static volatile SingularAttribute<User, Boolean> consentToTreatment;
    public static volatile SingularAttribute<User, Date> dateOfBirth;
    public static volatile SingularAttribute<User, String> allergiesDetails;
    public static volatile SingularAttribute<User, String> currentMedications;
    public static volatile SingularAttribute<User, String> idNumber;
    public static volatile SingularAttribute<User, String> firstName;
    public static volatile SingularAttribute<User, String> primaryCareDoctor;
    public static volatile SingularAttribute<User, String> insuranceProvider;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, String> insurancePolicyNumber;
    public static volatile SingularAttribute<User, String> uploadedIdFileName;
    public static volatile SingularAttribute<User, String> cellphone;
    public static volatile SingularAttribute<User, String> familyHistory;
    public static volatile SingularAttribute<User, Long> id;
    public static volatile SingularAttribute<User, String> pastMedicalHistory;
    public static volatile SingularAttribute<User, String> email;

}