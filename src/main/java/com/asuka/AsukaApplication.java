package com.asuka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@SpringBootApplication
public class AsukaApplication {

    public static void main(String[] args) {
        SpringApplication.run(AsukaApplication.class, args);
    }

}
