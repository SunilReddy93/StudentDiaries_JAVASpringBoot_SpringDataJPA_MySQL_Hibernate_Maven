package com.studentdiaries.springboot.Controller;

import com.studentdiaries.springboot.CustomModel.FeedbackStudentDetails;
import com.studentdiaries.springboot.Model.Feedback;
import com.studentdiaries.springboot.Model.Student;
import com.studentdiaries.springboot.Model.Teacher;
import com.studentdiaries.springboot.Service.FeedbackService;
import com.studentdiaries.springboot.Service.StudentService;
import com.studentdiaries.springboot.Service.TeacherService;
import org.apache.commons.lang.WordUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class StudentController
{
    @Autowired
    private StudentService studentService;


    @Autowired
    private FeedbackService feedbackService;


    @Autowired
    private TeacherService teacherService;


    @RequestMapping(value = "/student/login")
    public String studentLogin(HttpSession session)
    {
        boolean check = studentService.studentAuthenticate(session);
        if (check == true)
        {
            return "redirect:/student/dashboard";
        }
        return "StudentLogin";
    }



    @PostMapping("/student/login/submit")
    public String studentLoginSubmit(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session)
    {
        boolean check = studentService.studentLoginSubmit(email, password, session);

        if (check == true)
        {
            return "redirect:/student/dashboard";
        }
        else
        {
            session.setAttribute("StudentLoginIncorrectCredentials", "Incorrect Credentials");
            return "redirect:/student/login";
        }

    }


    @RequestMapping("/StudentLogout")
    public String adminLogout(HttpSession session)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            studentService.removeStudentSessions(session);
            return "redirect:/student/login";
        }
        return "redirect:/student/login";
    }



    @RequestMapping(value = "/student/signup")
    public String studentSignup()
    {
        return "StudentSignup";
    }


    @PostMapping("/student/save")
    public String saveStudent(@ModelAttribute Student student, BindingResult bindingResult, HttpSession session)
    {
        studentService.saveStudent(student);
        studentService.setStudentSessions(session, student);
        return "redirect:/student/dashboard";
    }

    @RequestMapping(value = "/student/dashboard")
    public String getTeacherDashboard(HttpSession session, HttpServletRequest request)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            request.setAttribute("count", studentService.countFeedbacks(session));
            return "StudentDashboard";
        }
        return "redirect:/student/login";
    }


    @RequestMapping("/student/datepick")
    public String studentDatePick(HttpSession session)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            return "StudentFeedbackDatePick";
        }
        return "redirect:/student/login";
    }

    @GetMapping("/student/profile")
    public String studentProfile(HttpSession session, HttpServletRequest request)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            Integer id = Integer.parseInt(session.getAttribute("sessionstudentid").toString());

            /*Reuse of previous code i.e findAdminStudentProfile*/
            request.setAttribute("student", studentService.findAdminStudentProfile(id));
            return "StudentProfile";
        }
        return "redirect:/student/login";
    }


    @GetMapping("/student/profile/update/form")
    public String studentProfileUpdate(HttpSession session, HttpServletRequest request)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            Integer id = Integer.parseInt(session.getAttribute("sessionstudentid").toString());

            /*Reuse of previous code i.e findAdminStudentProfile*/
            request.setAttribute("student", studentService.findAdminStudentProfile(id));

            return "StudentProfileUpdate";
        }
        return "redirect:/student/login";
    }


    @PostMapping("/student/profile/update/submit")
    public String studentUpdateSubmit(@ModelAttribute Student student, HttpSession session)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            studentService.saveStudent(student);
            return "redirect:/student/profile";
        }

        return "redirect:/student/login";
    }


    @RequestMapping(value = "/student/account/delete")
    public String deleteTeacherAccount(HttpSession session)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            Integer id = Integer.parseInt(session.getAttribute("sessionstudentid").toString());
            studentService.deleteStudentProfile(id);
            studentService.removeStudentSessions(session);
            return "redirect:/student/signup";
        }

        return "redirect:/student/login";
    }


    @RequestMapping(value = "/student/calendar")
    public String studentCalendar(HttpSession session)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            return "StudentCalendar";
        }
        return "redirect:/student/login";
    }


    @PostMapping("/student/feedback/report")
    public String getFeedbackReport(@RequestParam("date") Date date, HttpSession session, HttpServletRequest request, FeedbackStudentDetails feedbackStudentDetails)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            Integer id = Integer.parseInt(session.getAttribute("sessionstudentid").toString());

            feedbackStudentDetails.setStudent(studentService.findAdminStudentProfile(id));
            feedbackStudentDetails.setFeedback(feedbackService.getFeedback(date, feedbackStudentDetails.getStudent().getStudentId()));

            request.setAttribute("studentfeedback", feedbackStudentDetails);
            return "StudentCheckFeedback";
        }

        return "redirect:/student/login";
    }


    @RequestMapping(value = "/student/password/change")
    public String studentPasswordChange(HttpSession session)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            return "StudentChangePassword";
        }

        return "redirect:/student/login";
    }


    @PostMapping(value = "/student/password/change/submit")
    public String studentChangePasswordSubmit(@RequestParam("oldpassword") String oldpassword, @RequestParam("password") String password, @RequestParam("verifypassword") String verifypassword, HttpSession session)
    {
        boolean check = studentService.studentAuthenticate(session);

        if (check == true)
        {
            Integer id = Integer.parseInt(session.getAttribute("sessionstudentid").toString());
            String pattern = studentService.changePasswordRequest(id, oldpassword, password, verifypassword, session);
            return "redirect:"+pattern;
        }

        return "redirect:/student/login";
    }



    /*Ajax for Getting Teacher IDs for Student Signup*/
    @ResponseBody
    @GetMapping("/ajax/student/teacher/id")
    public List<Integer> getStudentTeacherIds()
    {
        List<Integer> teacherIds = studentService.getStudentTeacherIds();
        return teacherIds;
    }


    /*Ajax for Getting Teacher Course for Student Signup*/
    @ResponseBody
    @GetMapping("/ajax/student/teacher/course")
    public String getStudentTeacherCourse(@RequestParam("id") Integer id)
    {
        /*Reuse of getAdminTeacher Method*/
        Teacher teacher = teacherService.getAdminTeacher(id);
        return WordUtils.capitalizeFully(teacher.getTeacherCourse());
    }

    /*Ajax for Getting Teacher School for Student Signup*/
    @ResponseBody
    @GetMapping("/ajax/student/teacher/school")
    public String getStudentTeacherSchool(@RequestParam("id") Integer id)
    {
        /*Reuse of getAdminTeacher Method*/
        Teacher teacher = teacherService.getAdminTeacher(id);
        return WordUtils.capitalizeFully(teacher.getTeacherSchool());
    }



    @ResponseBody
    @GetMapping("/student/feedback/scores")
    public List<Feedback> getStudentFeedbackScores(HttpSession session)
    {
        List<Feedback> feedbacks = studentService.studentFeedbackScores(session);
        return feedbacks;
    }


    @ResponseBody
    @GetMapping("/student/feedback/attendance")
    public Integer[] getStudentAttendance(HttpSession session)
    {
        Integer[] attendance = studentService.studentAttendanceScore(session);
        return attendance;
    }


    @ResponseBody
    @PostMapping("/student/email/dbverification")
    public String studentEmailDBVerification(@RequestParam("email") String email)
    {
        return studentService.emailDbVerification(email);
    }


    @ResponseBody
    @PostMapping("/student/phone/dbverification")
    public String studentPhoneDBVerification(@RequestParam("phone") long phone)
    {
        return studentService.phoneDbVerification(phone);
    }


    @ResponseBody
    @PostMapping("/student/parent/email/dbverification")
    public String studentParentEmailDBVerification(@RequestParam("email") String email)
    {
        return studentService.parentEmailDbVerification(email);
    }


    @ResponseBody
    @PostMapping("/student/parent/phone/dbverification")
    public String studentParentPhoneDBVerification(@RequestParam("phone") long phone)
    {
        return studentService.parentPhoneDbVerification(phone);
    }



}
