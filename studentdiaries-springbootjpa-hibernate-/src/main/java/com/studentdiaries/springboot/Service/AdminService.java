package com.studentdiaries.springboot.Service;

import com.studentdiaries.springboot.Model.Admin;
import com.studentdiaries.springboot.Model.Teacher;
import com.studentdiaries.springboot.Repository.AdminRepository;
import com.studentdiaries.springboot.Repository.FeedbackRepository;
import com.studentdiaries.springboot.Repository.TeacherRepository;
import org.apache.commons.lang.WordUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;


    @Autowired
    private TeacherRepository teacherRepository;

    @Autowired
    private FeedbackRepository feedbackRepository;


    public void saveAdmin(Admin admin)
    {
        adminRepository.save(admin);
    }

    /*Ajax for Teacher Admin id*/
    public List<Integer> getTeacherAdminIds()
    {
        List<Admin> adminList = adminRepository.findAll();
        ArrayList<Integer> admins = new ArrayList<>();
        for (int i = 0; i < adminList.size(); i++)
        {
            admins.add(adminList.get(i).getAdminId());

        }
        return admins;
    }

    /*Ajax for Teacher Admin School*/
    public String getAdminSchoolName(int id)
    {
        Admin admin = adminRepository.findAdminByAdminId(id);
        return WordUtils.capitalizeFully(admin.getAdminSchool());
    }


    /*Session Management for General Admin Use*/
    public void setAdminSession(HttpSession session, Admin admin)
    {
        session.setAttribute("sessionadminfirstname", admin.getAdminFirstName());
        session.setAttribute("sessionadminlastname", admin.getAdminLastName());
        session.setAttribute("sessionadminid", admin.getAdminId());
    }



    /*get Admin by ID for Profile*/
    public Admin getAdminProfile(Integer id)
    {
        Admin admin = adminRepository.findAdminByAdminId(id);
        return admin;
    }


    /*Update Admin Profile*/
    public void updateAdminProfile(Admin admin)
    {
        adminRepository.save(admin);
    }


    /*Delete Admin Account*/
    public void deleteAdminAccount(Integer id)
    {
        adminRepository.deleteById(id);
    }

    /*Remove All Sessions after Deletion of Admin Account*/
    public void removeSessions(HttpSession session)
    {

            session.removeAttribute("sessionadminfirstname");
            session.removeAttribute("sessionadminlastname");
            session.removeAttribute("sessionadminid");

            if (session.getAttribute("temp_teacher_id") != null)
            {
                session.removeAttribute("temp_teacher_id");
            }

            if (session.getAttribute("LoginIncorrectCredentials") != null)
            {
                session.removeAttribute("LoginIncorrectCredentials");
            }


    }



    public String changeAdminPasswordRequest(Integer id, String oldpassword, String password, String verifypassword, HttpSession session)
    {
        try
        {
            Admin admin = this.getAdminProfile(id);

            if (admin.getAdminPassword().equals(oldpassword))
            {
                if (password.length() >= 6)
                {

                    if (password.equals(verifypassword))
                    {

                        if (!password.equals(oldpassword))
                        {
                            admin.setAdminPassword(password);
                            adminRepository.save(admin);

                            session.setAttribute("PasswordChangeSuccess", "Password Successfully Changed");

                            return "/admin/login";


                        }
                        else
                        {
                            session.setAttribute("MatchingOldNewPasswords", "Old and new passwords must be different.");
                            return "/admin/password/change";

                        }

                    }
                    else
                    {
                        session.setAttribute("NonMatchingNewPasswords", "New Password entries do no match.");
                        return "/admin/password/change";
                    }


                }
                else
                {
                    session.setAttribute("Atleast6Characters", "Password must have at least 6 characters");
                    return "/admin/password/change";
                }

            }
            else
            {
                session.setAttribute("IncorrectOldPassword", "Incorrect Current Password");
                return "/admin/password/change";
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return "/admin/password/change";

    }


    public boolean adminLoginSubmit(String username, String password, HttpSession session)
    {
        boolean check = false;

        Admin admin = adminRepository.findAdminByAdminEmailAndAdminPassword(username, password);

        if (admin != null)
        {
            this.setAdminSession(session, admin);
            check = true;
        }

        return check;
    }



    public boolean adminAuthenticate(HttpSession session)
    {
        boolean check = false;


        if (session.getAttribute("sessionadminid") != null)
        {
            check = true;
        }

        return check;
    }



    public List<Object> getAdminTeacherScore(HttpSession session)
    {
        Integer id = Integer.parseInt(session.getAttribute("sessionadminid").toString());
        List<Teacher> teachers = teacherRepository.findTop10ByAdminId(id);


        List<Object> feedbacks = new ArrayList<>();

        for (int i = 0; i < teachers.size(); i++) {

            Object feedback = feedbackRepository.findByTeacherId(teachers.get(i).getTeacherId());
            feedbacks.add(feedback);

        }

        return feedbacks;
    }


    public Integer adminTeacherCount(HttpSession session)
    {
        Integer id = Integer.parseInt(session.getAttribute("sessionadminid").toString());
        return teacherRepository.countAllByAdminId(id);
    }

    public String emailDbVerification(String email)
    {
        if (adminRepository.findByAdminEmail(email) != null)
        {
            return "Hmm... Email already in use";
        }
        return null;
    }


    public String phoneDbVerification(long phone)
    {
        if (adminRepository.findByAdminPhone(phone) != null)
        {
            return "Hmm... Phone No. already in use";
        }
        return null;
    }


}
