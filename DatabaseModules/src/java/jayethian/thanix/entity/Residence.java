package jayethian.thanix.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SecondaryTable;
import java.io.Serializable;
import jayethian.thanix.persistence.enums.GenderIntake;
import jayethian.thanix.persistence.enums.RoomType;
import jayethian.thanix.persistence.enums.State;

/**
 *
 * @author Jayetheus
 */
@Entity
@SecondaryTable(name = "Address")
public class Residence implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    
    
    @Column(length = 50, nullable = false)
    private String res_name;
    @Column(length = 50, nullable = false)
    private long res_prov_id;
    @Column(length = 10, nullable = true, precision = 10)
    private String telephone;
    @Column(length = 20, nullable = true)
    private String email;
    @Column(length = 30, nullable = true)
    private String website;
    private boolean nsfas_accr;
    private RoomType room_type;
    private GenderIntake gender_intake;
    
    @Column(nullable=false, table="Address", length=20)
    private String street_name;
    @Column(nullable=false, table="Address", precision =4)
    private int street_number;
    @Column(nullable=false, table="Address", length = 50)
    private String city;
    @Column(nullable=false, table="Address")
    private State state;
    @Column(nullable=false, table="Address", precision = 4)
    private int postal_code;

    public String getRes_name() {
        return res_name;
    }

    public void setRes_name(String res_name) {
        this.res_name = res_name;
    }

    public long getRes_prov_id() {
        return res_prov_id;
    }

    public void setRes_prov_id(long res_prov_id) {
        this.res_prov_id = res_prov_id;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public boolean isNsfas_accr() {
        return nsfas_accr;
    }

    public void setNsfas_accr(boolean nsfas_accr) {
        this.nsfas_accr = nsfas_accr;
    }

    public RoomType getRoom_type() {
        return room_type;
    }

    public void setRoom_type(RoomType room_type) {
        this.room_type = room_type;
    }

    public GenderIntake getGender_intake() {
        return gender_intake;
    }

    public void setGender_intake(GenderIntake gender_intake) {
        this.gender_intake = gender_intake;
    }

    public String getStreet_name() {
        return street_name;
    }

    public void setStreet_name(String street_name) {
        this.street_name = street_name;
    }

    public int getStreet_number() {
        return street_number;
    }

    public void setStreet_number(int street_number) {
        this.street_number = street_number;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public int getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(int postal_code) {
        this.postal_code = postal_code;
    }
    

    
    
    public String getName() {
        return res_name;
    }

    public void setName(String res_name) {
        this.res_name = res_name;
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
        if (!(object instanceof Residence)) {
            return false;
        }
        Residence other = (Residence) object;
        return !((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id)));
    }

    @Override
    public String toString() {
        return "jayethian.thanix.persistence.ResProvider[ id=" + id + " ]";
    }
}