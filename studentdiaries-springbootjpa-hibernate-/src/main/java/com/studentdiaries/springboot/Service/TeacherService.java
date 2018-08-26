package com.studentdiaries.springboot.Service;

import com.studentdiaries.springboot.Model.Feedback;
import com.studentdiaries.springboot.Model.Teacher;
import com.studentdiaries.springboot.Repository.FeedbackRepository;
import com.studentdiaries.springboot.Repository.StudentRepository;
import com.studentdiaries.springboot.Repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.List;


@Service
@Transactional
public class TeacherService {

    @Autowired
    private TeacherRepository teacherRepository;

    @Autowired
    private FeedbackRepository feedbackRepository;

    @Autowired
    private StudentRepository studentRepository;


    public void saveTeacher(Teacher teacher)
    {
        teacherRepository.save(teacher);
    }

    /*Get All Teachers Under Admin*/
    public List<Teacher> getAdminTeachers(int adminId)
    {
        List<Teacher> teacherList = teacherRepository.findAllByAdminId(adminId);
        return teacherList;
    }

    /*Get One Teacher using ID*/
    public Teacher getAdminTeacher(int id)
    {
        return teacherRepository.findByTeacherId(id);

    }


    /*Delete Teachers By Admin*/
    public void deleteTeacherByAdmin(Integer[] id)
    {
        for (int i = 0; i < id.length; i++)
        {
            teacherRepository.deleteById(id[i]);
        }

    }



    /*Session Management for General Teacher Use*/
    public void setTeacherSession(HttpSession session, Teacher teacher)
    {
        session.setAttribute("sessionteacherfirstname", teacher.getTeacherFirstName());
        session.setAttribute("sessionteacherlastname", teacher.getTeacherLastName());
        session.setAttribute("sessionteacherid", teacher.getTeacherId());
    }



    /*Remove Teacher Sessions*/
    public void removeTeacherSessions(HttpSession session)
    {
        session.removeAttribute("sessionteacherfirstname");
        session.removeAttribute("sessionteacherlastname");

        if (session.getAttribute("TeacherLoginIncorrectCredentials") != null)
        {
            session.removeAttribute("TeacherLoginIncorrectCredentials");
        }

        if (session.getAttribute("sessionteacherid") != null)
        {
            session.removeAttribute("sessionteacherid");
        }


    }

    /*Delete Teacher Account*/
    public void deleteTeacherProfile(Integer id)
    {
        teacherRepository.deleteById(id);
    }



    public String changeTeacherPasswordRequest(Integer id, String oldpassword, String password, String verifypassword, HttpSession session)
    {
        try
        {
            Teacher teacher = this.getAdminTeacher(id);

            if (teacher.getTeacherPassword().equals(oldpassword))
            {
                if (password.length() >= 6)
                {

                    if (password.equals(verifypassword))
                    {

                        if (!password.equals(oldpassword))
                        {
                            teacher.setTeacherPassword(password);
                            teacherRepository.save(teacher);

                            session.setAttribute("PasswordChangeSuccess", "Password Successfully Changed");

                            return "/teacher/login";


                        }
                        else
                        {
                            session.setAttribute("MatchingOldNewPasswords", "Old and new passwords must be different.");
                            return "/teacher/password/change";

                        }

                    }
                    else
                    {
                        session.setAttribute("NonMatchingNewPasswords", "New Password entries do no match.");
                        return "/teacher/password/change";
                    }


                }
                else
                {
                    session.setAttribute("Atleast6Characters", "Password must have at least 6 characters");
                    return "/teacher/password/change";
                }

            }
            else
            {
                session.setAttribute("IncorrectOldPassword", "Incorrect Current Password");
                return "/teacher/password/change";
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return "/teacher/password/change";

    }



    public boolean teacherLoginSubmit(String username, String password, HttpSession session)
    {
        boolean check = false;

        Teacher teacher = teacherRepository.findTeacherByTeacherEmailAndTeacherPassword(username, password);

        if (teacher != null)
        {
            this.setTeacherSession(session, teacher);
            check = true;
        }

        return check;
    }


    public boolean teacherAuthenticate(HttpSession session)
    {
        boolean check = false;
        if (session.getAttribute("sessionteacherid") != null)
        {
            check = true;
        }

        return check;
    }


    public Integer[] getTeacherStudentScore(HttpSession session)
    {
        Integer id = Integer.parseInt(session.getAttribute("sessionteacherid").toString());
        List<Feedback> feedbacks = feedbackRepository.findFeedbacksByTeacherId(id);

        Integer[] array = new Integer[3];
        Integer goodstudents = 0;
        Integer avgstudents = 0;
        Integer total = 0;

        for (int i = 0; i < feedbacks.size(); i++) {

            if (feedbacks.get(i).getPerformance() >= 7 && feedbacks.get(i).getBehaviour() >= 7 && feedbacks.get(i).getImprovement() >= 7)
            {
                goodstudents++;
            }
            else if (feedbacks.get(i).getPerformance() >= 5 && feedbacks.get(i).getBehaviour() >= 5 && feedbacks.get(i).getImprovement() >= 5)
            {
                avgstudents++;
            }

            total++;

        }

        array[0] = goodstudents;
        array[1] = avgstudents;
        array[2] = total;
        return array;
    }


    public Integer countStudents(HttpSession session)
    {
        Integer id = Integer.parseInt(session.getAttribute("sessionteacherid").toString());
        return studentRepository.countAllByTeacherId(id);
    }


    public String emailDbVerification(String email)
    {
        if (teacherRepository.findByTeacherEmail(email) != null)
        {
            return "Hmm... Email already in use";
        }
        return null;
    }


    public String phoneDbVerification(long phone)
    {
        if (teacherRepository.findByTeacherPhone(phone) != null)
        {
            return "Hmm... Phone No. already in use";
        }
        return null;
    }



}
