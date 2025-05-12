/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.medical;

import java.io.Serializable;
import javax.persistence.Entity;

import javax.persistence.Id;

/**
 *
 * @author Potego
 */
@Entity
public class medical implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
 
    private Long id;
    private String dignosis;
    private String treatment;
    private String note;

    public medical() {
    }

    public medical(Long id, String dignosis, String treatment, String note) {
        this.id = id;
        this.dignosis = dignosis;
        this.treatment = treatment;
        this.note = note;
    }

    public String getDignosis() {
        return dignosis;
    }

    public void setDignosis(String dignosis) {
        this.dignosis = dignosis;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof medical)) {
            return false;
        }
        medical other = (medical) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ac.za.medical.medical[ id=" + id + " ]";
    }
    
}
