package com.studentdiaries.springboot.Repository;

import com.studentdiaries.springboot.Model.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import java.sql.Date;
import java.util.List;


public interface FeedbackRepository extends JpaRepository<Feedback, Date> {

    
    Feedback findByFeedbackDateAndStudentId(java.util.Date date, Integer id);

    List<Feedback> findTop10ByStudentIdOrderByFeedbackDateDesc(Integer id);

    List<Feedback> findFeedbacksByTeacherId(Integer id);


    @Query("select AVG (u.performance), avg (u.behaviour), AVG (u.improvement), u.teacherId from Feedback u where u.teacherId = :id")
    Object findByTeacherId(@Param("id") Integer id);


    Integer countAllByStudentId(Integer id);


}
