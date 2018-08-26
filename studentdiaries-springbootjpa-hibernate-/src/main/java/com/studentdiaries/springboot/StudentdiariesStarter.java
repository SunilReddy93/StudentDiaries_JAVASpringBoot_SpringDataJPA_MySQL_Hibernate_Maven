package com.studentdiaries.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.studentdiaries.springboot.Repository")
public class StudentdiariesStarter {

	public static void main(String[] args)
	{
		SpringApplication.run(StudentdiariesStarter.class, args);
	}
}
