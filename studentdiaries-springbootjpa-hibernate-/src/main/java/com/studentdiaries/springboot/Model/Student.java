package com.studentdiaries.springboot.Model;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "student_user")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int studentId;

    @Column(name = "student_first_name", nullable = false)
    private String studentFirstName;

    @Column(name = "student_last_name", nullable = false)
    private String studentLastName;

    @Column(name = "rollno",nullable = false)
    private int rollno;

    @Column(name = "student_father_name", nullable = false)
    private String studentFatherName;

    @Column(name = "student_mother_name", nullable = false)
    private String studentMotherName;

    @Column(name = "student_email", nullable = false, unique = true)
    private String studentEmail;

    @Column(name = "parent_email", nullable = false, unique = true)
    private String parentEmail;

    @Column(name = "student_phone", nullable = false, unique = true)
    private long studentPhone;

    @Column(name = "parent_phone", nullable = false, unique = true)
    private long parentPhone;

    @Column(name = "student_password", nullable = false)
    private String studentPassword;

    @Column(name = "student_course", nullable = false)
    private String studentCourse;

    @Column(name = "year", nullable = false)
    private int year;

    @Column(name = "student_school", nullable = false)
    private String studentSchool;

    //Foreign Key From Teacher Table
    private int teacherId;


    @UpdateTimestamp
    @Column(name = "last_updated_date_time")
    private LocalDateTime lastUpdatedDateTime;

    @CreationTimestamp
    @Column(name = "creation_date_time")
    private LocalDateTime creationDateTime;

    @OneToMany(targetEntity = Feedback.class, cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumn(name = "studentId", referencedColumnName = "studentId", insertable = false, updatable = false)
    private Set<Feedback> feedbackSet;


    /*CONSTRUCTOR*/

    public Student() {
    }


    /*PARAMETERIAZED CONSTRUCTOR*/

    public Student(String studentFirstName, String studentLastName, int rollno, String studentFatherName, String studentMotherName, String studentEmail, String parentEmail, long studentPhone, long parentPhone, String studentPassword, String studentCourse, int year, String studentSchool, int teacherId, LocalDateTime lastUpdatedDateTime, LocalDateTime creationDateTime, Set<Feedback> feedbackSet) {
        this.studentFirstName = studentFirstName;
        this.studentLastName = studentLastName;
        this.rollno = rollno;
        this.studentFatherName = studentFatherName;
        this.studentMotherName = studentMotherName;
        this.studentEmail = studentEmail;
        this.parentEmail = parentEmail;
        this.studentPhone = studentPhone;
        this.parentPhone = parentPhone;
        this.studentPassword = studentPassword;
        this.studentCourse = studentCourse;
        this.year = year;
        this.studentSchool = studentSchool;
        this.teacherId = teacherId;
        this.lastUpdatedDateTime = lastUpdatedDateTime;
        this.creationDateTime = creationDateTime;
        this.feedbackSet = feedbackSet;
    }

    /*TOSTRING*/

    @Override
    public String toString() {
        return "Student{" +
                "studentId=" + studentId +
                ", studentFirstName='" + studentFirstName + '\'' +
                ", studentLastName='" + studentLastName + '\'' +
                ", rollno=" + rollno +
                ", studentFatherName='" + studentFatherName + '\'' +
                ", studentMotherName='" + studentMotherName + '\'' +
                ", studentEmail='" + studentEmail + '\'' +
                ", parentEmail='" + parentEmail + '\'' +
                ", studentPhone=" + studentPhone +
                ", parentPhone=" + parentPhone +
                ", studentPassword='" + studentPassword + '\'' +
                ", studentCourse='" + studentCourse + '\'' +
                ", year=" + year +
                ", studentSchool='" + studentSchool + '\'' +
                ", teacherId=" + teacherId +
                ", lastUpdatedDateTime=" + lastUpdatedDateTime +
                ", creationDateTime=" + creationDateTime +
                ", feedbackSet=" + feedbackSet +
                '}';
    }

    /*SETTERS AND GETTERS*/
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentFirstName() {
        return studentFirstName;
    }

    public void setStudentFirstName(String studentFirstName) {
        this.studentFirstName = studentFirstName;
    }

    public String getStudentLastName() {
        return studentLastName;
    }

    public void setStudentLastName(String studentLastName) {
        this.studentLastName = studentLastName;
    }

    public int getRollno() {
        return rollno;
    }

    public void setRollno(int rollno) {
        this.rollno = rollno;
    }

    public String getStudentFatherName() {
        return studentFatherName;
    }

    public void setStudentFatherName(String studentFatherName) {
        this.studentFatherName = studentFatherName;
    }

    public String getStudentMotherName() {
        return studentMotherName;
    }

    public void setStudentMotherName(String studentMotherName) {
        this.studentMotherName = studentMotherName;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getParentEmail() {
        return parentEmail;
    }

    public void setParentEmail(String parentEmail) {
        this.parentEmail = parentEmail;
    }

    public long getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(long studentPhone) {
        this.studentPhone = studentPhone;
    }

    public long getParentPhone() {
        return parentPhone;
    }

    public void setParentPhone(long parentPhone) {
        this.parentPhone = parentPhone;
    }

    public String getStudentPassword() {
        return studentPassword;
    }

    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword;
    }

    public String getStudentCourse() {
        return studentCourse;
    }

    public void setStudentCourse(String studentCourse) {
        this.studentCourse = studentCourse;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getStudentSchool() {
        return studentSchool;
    }

    public void setStudentSchool(String studentSchool) {
        this.studentSchool = studentSchool;
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


    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public Set<Feedback> getFeedbackSet() {
        return feedbackSet;
    }

    public void setFeedbackSet(Set<Feedback> feedbackSet) {
        this.feedbackSet = feedbackSet;
    }
}
