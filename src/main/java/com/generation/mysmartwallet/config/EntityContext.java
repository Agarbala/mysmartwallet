package com.generation.mysmartwallet.config;

import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.generation.mysmartwallet.entity.Budget;
import com.generation.mysmartwallet.entity.Obiettivo;
import com.generation.mysmartwallet.entity.Transazione;
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
	
	@Bean
	@Scope("prototype")
	public Transazione transazione(Map<String, String> row) {
		Transazione t = new Transazione();
		t.fromMap(row);
		return t;
	}
	
	@Bean
	@Scope("prototype")
	public Obiettivo obiettivo(Map<String, String> row) {
		Obiettivo o = new Obiettivo();
		o.fromMap(row);
		return o;
	}
	
	@Bean
	@Scope("prototype")
	public Budget budget(Map<String, String> row) {
		Budget b = new Budget();
		b.fromMap(row);
		return b;
	}
}
