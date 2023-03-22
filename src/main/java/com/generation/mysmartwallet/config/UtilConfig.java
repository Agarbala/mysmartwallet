package com.generation.mysmartwallet.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.generation.mysmartwallet.util.PasswordEncoder;

@Configuration
public class UtilConfig {

	@Bean
	public PasswordEncoder passwordEncoder() {
		
		return new PasswordEncoder();
	}
}
