package com.studentdiaries.springboot.Controller;

import com.studentdiaries.springboot.CustomModel.FeedbackStudentDetails;
import com.studentdiaries.springboot.Model.Admin;
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
public class AdminController
{
    @Autowired
    private AdminService adminService;


    @Autowired
    private TeacherService teacherService;


    @Autowired
    private StudentService studentService;


    @Autowired
    private FeedbackService feedbackService;


    @RequestMapping(value = "/admin/login")
    public String adminLogin(HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            return "redirect:admin/dashboard";
        }

        return "AdminLogin";
    }


    @PostMapping("/admin/login/submit")
    public String adminLoginSubmit(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session)
    {
            boolean check = adminService.adminLoginSubmit(email, password, session);

            if (check == true)
            {
                return "redirect:/admin/dashboard";
            }
            else
            {
                session.setAttribute("LoginIncorrectCredentials", "Incorrect Credentials");
                return "redirect:/admin/login";
            }

    }



    @RequestMapping("/AdminLogout")
    public String adminLogout(HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            adminService.removeSessions(session);
            return "redirect:/admin/login";
        }
        return "redirect:/admin/login";
    }


    @RequestMapping(value = "/admin/signup")
    public String adminSignup()
    {

        return "AdminSignup";
    }



    @PostMapping("/admin/save")
    public String saveAdmin(@ModelAttribute("admin") Admin admin, HttpSession session)
    {
        adminService.saveAdmin(admin);
        adminService.setAdminSession(session, admin);
        return "redirect:/admin/dashboard";
    }



    /*Save Admin Tecaher*/
    @PostMapping("/admin/teacher/save")
    public String saveAdminTeacher(@ModelAttribute Teacher teacher, BindingResult bindingResult, HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            teacherService.saveTeacher(teacher);
            return "redirect:/admin/teachers";
        }

        return "redirect:/admin/login";

    }



    /*Mapping For Adding new Teacher under Admin*/
    @RequestMapping(value = "/admin/teacher/signup")
    public String adminTeacherSignup(HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            return "AdminTeacherSignup";
        }

        return "redirect:/admin/login";

    }




    @RequestMapping(value = "/admin/dashboard")
    public String adminDashboard(HttpSession session, HttpServletRequest request)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            request.setAttribute("count", adminService.adminTeacherCount(session));
            return "AdminDashboard";
        }

        return "redirect:/admin/login";

    }




    /*Get All Admin related teachers*/
    @GetMapping("/admin/teachers")
    public String getAdminTeacherList(HttpSession session, Admin admin, HttpServletRequest request)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            admin.setAdminId(Integer.parseInt(session.getAttribute("sessionadminid").toString()));
            request.setAttribute("teachers", teacherService.getAdminTeachers(admin.getAdminId()));
            return "AdminTeacherUsers";
        }

        return "redirect:/admin/login";

    }




    /*Get Teacher under Admin using teacherID*/
    @PostMapping("/admin/teacher/user")
    public String getAdminTeacher(@RequestParam("id") Integer teacherId, HttpServletRequest request, HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            request.setAttribute("teacher", teacherService.getAdminTeacher(teacherId));
            return "AdminTeacherView";
        }

        return "redirect:/admin/login";

    }


    /*Delete Teachers Under Admin by Admin*/
    @PostMapping("/admin/teacher/delete")
    public String deleteAdminTeachers(@RequestParam("id2") Integer[] id, HttpSession session, HttpServletRequest request)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            teacherService.deleteTeacherByAdmin(id);
            request.setAttribute("teacherIds", teacherService.getAdminTeachers(Integer.parseInt(session.getAttribute("sessionadminid").toString())));
            return "AdminTeacherDeletion";
        }

        return "redirect:/admin/login";

    }


    /*Check Students under teachers of admin by admin*/
    @GetMapping("/admin/teachers/students")
    public String adminTeacherStudents(Admin admin, HttpSession session, HttpServletRequest request)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            admin.setAdminId(Integer.parseInt(session.getAttribute("sessionadminid").toString()));
            request.setAttribute("teachers", teacherService.getAdminTeachers(admin.getAdminId()));
            return "AdminTeacherStudentSelection";
        }

        return "redirect:/admin/login";
    }


    /*Find Students Using Teacher Id For Admin*/
    @PostMapping(value = "/admin/students")
    public String getAdminStudents(@RequestParam("id") Integer id, HttpSession session, HttpServletRequest request)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            request.setAttribute("students", studentService.getAdminStudents(id, session));
            return "AdminStudentUsers2";
        }

        return "redirect:/admin/login";
    }


    /*Admin Student Signup*/
    @RequestMapping(value = "/admin/student/signup")
    public String adminStudentSignup(HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            return "AdminStudentSignup";
        }

        return "redirect:/admin/login";
    }


    /*Save Admin Student*/
    @PostMapping("/admin/student/save")
    public String saveAdminStudent(@ModelAttribute Student student, HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            studentService.saveAdminStudent(student);
            return "redirect:/admin/teachers/students";
        }
        return "redirect:/admin/login";

    }

    /*Show Admin Student Profile*/
    @PostMapping("/admin/student/profile")
    public String showAdminStudentProfile(@RequestParam("id") Integer id, HttpServletRequest request, HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            request.setAttribute("student", studentService.findAdminStudentProfile(id));
            return "AdminStudentView";
        }

        return "redirect:/admin/login";

    }


    @PostMapping("/admin/student/delete")
    public String deleteAdminStudents(@RequestParam("id") Integer[] id, HttpServletRequest request, HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            request.setAttribute("students", studentService.deleteAdminStudents(id, session));
            return "AdminStudentDeletion";
        }


        return "redirect:/admin/login";

    }


    @GetMapping("/admin/profile")
    public String adminProfile(HttpSession session, HttpServletRequest request)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            Admin admin = adminService.getAdminProfile(Integer.parseInt(session.getAttribute("sessionadminid").toString()));

            request.setAttribute("admin", admin);
            return "AdminProfileSettings";
        }

        return "redirect:/admin/login";

    }


    @GetMapping("admin/profile/updateform")
    public String adminProfileUpdateForm(HttpSession session, HttpServletRequest request)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            Admin admin = adminService.getAdminProfile(Integer.parseInt(session.getAttribute("sessionadminid").toString()));

            request.setAttribute("admin", admin);
            return "AdminEditProfile";
        }

        return "redirect:/admin/login";

    }


    @PostMapping("/admin/profile/edit")
    public String updateAdminProfile(@ModelAttribute Admin admin, BindingResult bindingResult, HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            adminService.updateAdminProfile(admin);
            return "redirect:/admin/profile";
        }

        return "redirect:/admin/login";
    }



    /*Delete Admin Account*/
    @RequestMapping(value = "/admin/account/delete")
    public String deleteAdmin(HttpSession session)
    {

        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            adminService.deleteAdminAccount(Integer.parseInt(session.getAttribute("sessionadminid").toString()));

            adminService.removeSessions(session);
            return "redirect:/admin/signup";
        }

        return "redirect:/admin/login";
    }


    @RequestMapping(value = "/admin/calender")
    public String adminCalender(HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            return "AdminCalendar";
        }

        return "redirect:/admin/login";
    }


    @RequestMapping(value = "/admin/password/change")
    public String adminPasswordChange(HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            return "AdminChangePassword";
        }

        return "redirect:/admin/login";
    }


    @PostMapping(value = "/admin/password/change/submit")
    public String adminChangePasswordSubmit(@RequestParam("oldpassword") String oldpassword, @RequestParam("password") String password, @RequestParam("verifypassword") String verifypassword, HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            Integer id = Integer.parseInt(session.getAttribute("sessionadminid").toString());
            String pattern = adminService.changeAdminPasswordRequest(id, oldpassword, password, verifypassword, session);

            return "redirect:"+pattern;
        }

        return "redirect:/admin/login";
    }



    @PostMapping("/admin/student/feedback/report")
    public String getAdminStudentFeedbackReport(@RequestParam("datepicker") Date date,@RequestParam("studentid") Integer id, HttpServletRequest request, FeedbackStudentDetails feedbackStudentDetails, HttpSession session)
    {
        boolean check = adminService.adminAuthenticate(session);

        if (check == true)
        {
            feedbackStudentDetails.setStudent(studentService.findAdminStudentProfile(id));
            feedbackStudentDetails.setFeedback(feedbackService.getFeedback(date, feedbackStudentDetails.getStudent().getStudentId()));

            request.setAttribute("studentfeedback", feedbackStudentDetails);
            return "AdminCheckFeedback";
        }

        return "redirect:/admin/login";
    }


    @ResponseBody
    @GetMapping("/admin/teacher/score")
    public List<Object> adminTeacherScore(HttpSession session)
    {
        return adminService.getAdminTeacherScore(session);
    }


    @ResponseBody
    @PostMapping("/admin/email/dbverification")
    public String adminEmailDBVerification(@RequestParam("email") String email)
    {
        return adminService.emailDbVerification(email);
    }


    @ResponseBody
    @PostMapping("/admin/phone/dbverification")
    public String adminPhoneDBVerification(@RequestParam("phone") long phone)
    {
        return adminService.phoneDbVerification(phone);
    }


}
