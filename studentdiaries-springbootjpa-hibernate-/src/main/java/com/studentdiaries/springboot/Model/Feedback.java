package com.studentdiaries.springboot.Model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "feedback_table")
public class Feedback {


    @Id
    @Column(name = "feedback_date")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Temporal(TemporalType.DATE)
    private java.util.Date feedbackDate;

    @Column(name = "attendance", nullable = false)
    private String attendance;

    @Column(name = "performance", nullable = false)
    private int performance;

    @Column(name = "behaviour", nullable = false)
    private int behaviour;

    @Column(name = "improvement", nullable = false)
    private int improvement;

    @Column(name = "remark", nullable = false, length = 300)
    private String remark;

    //Foreign Key From Teacher Table
    private int teacherId;

    //Foreign Key from Student table
    private int studentId;

    /*CONSTRUCTOR*/

    public Feedback() {
    }


    /*PARAMETERIAZED CONSTRUCTOR*/

    public Feedback(Date feedbackDate, String attendance, int performance, int behaviour, int improvement, String remark, int teacherId, int studentId) {
        this.feedbackDate = feedbackDate;
        this.attendance = attendance;
        this.performance = performance;
        this.behaviour = behaviour;
        this.improvement = improvement;
        this.remark = remark;
        this.teacherId = teacherId;
        this.studentId = studentId;
    }

    /*TOSTRING*/

    @Override
    public String toString() {
        return "Feedback{" +
                "feedbackDate=" + feedbackDate +
                ", attendance='" + attendance + '\'' +
                ", performance=" + performance +
                ", behaviour=" + behaviour +
                ", improvement=" + improvement +
                ", remark='" + remark + '\'' +
                ", teacherId=" + teacherId +
                ", studentId=" + studentId +
                '}';
    }

    /*SETTERS AND GETTERS*/
    public java.util.Date getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(java.util.Date feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public String getAttendance() {
        return attendance;
    }

    public void setAttendance(String attendance) {
        this.attendance = attendance;
    }

    public int getPerformance() {
        return performance;
    }

    public void setPerformance(int performance) {
        this.performance = performance;
    }

    public int getBehaviour() {
        return behaviour;
    }

    public void setBehaviour(int behaviour) {
        this.behaviour = behaviour;
    }

    public int getImprovement() {
        return improvement;
    }

    public void setImprovement(int improvement) {
        this.improvement = improvement;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }


    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }
}
