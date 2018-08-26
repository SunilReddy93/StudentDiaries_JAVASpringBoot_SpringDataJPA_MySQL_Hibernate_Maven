package com.studentdiaries.springboot.Model;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "teacher_user")
public class Teacher
{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int teacherId;

    @Column(name = "teacher_first_name", nullable = false)
    private String teacherFirstName;

    @Column(name = "teacher_last_name", nullable = false)
    private String teacherLastName;

    @Column(name = "teacher_email", nullable = false, unique = true)
    private String teacherEmail;

    @Column(name = "teacher_password", nullable = false)
    private String teacherPassword;

    @Column(name = "teacher_phone", nullable = false, unique = true)
    private long teacherPhone;

    @Column(name = "teacher_school", nullable = false)
    private String teacherSchool;

    @Column(name = "teacher_course", nullable = false)
    private String teacherCourse;

    //FOREIGN KEY FROM ADMIN TABLE
    private int adminId;

    @UpdateTimestamp
    @Column(name = "last_updated_date_time")
    private LocalDateTime lastUpdatedDateTime;

    @CreationTimestamp
    @Column(name = "creation_date_time")
    private LocalDateTime creationDateTime;

    @OneToMany(targetEntity = Student.class, cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumn(name = "teacherId", referencedColumnName = "teacherId", insertable = false, updatable = false)
    private Set<Student> studentSet;


    @OneToMany(targetEntity = Feedback.class, cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumn(name = "teacherId", referencedColumnName = "teacherId")
    private Set<Feedback> feedbackSet;



    /*CONSTRUCTOR*/

    public Teacher() {
    }


    /*PARAMETERIZED CONSTRUCTOR*/

    public Teacher(String teacherFirstName, String teacherLastName, String teacherEmail, String teacherPassword, long teacherPhone, String teacherSchool, String teacherCourse, LocalDateTime lastUpdatedDateTime, LocalDateTime creationDateTime, Set<Student> studentSet, Set<Feedback> feedbackSet, int adminId) {
        this.teacherFirstName = teacherFirstName;
        this.teacherLastName = teacherLastName;
        this.teacherEmail = teacherEmail;
        this.teacherPassword = teacherPassword;
        this.teacherPhone = teacherPhone;
        this.teacherSchool = teacherSchool;
        this.teacherCourse = teacherCourse;
        this.lastUpdatedDateTime = lastUpdatedDateTime;
        this.creationDateTime = creationDateTime;
        this.studentSet = studentSet;
        this.feedbackSet = feedbackSet;
        this.adminId = adminId;
    }

    /*TOSTRING*/

    @Override
    public String toString() {
        return "Teacher{" +
                "teacherId=" + teacherId +
                ", teacherFirstName='" + teacherFirstName + '\'' +
                ", teacherLastName='" + teacherLastName + '\'' +
                ", teacherEmail='" + teacherEmail + '\'' +
                ", teacherPassword='" + teacherPassword + '\'' +
                ", teacherPhone=" + teacherPhone +
                ", teacherSchool='" + teacherSchool + '\'' +
                ", teacherCourse='" + teacherCourse + '\'' +
                ", lastUpdatedDateTime=" + lastUpdatedDateTime +
                ", creationDateTime=" + creationDateTime +
                ", studentSet=" + studentSet +
                ", feedbackSet=" + feedbackSet +
                ", adminId=" + adminId +
                '}';
    }

    /*SETTERS AND GETTERS*/
    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherFirstName() {
        return teacherFirstName;
    }

    public void setTeacherFirstName(String teacherFirstName) {
        this.teacherFirstName = teacherFirstName;
    }

    public String getTeacherLastName() {
        return teacherLastName;
    }

    public void setTeacherLastName(String teacherLastName) {
        this.teacherLastName = teacherLastName;
    }

    public String getTeacherEmail() {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail;
    }

    public String getTeacherPassword() {
        return teacherPassword;
    }

    public void setTeacherPassword(String teacherPassword) {
        this.teacherPassword = teacherPassword;
    }

    public long getTeacherPhone() {
        return teacherPhone;
    }

    public void setTeacherPhone(long teacherPhone) {
        this.teacherPhone = teacherPhone;
    }

    public String getTeacherSchool() {
        return teacherSchool;
    }

    public void setTeacherSchool(String teacherSchool) {
        this.teacherSchool = teacherSchool;
    }

    public String getTeacherCourse() {
        return teacherCourse;
    }

    public void setTeacherCourse(String teacherCourse) {
        this.teacherCourse = teacherCourse;
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

    public Set<Student> getStudentSet() {
        return studentSet;
    }

    public void setStudentSet(Set<Student> studentSet) {
        this.studentSet = studentSet;
    }

    public Set<Feedback> getFeedbackSet() {
        return feedbackSet;
    }

    public void setFeedbackSet(Set<Feedback> feedbackSet) {
        this.feedbackSet = feedbackSet;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }
}
