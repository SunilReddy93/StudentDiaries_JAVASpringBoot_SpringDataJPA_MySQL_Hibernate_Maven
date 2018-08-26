package com.studentdiaries.springboot.CustomModel;

import com.studentdiaries.springboot.Model.Feedback;
import com.studentdiaries.springboot.Model.Student;
import org.springframework.beans.factory.annotation.Autowired;

public class FeedbackStudentDetails {

    @Autowired
    private Student student;

    @Autowired
    private Feedback feedback;

    public FeedbackStudentDetails() {
    }



    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }
}
