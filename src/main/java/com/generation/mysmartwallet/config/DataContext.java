package com.generation.mysmartwallet.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.generation.mysmartwallet.dao.DaoBudget;
import com.generation.mysmartwallet.dao.DaoConto;
import com.generation.mysmartwallet.dao.DaoObiettivo;
import com.generation.mysmartwallet.dao.DaoTransazioni;
import com.generation.mysmartwallet.dao.DaoUtente;
import com.generation.mysmartwallet.database.Database;

@Configuration
public class DataContext {

	@Bean
	public Database db() {
		return new Database();
	}
	
	@Bean
	public DaoUtente daoUtente() {
		return new DaoUtente();
	}
	
	@Bean
	public DaoTransazioni daoTransazioni() {
		return new DaoTransazioni();
	}
	
	@Bean
	public DaoObiettivo daoObiettivi() {
		return new DaoObiettivo();
	}
	
	@Bean
	public DaoBudget daoBudget() {
		return new DaoBudget();
	}
	
	@Bean
	public DaoConto daoConto() {
		return new DaoConto();
	}
}
