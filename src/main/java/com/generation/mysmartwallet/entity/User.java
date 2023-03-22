package com.generation.mysmartwallet.entity;

import java.time.LocalDate;

public class User extends Entity {
	
	private String nome;
	private String cognome;
	private LocalDate datanascita;
	private boolean enabled;
	private String username;
	private String password;
	
	
	
	
	public User() {}




	public String getNome() {
		return nome;
	}




	public void setNome(String nome) {
		this.nome = nome;
	}




	public String getCognome() {
		return cognome;
	}




	public void setCognome(String cognome) {
		this.cognome = cognome;
	}




	public LocalDate getDatanascita() {
		return datanascita;
	}




	public void setDatanascita(LocalDate datanascita) {
		this.datanascita = datanascita;
	}




	public boolean isEnabled() {
		return enabled;
	}




	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}




	public String getUsername() {
		return username;
	}




	public void setUsername(String username) {
		this.username = username;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	
	
	
	
	
	
}
