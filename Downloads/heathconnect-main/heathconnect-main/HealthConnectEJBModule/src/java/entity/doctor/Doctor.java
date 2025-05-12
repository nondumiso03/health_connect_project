package entity.doctor;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "DOCTOR_TBL")
public class Doctor implements Serializable {

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

    // Medical Information specific to Doctors
    private String specialty;
    private String licenseNumber;
    private Date licenseExpiryDate;

    // Additional info for doctor registration
    private String hospital;
    private int experience;
    private String bio;

    // Login & Consent (common across roles)
    private String email;
    private String password;
    private boolean consentToTreatment;

    @Enumerated(EnumType.STRING)
    private Role role;

    public Doctor() {}

    public Doctor(Long id, String firstName, String lastName, String idNumber, String cellphone, Date dateOfBirth, String gender, String address, String occupation, boolean isOver18, String specialty, String licenseNumber, Date licenseExpiryDate, String hospital, int experience, String bio, String email, String password, boolean consentToTreatment, Role role) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.idNumber = idNumber;
        this.cellphone = cellphone;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.address = address;
        this.occupation = occupation;
        this.isOver18 = isOver18;
        this.specialty = specialty;
        this.licenseNumber = licenseNumber;
        this.licenseExpiryDate = licenseExpiryDate;
        this.hospital = hospital;
        this.experience = experience;
        this.bio = bio;
        this.email = email;
        this.password = password;
        this.consentToTreatment = consentToTreatment;
        this.role = role;
    }

    public Long getId() { return id; }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public boolean isIsOver18() {
        return isOver18;
    }

    public void setIsOver18(boolean isOver18) {
        this.isOver18 = isOver18;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public Date getLicenseExpiryDate() {
        return licenseExpiryDate;
    }

    public void setLicenseExpiryDate(Date licenseExpiryDate) {
        this.licenseExpiryDate = licenseExpiryDate;
    }

    public String getHospital() {
        return hospital;
    }

    public void setHospital(String hospital) {
        this.hospital = hospital;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isConsentToTreatment() {
        return consentToTreatment;
    }

    // Getters and Setters
    // (All the same as before, except idProofFileName-related ones are removed)
    // ... [Omitted for brevity] — keep existing getters/setters
    public void setConsentToTreatment(boolean consentToTreatment) {
        this.consentToTreatment = consentToTreatment;
    }

    public Role getRole() {
        return role;
    }
    public void setRole(Role role) { this.role = role; }

    @Override
    public int hashCode() {
        return (id != null) ? id.hashCode() : 0;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Doctor)) return false;
        Doctor other = (Doctor) object;
        return (this.id != null || other.id == null) && (this.id == null || this.id.equals(other.id));
    }

    @Override
    public String toString() {
        return "entity.doctor.Doctor[ id=" + id + " ]";
    }

    public enum Role {
        DOCTOR,
        ADMIN,
        PATIENT
    }
}
