package com.studentdiaries.springboot.Repository;

import com.studentdiaries.springboot.Model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student, Integer> {

    List<Student> findAllByTeacherId(Integer id);

    Student findByStudentId(Integer id);

    Student findStudentByStudentEmailAndStudentPassword(String username, String pass);

    Integer countAllByTeacherId(Integer id);

    Student findByStudentEmail(String email);

    Student findByStudentPhone(long phone);

    Student findByParentEmail(String email);

    Student findByParentPhone(long phone);

}
