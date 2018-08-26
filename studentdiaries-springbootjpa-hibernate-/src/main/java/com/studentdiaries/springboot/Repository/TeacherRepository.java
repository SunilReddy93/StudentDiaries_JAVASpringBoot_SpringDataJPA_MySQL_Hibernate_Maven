package com.studentdiaries.springboot.Repository;

import com.studentdiaries.springboot.Model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher, Integer> {

    List<Teacher> findAllByAdminId(int adminId);


    Teacher findByTeacherId(int teacherId);

    @Override
    void deleteById(Integer teacherId);

    Teacher findTeacherByTeacherEmailAndTeacherPassword(String username, String password);

    List<Teacher> findTop10ByAdminId(Integer id);

    int countAllByAdminId(Integer id);

    Teacher findByTeacherEmail(String email);

    Teacher findByTeacherPhone(long phone);

}
