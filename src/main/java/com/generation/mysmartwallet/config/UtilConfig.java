package com.generation.mysmartwallet.config;

import com.generation.mysmartwallet.util.PasswordEncoder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UtilConfig {

    @Bean
    PasswordEncoder passwordEncoder() {

        return new PasswordEncoder();
    }
}
