package com.studentdiaries.springboot.Model;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "admin_user")
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int adminId;

    @Column(name = "admin_first_name", nullable = false)
    private String adminFirstName;

    @Column(name = "admin_last_name", nullable = false)
    private String adminLastName;

    @Column(name = "admin_email", nullable = false, unique = true)
    private String adminEmail;

    @Column(name = "admin_phone", nullable = false, unique = true)
    private long adminPhone;

    @Column(name = "admin_password", nullable = false)
    private String adminPassword;

    @Column(name = "admin_school", nullable = false)
    private String adminSchool;

    @Column(name = "admin_city", nullable = false)
    private String adminCity;

    @UpdateTimestamp
    @Column(name = "last_updated_date_time")
    private LocalDateTime lastUpdatedDateTime;

    @CreationTimestamp
    @Column(name = "creation_date_time")
    private LocalDateTime creationDateTime;


    @OneToMany(targetEntity = Teacher.class, cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumn(name = "adminId", referencedColumnName = "adminId", nullable = false, insertable = false, updatable = false)
    private Set<Teacher> teacherSet;

    //Constructor


    public Admin() {
    }

    //Parameterized Constructor
    public Admin(String adminFirstName, String adminLastName, String adminEmail, long adminPhone, String adminPassword, String adminSchool, String adminCity, LocalDateTime lastUpdatedDateTime, LocalDateTime creationDateTime, Set<Teacher> teacherSet) {
        this.adminFirstName = adminFirstName;
        this.adminLastName = adminLastName;
        this.adminEmail = adminEmail;
        this.adminPhone = adminPhone;
        this.adminPassword = adminPassword;
        this.adminSchool = adminSchool;
        this.adminCity = adminCity;
        this.lastUpdatedDateTime = lastUpdatedDateTime;
        this.creationDateTime = creationDateTime;
        this.teacherSet = teacherSet;
    }


    public Admin(Admin admin)
    {
        this.adminId = admin.getAdminId();
        this.adminFirstName = admin.getAdminFirstName();
        this.adminLastName = admin.getAdminLastName();
        this.adminEmail = admin.getAdminEmail();
        this.adminPhone = admin.getAdminPhone();
        this.adminPassword = admin.getAdminPassword();
        this.adminSchool = admin.getAdminSchool();
        this.adminCity = admin.getAdminCity();
        this.lastUpdatedDateTime = admin.getLastUpdatedDateTime();
        this.creationDateTime = admin.getCreationDateTime();
        this.teacherSet = admin.getTeacherSet();
    }

    //ToString
    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminFirstName='" + adminFirstName + '\'' +
                ", adminLastName='" + adminLastName + '\'' +
                ", adminEmail='" + adminEmail + '\'' +
                ", adminPhone=" + adminPhone +
                ", adminPassword='" + adminPassword + '\'' +
                ", adminSchool='" + adminSchool + '\'' +
                ", adminCity='" + adminCity + '\'' +
                ", lastUpdatedDateTime=" + lastUpdatedDateTime +
                ", creationDateTime=" + creationDateTime +
                ", teacherSet=" + teacherSet +
                '}';
    }

    /*SETTERS AND GETTERS*/
    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAdminFirstName() {
        return adminFirstName;
    }

    public void setAdminFirstName(String adminFirstName) {
        this.adminFirstName = adminFirstName;
    }

    public String getAdminLastName() {
        return adminLastName;
    }

    public void setAdminLastName(String adminLastName) {
        this.adminLastName = adminLastName;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public long getAdminPhone() {
        return adminPhone;
    }

    public void setAdminPhone(long adminPhone) {
        this.adminPhone = adminPhone;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getAdminSchool() {
        return adminSchool;
    }

    public void setAdminSchool(String adminSchool) {
        this.adminSchool = adminSchool;
    }

    public String getAdminCity() {
        return adminCity;
    }

    public void setAdminCity(String adminCity) {
        this.adminCity = adminCity;
    }

    public LocalDateTime getLastUpdatedDateTime() {
        return lastUpdatedDateTime;
    }

    public void setLastUpdatedDateTime(LocalDateTime lastUpdatedDateTime) {
        this.lastUpdatedDateTime = lastUpdatedDateTime;
    }

    public LocalDateTime getCreationDateTime() {
        return creationDateTime;
    }

    public void setCreationDateTime(LocalDateTime creationDateTime) {
        this.creationDateTime = creationDateTime;
    }


    public Set<Teacher> getTeacherSet() {
        return teacherSet;
    }

    public void setTeacherSet(Set<Teacher> teacherSet) {
        this.teacherSet = teacherSet;
    }
}
