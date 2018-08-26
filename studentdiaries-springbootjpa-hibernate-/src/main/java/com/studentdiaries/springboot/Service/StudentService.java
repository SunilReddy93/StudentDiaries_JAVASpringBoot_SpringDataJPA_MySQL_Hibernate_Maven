package com.studentdiaries.springboot.Service;

import com.studentdiaries.springboot.Model.Feedback;
import com.studentdiaries.springboot.Model.Student;
import com.studentdiaries.springboot.Model.Teacher;
import com.studentdiaries.springboot.Repository.FeedbackRepository;
import com.studentdiaries.springboot.Repository.StudentRepository;
import com.studentdiaries.springboot.Repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;


    @Autowired
    private TeacherRepository teacherRepository;


    @Autowired
    private FeedbackRepository feedbackRepository;

    /*Save Student*/
    public void saveStudent(Student student)
    {
        studentRepository.save(student);
    }


    /*Find Students For Admin using Teacher Id */
    public List<Student> getAdminStudents(Integer id, HttpSession session)
    {
        if (id != null)
        {
            /*create temp_teacher_id session for delete operation and other operations on student                   related to that teacher on the AdminDeletion.jsp and maybe elsewhere to access the teacher              id over there
             * Remember this is a temporary session just to access teacher id on another page.
             * */
            session.setAttribute("temp_teacher_id", id);
        }

        List<Student> studentList = studentRepository.findAllByTeacherId(Integer.parseInt(session.getAttribute("temp_teacher_id").toString()));

        return studentList;

    }


    /*Save Admin Student*/
    public void saveAdminStudent(Student student)
    {
        studentRepository.save(student);
    }


    /*Find Student by Student ID*/
    public Student findAdminStudentProfile(Integer id)
    {
        return studentRepository.findByStudentId(id);
    }


    /*Delete Students by Admin and Show Updated Records*/
    public List<Student> deleteAdminStudents(Integer[] id, HttpSession session)
    {
        for (int i = 0; i < id.length; i++)
        {
            studentRepository.deleteById(id[i]);
        }

         return studentRepository.findAllByTeacherId(Integer.parseInt(session.getAttribute("temp_teacher_id").toString()));
    }



    /*Find Students For Teacher using Teacher Id */
    public List<Student> getTeacherStudents(HttpSession session)
    {

        List<Student> studentList = studentRepository.findAllByTeacherId(Integer.parseInt(session.getAttribute("sessionteacherid").toString()));

        return studentList;

    }


    /*Delete Students by Teacher and Show Updated Records*/
    public List<Student> deleteTeacherStudents(Integer[] id, HttpSession session)
    {
        for (int i = 0; i < id.length; i++)
        {
            studentRepository.deleteById(id[i]);
        }

        return studentRepository.findAllByTeacherId(Integer.parseInt(session.getAttribute("sessionteacherid").toString()));
    }

    /*Set Student Sessions other than Student ID*/
    public void setStudentSessions(HttpSession session, Student student)
    {
        session.setAttribute("sessionstudentfirstname", student.getStudentFirstName());
        session.setAttribute("sessionstudentlastname", student.getStudentLastName());
        session.setAttribute("sessionstudentid", student.getStudentId());

    }



    public void removeStudentSessions(HttpSession session)
    {
        session.removeAttribute("sessionstudentfirstname");
        session.removeAttribute("sessionstudentlastname");
        session.removeAttribute("sessionstudentid");


        if (session.getAttribute("StudentLoginIncorrectCredentials") != null)
        {
            session.removeAttribute("StudentLoginIncorrectCredentials");
        }

    }

    /*Delete Student Account*/
    public void deleteStudentProfile(Integer id)
    {
        studentRepository.deleteById(id);
    }


    public String changePasswordRequest(Integer id, String oldpassword, String password, String verifypassword, HttpSession session)
    {
        try
        {
            Student student = this.findAdminStudentProfile(id);

            if (student.getStudentPassword().equals(oldpassword))
            {
                if (password.length() >= 6)
                {

                    if (password.equals(verifypassword))
                    {

                        if (!password.equals(oldpassword))
                        {
                            student.setStudentPassword(password);
                            studentRepository.save(student);

                            session.setAttribute("PasswordChangeSuccess", "Password Successfully Changed");

                            return "/student/login";


                        }
                        else
                        {
                            session.setAttribute("MatchingOldNewPasswords", "Old and new passwords must be different.");
                            return "/student/password/change";

                        }

                    }
                    else
                    {
                        session.setAttribute("NonMatchingNewPasswords", "New Password entries do no match.");
                        return "/student/password/change";
                    }


                }
                else
                {
                    session.setAttribute("Atleast6Characters", "Password must have at least 6 characters");
                    return "/student/password/change";
                }

            }
            else
            {
                session.setAttribute("IncorrectOldPassword", "Incorrect Current Password");
                return "/student/password/change";
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return "/student/password/change";

    }


    /*Ajax for Student Teacher id*/
    public List<Integer> getStudentTeacherIds()
    {
        List<Teacher> teacherList = teacherRepository.findAll();
        List<Integer> teachers = new ArrayList<>();
        for (int i = 0; i < teacherList.size(); i++)
        {
            teachers.add(teacherList.get(i).getTeacherId());

        }
        return teachers;
    }


    public boolean studentLoginSubmit(String username, String password, HttpSession session)
    {
        boolean check = false;

        Student student = studentRepository.findStudentByStudentEmailAndStudentPassword(username, password);

        if (student != null)
        {
            this.setStudentSessions(session, student);
            check = true;
        }
        return check;
    }


    public boolean studentAuthenticate(HttpSession session)
    {
        boolean check = false;
        if (session.getAttribute("sessionstudentid") != null)
        {
            check = true;
        }
        return check;
    }


    public List<Feedback> studentFeedbackScores(HttpSession session)
    {
        Integer id = Integer.parseInt(session.getAttribute("sessionstudentid").toString());
        List<Feedback> feedbacks = feedbackRepository.findTop10ByStudentIdOrderByFeedbackDateDesc(id);

        return feedbacks;

    }

    public Integer[] studentAttendanceScore(HttpSession session)
    {
        Integer id = Integer.parseInt(session.getAttribute("sessionstudentid").toString());
        List<Feedback> feedbacks = feedbackRepository.findTop10ByStudentIdOrderByFeedbackDateDesc(id);

        Integer[] attendance = new Integer[3];

        Integer present = 0;
        Integer absent = 0;
        Integer total = 0;

        for (int i = 0; i < feedbacks.size(); i++)
        {
            if (feedbacks.get(i).getAttendance().equals("present"))
            {
                present++;
            }
            else if (feedbacks.get(i).getAttendance().equals("absent"))
            {
                absent++;
            }
            total++;
        }

        attendance[0] = present;
        attendance[1] = absent;
        attendance[2] = total;

        return attendance;
    }


    public Integer countFeedbacks(HttpSession session)
    {
        Integer id = Integer.parseInt(session.getAttribute("sessionstudentid").toString());
        return feedbackRepository.countAllByStudentId(id);
    }


    public String emailDbVerification(String email)
    {
        if (studentRepository.findByStudentEmail(email) != null)
        {
            return "Hmm... Email already in use";
        }
        return null;
    }


    public String phoneDbVerification(long phone)
    {
        if (studentRepository.findByStudentPhone(phone) != null)
        {
            return "Hmm... Phone No. already in use";
        }
        return null;
    }


    public String parentEmailDbVerification(String email)
    {
        if (studentRepository.findByParentEmail(email) != null)
        {
            return "Hmm... Email already in use";
        }
        return null;
    }


    public String parentPhoneDbVerification(long phone)
    {
        if (studentRepository.findByParentPhone(phone) != null)
        {
            return "Hmm... Phone No. already in use";
        }
        return null;
    }


}
