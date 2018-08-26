package com.studentdiaries.springboot.Repository;

import com.studentdiaries.springboot.Model.Admin;
import org.hibernate.sql.Update;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer> {

        /*Ajax Teacher Admin School name*/
        Admin findAdminByAdminId(int adminId);


        Admin findAdminByAdminEmailAndAdminPassword(String username, String pass);


        Admin findByAdminEmail(String email);

        Admin findByAdminPhone(Long phone);
}
