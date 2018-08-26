package com.studentdiaries.springboot.Controller;


import com.studentdiaries.springboot.CustomModel.FeedbackStudentDetails;
import com.studentdiaries.springboot.Model.Admin;
import com.studentdiaries.springboot.Model.Feedback;
import com.studentdiaries.springboot.Model.Student;
import com.studentdiaries.springboot.Model.Teacher;
import com.studentdiaries.springboot.Service.AdminService;
import com.studentdiaries.springboot.Service.FeedbackService;
import com.studentdiaries.springboot.Service.StudentService;
import com.studentdiaries.springboot.Service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private FeedbackService feedbackService;


    //Teacher Login Page
    @RequestMapping(value = "/teacher/login")
    public String teacherLogin(HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            return "redirect:/teacher/dashboard";
        }

        return "TeacherLogin";
    }



    @PostMapping("/teacher/login/submit")
    public String teacherLoginSubmit(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session)
    {
        boolean check = teacherService.teacherLoginSubmit(email, password, session);

        if (check == true)
        {
            return "redirect:/teacher/dashboard";
        }
        else
        {
            session.setAttribute("TeacherLoginIncorrectCredentials", "Incorrect Credentials");
            return "redirect:/teacher/login";
        }

    }

    @RequestMapping("/TeacherLogout")
    public String adminLogout(HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            teacherService.removeTeacherSessions(session);
            return "redirect:/teacher/login";
        }
        return "redirect:/teacher/login";
    }


    //Teacher Signup Page
    @RequestMapping(value = "/teacher/signup")
    public String teacherSignup()
    {
        return "TeacherSignup";
    }

    //Save Teacher Model
    @PostMapping("/teacher/save")
    public String saveTeacher(@ModelAttribute Teacher teacher, BindingResult bindingResult, HttpSession session)
    {
        teacherService.saveTeacher(teacher);
        teacherService.setTeacherSession(session, teacher);
        return "redirect:/teacher/dashboard";
    }


    /*Teacher Dashboard*/
    @RequestMapping(value = "/teacher/dashboard")
    public String teacherDashboard(HttpSession session, HttpServletRequest request)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            request.setAttribute("count", teacherService.countStudents(session));
            return "TeacherDashboard";
        }

        return "redirect:/teacher/login";
    }


    /*Ajax for Teacher Admin Id DROPDOWN*/
    @ResponseBody
    @GetMapping("/teacher/adminid")
    public List<Integer> getTeacherAdminIds()
    {
        List<Integer> adminList = adminService.getTeacherAdminIds();
        return adminList;
    }


    /*Ajax for Teacher Admin School*/
    @ResponseBody
    @GetMapping("/teacher/adminschool")
    public String getTeacherAdminSchool(@RequestParam("adminId") Integer adminId, Admin admin)
    {
        admin.setAdminId(adminId);
        return adminService.getAdminSchoolName(admin.getAdminId());
    }



    @GetMapping("/teacher/students")
    public String findTeacherStudents(HttpSession session, HttpServletRequest request)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            request.setAttribute("students", studentService.getTeacherStudents(session));
            return "TeacherStudentUsers";
        }

        return "redirect:/teacher/login";

    }


    @RequestMapping("/teacher/student/signup")
    public String teacherStudentSignup(HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            return "TeacherStudentSignup";
        }
        return "redirect:/teacher/login";
    }


    @PostMapping("/teacher/student/save")
    public String saveTeacherStudent(@ModelAttribute Student student, HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            studentService.saveStudent(student);
            return "redirect:/teacher/students";
        }

        return "redirect:/teacher/login";
    }


    @PostMapping("/teacher/student/profile")
    public String teacherStudentProfile(@RequestParam("id") Integer id, HttpServletRequest request, HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            /*reuse of find method*/
            request.setAttribute("student", studentService.findAdminStudentProfile(id));
            return "TeacherStudentView";
        }
        return "redirect:/teacher/login";
    }


    @PostMapping("/teacher/student/delete")
    public String deleteTeacherStudents(@RequestParam("id") Integer[] id, HttpServletRequest request, HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            List<Student> students = studentService.deleteTeacherStudents(id, session);
            request.setAttribute("students", students);
            return "TeacherStudentDeletion";
        }
        return "redirect:/teacher/login";
    }


    @PostMapping("/teacher/student/feedback/form")
    public String teacherStudentFeedbackForm(@RequestParam("id") Integer id, HttpSession session, HttpServletRequest request)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            request.setAttribute("student", studentService.findAdminStudentProfile(id));
            return "TeacherStudentFeedback";
        }
        return "redirect:/teacher/login";
    }


    @PostMapping("/teacher/student/feedback/submit")
    public String teacherStudentFeedbackFormSubmit(@ModelAttribute Feedback feedback, HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            feedbackService.saveStudentFeedback(feedback);
            return "redirect:/teacher/students";
        }
        return "redirect:/teacher/login";
    }


    @RequestMapping(value = "/teacher/profile")
    public String teacherProfile(HttpServletRequest request, HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            Teacher teacher = teacherService.getAdminTeacher(Integer.parseInt(session.getAttribute("sessionteacherid").toString()));

            request.setAttribute("teacher", teacher);
            return "TeacherProfileSettings";
        }
        return "redirect:/teacher/login";
    }


    @GetMapping("/teacher/profile/update/form")
    public String teacherProfileUpdateForm(HttpSession session, HttpServletRequest request)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            Teacher teacher = teacherService.getAdminTeacher(Integer.parseInt(session.getAttribute("sessionteacherid").toString()));

            request.setAttribute("teacher", teacher);
            return "TeacherEditProfile";
        }
        return "redirect:/teacher/login";
    }


    @PostMapping("/teacher/profile/update/submit")
    public String teacherProfileUpdateSubmit(@ModelAttribute Teacher teacher, HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            teacherService.saveTeacher(teacher);
            return "redirect:/teacher/profile";
        }
        return "redirect:/teacher/login";
    }


    @RequestMapping(value = "/teacher/account/delete")
    public String deleteTeacher(HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            teacherService.deleteTeacherProfile(Integer.parseInt(session.getAttribute("sessionteacherid").toString()));

            teacherService.removeTeacherSessions(session);
            return "redirect:/teacher/signup";
        }
        return "redirect:/teacher/login";
    }


    @RequestMapping(value = "/teacher/calendar")
    public String teacherCalendar(HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            return "TeacherCalendar";
        }
        return "redirect:/teacher/login";
    }


    @RequestMapping(value = "/teacher/password/change")
    public String teacherPasswordChange(HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            return "TeacherChangePassword";
        }
        return "redirect:/teacher/login";
    }


    @PostMapping(value = "/teacher/password/change/submit")
    public String teacherChangePasswordSubmit(@RequestParam("oldpassword") String oldpassword, @RequestParam("password") String password, @RequestParam("verifypassword") String verifypassword, HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            Integer id = Integer.parseInt(session.getAttribute("sessionteacherid").toString());
            String pattern = teacherService.changeTeacherPasswordRequest(id, oldpassword, password, verifypassword, session);
            return "redirect:"+pattern;
        }

        return "redirect:/teacher/login";
    }



    @PostMapping("/teacher/student/feedback/report")
    public String getTeacherFeedbackReport(@RequestParam("date") Date date, @RequestParam("studentid") Integer id, HttpServletRequest request, FeedbackStudentDetails feedbackStudentDetails, HttpSession session)
    {
        boolean check = teacherService.teacherAuthenticate(session);

        if (check == true)
        {
            feedbackStudentDetails.setStudent(studentService.findAdminStudentProfile(id));
            feedbackStudentDetails.setFeedback(feedbackService.getFeedback(date, feedbackStudentDetails.getStudent().getStudentId()));

            request.setAttribute("studentfeedback", feedbackStudentDetails);
            return "TeacherCheckFeedback";
        }

        return "redirect:/teacher/login";
    }


    @ResponseBody
    @GetMapping("/teacher/pie/score")
    public Integer[] teacherStudentPieScore(HttpSession session)
    {
        return teacherService.getTeacherStudentScore(session);
    }


    @ResponseBody
    @PostMapping("/teacher/email/dbverification")
    public String teacherEmailDBVerification(@RequestParam("email") String email)
    {
        return teacherService.emailDbVerification(email);
    }


    @ResponseBody
    @PostMapping("/teacher/phone/dbverification")
    public String adminPhoneDBVerification(@RequestParam("phone") long phone)
    {
        return teacherService.phoneDbVerification(phone);
    }


}
