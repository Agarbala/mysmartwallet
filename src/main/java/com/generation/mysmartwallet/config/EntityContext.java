package com.generation.mysmartwallet.config;

import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.generation.mysmartwallet.entity.User;

@Configuration
public class EntityContext {

	@Bean
	@Scope("prototype")
	public User user(Map<String, String> row) {
		User u = new User();
		u.fromMap(row);
		return u;
	}
}
