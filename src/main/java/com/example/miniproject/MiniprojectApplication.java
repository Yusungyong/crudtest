package com.example.miniproject;

import org.springframework.boot.SpringApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
@ComponentScan(basePackages= {"com.example"})
public class MiniprojectApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(MiniprojectApplication.class, args);
	}

}
