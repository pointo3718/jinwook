package com.jinwook.home;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
public class JinwookApplication extends SpringBootServletInitializer {
 
    public static void main(String[] args) {
        SpringApplication.run(JinwookApplication.class, args);
    }
    
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
    	System.out.println("==============11111");
        return builder.sources(JinwookApplication.class);
    }
}
