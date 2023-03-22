package com.generation.mysmartwallet.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.generation.mysmartwallet.database.Database;

@Configuration
public class DataContext {

	@Bean
	public Database db() {
		return new Database();
	}
}
