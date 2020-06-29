package com.asuka;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@MapperScan("com.asuka.**.mapper")
@SpringBootApplication
public class AsukaApplication {

    public static void main(String[] args) {
        SpringApplication.run(AsukaApplication.class, args);
    }

}
