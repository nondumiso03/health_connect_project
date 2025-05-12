package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "PAT_TBL")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    // Personal Information
    private String firstName;
    private String lastName;
    private String idNumber;
    private String cellphone;

    @Temporal(TemporalType.DATE)
    private Date dateOfBirth;

    private String gender;
    private String address;
    private String occupation;
    private boolean isOver18;

    // Medical Information
    private String primaryCareDoctor;
    private String insuranceProvider;
    private String insurancePolicyNumber;
    private String allergiesDetails;
    private String currentMedications;
    private String familyHistory;
    private String pastMedicalHistory;

    // Identification
    private String uploadedIdFileName;

    // Login & Consent
    private String email;
    private String password;
    private String role;
    private boolean consentToTreatment;

    public User() {}

    public User(Long id, String firstName, String lastName, String idNumber, String cellphone, Date dateOfBirth,
                String gender, String address, String occupation, boolean over18,
                String primaryCareDoctor, String insuranceProvider, String insurancePolicyNumber,
                String allergiesDetails, String currentMedications, String familyHistory, String pastMedicalHistory,
                String uploadedIdFileName, String email, String password, String role, boolean consentToTreatment) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.idNumber = idNumber;
        this.cellphone = cellphone;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.address = address;
        this.occupation = occupation;
        this.isOver18 = over18;
        this.primaryCareDoctor = primaryCareDoctor;
        this.insuranceProvider = insuranceProvider;
        this.insurancePolicyNumber = insurancePolicyNumber;
        this.allergiesDetails = allergiesDetails;
        this.currentMedications = currentMedications;
        this.familyHistory = familyHistory;
        this.pastMedicalHistory = pastMedicalHistory;
        this.uploadedIdFileName = uploadedIdFileName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.consentToTreatment = consentToTreatment;
    }

    // Getters and Setters

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getIdNumber() { return idNumber; }
    public void setIdNumber(String idNumber) { this.idNumber = idNumber; }

    public String getCellphone() { return cellphone; }
    public void setCellphone(String cellphone) { this.cellphone = cellphone; }

    public Date getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(Date dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getOccupation() { return occupation; }
    public void setOccupation(String occupation) { this.occupation = occupation; }

    public boolean isOver18() { return isOver18; }
    public void setIsOver18(boolean over18) { this.isOver18 = over18; }

    public String getPrimaryCareDoctor() { return primaryCareDoctor; }
    public void setPrimaryCareDoctor(String primaryCareDoctor) { this.primaryCareDoctor = primaryCareDoctor; }

    public String getInsuranceProvider() { return insuranceProvider; }
    public void setInsuranceProvider(String insuranceProvider) { this.insuranceProvider = insuranceProvider; }

    public String getInsurancePolicyNumber() { return insurancePolicyNumber; }
    public void setInsurancePolicyNumber(String insurancePolicyNumber) { this.insurancePolicyNumber = insurancePolicyNumber; }

    public String getAllergiesDetails() { return allergiesDetails; }
    public void setAllergiesDetails(String allergiesDetails) { this.allergiesDetails = allergiesDetails; }

    public String getCurrentMedications() { return currentMedications; }
    public void setCurrentMedications(String currentMedications) { this.currentMedications = currentMedications; }

    public String getFamilyHistory() { return familyHistory; }
    public void setFamilyHistory(String familyHistory) { this.familyHistory = familyHistory; }

    public String getPastMedicalHistory() { return pastMedicalHistory; }
    public void setPastMedicalHistory(String pastMedicalHistory) { this.pastMedicalHistory = pastMedicalHistory; }

    public String getUploadedIdFileName() { return uploadedIdFileName; }
    public void setUploadedIdFileName(String uploadedIdFileName) { this.uploadedIdFileName = uploadedIdFileName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public boolean isConsentToTreatment() { return consentToTreatment; }
    public void setConsentToTreatment(boolean consentToTreatment) { this.consentToTreatment = consentToTreatment; }

    @Override
    public int hashCode() {
        return (id != null) ? id.hashCode() : 0;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof User)) return false;
        User other = (User) object;
        return (this.id != null || other.id == null) && (this.id == null || this.id.equals(other.id));
    }

    @Override
    public String toString() {
        return "entity.User[ id=" + id + " ]";
    }
}
