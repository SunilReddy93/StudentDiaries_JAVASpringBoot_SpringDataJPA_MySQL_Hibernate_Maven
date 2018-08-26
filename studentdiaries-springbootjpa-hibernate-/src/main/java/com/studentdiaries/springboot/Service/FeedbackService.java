package com.studentdiaries.springboot.Service;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.studentdiaries.springboot.CustomModel.SendMail;
import com.studentdiaries.springboot.Model.Feedback;
import com.studentdiaries.springboot.Model.Student;
import com.studentdiaries.springboot.Repository.FeedbackRepository;
import com.studentdiaries.springboot.Repository.StudentRepository;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Service
@Transactional
public class FeedbackService {

    @Autowired
    private FeedbackRepository feedbackRepository;


    @Autowired
    private StudentRepository studentRepository;


    @Autowired ServletContext servletContext;


    public void saveStudentFeedback(Feedback feedback)
    {
        Feedback feedback1 = feedbackRepository.save(feedback);

        try {

            if (feedback1 != null) {
                Student student = studentRepository.findByStudentId(feedback.getStudentId());

                if (student != null) {
                    SimpleDateFormat dateformat = new SimpleDateFormat("E, dd MMM yyyy");
                    String desireddate = dateformat.format(feedback1.getFeedbackDate());


                    /*Preparing to set path*/
                    /*Preparing the creation of PDF DOCUMENT*/
                    Document document = new Document();
                    PdfWriter.getInstance(document, new FileOutputStream(servletContext.getRealPath("/static/Documents/StudentDiariesFeedback.pdf")));


                    document.open();
                    document.add(new Paragraph(StringUtils.capitalize(student.getStudentFirstName()) + " " + StringUtils.capitalize(student.getStudentLastName() + "'s Feedback for " + desireddate)));
                    document.add(new Paragraph("Feedback Updated by Teacher ID: " + feedback1.getTeacherId()));

                    document.add(new Paragraph("Attendance: " + StringUtils.capitalize(feedback1.getAttendance()) + ","));
                    document.add(new Paragraph("Performance: " + feedback1.getPerformance() + "/10,"));
                    document.add(new Paragraph("Behaviour: " + feedback1.getBehaviour() + "/10,"));
                    document.add(new Paragraph("Improvement: " + feedback1.getImprovement() + "/10,"));
                    document.add(new Paragraph("Remark: " + feedback1.getRemark()));
                    document.close();


                    /***************************************************************************************************/
                    /*EMAIL SECTION*/
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("E, dd MMM yyyy HH:mm:ss");
                    LocalDateTime todaydate = LocalDateTime.now();


                    /*FOR SENDING EMAIL*/
                    String to = student.getParentEmail();
                    String subject = StringUtils.capitalize(student.getStudentFirstName()) + " " + StringUtils.capitalize(student.getStudentLastName()) + " - Teacher Feedback as updated on " + dtf.format(todaydate);
                    String message = "Dear Parent, \n\nPlease find attachment. \n\nRegards, \n\nStudentDiaries 2018";

                    String filename = servletContext.getRealPath("/static/Documents/StudentDiariesFeedback.pdf");
                    String user = "studentdiaries2018@gmail.com";
                    String password = "imsd@2018";
                    SendMail.send(to, subject, message, filename, user, password);
                    // System.out.println("Mail SuccessFully Sent");

                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }


    public Feedback getFeedback(Date date, Integer id)
    {
        return feedbackRepository.findByFeedbackDateAndStudentId(date, id);
    }


}
