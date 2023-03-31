package com.generation.mysmartwallet.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.generation.mysmartwallet.database.Database;
import com.generation.mysmartwallet.entity.User;

public class DaoUtente {
	@Autowired
	private Database db;

	@Autowired
	private ApplicationContext context;

	public List<User> read(String query, String... params)
	{
		List<User> ris = new ArrayList<User>();
		List<Map<String, String>> righe = db.rows(query, params);
		for(Map<String,String> riga : righe)
		{

			User us = context.getBean(User.class,riga);

			ris.add(us);
		}
		return ris;
	}

	public List<User> leggiTutti()
	{
		return read("select * from users");
	}


	public User trovaPerUsername(String username) {
		Map<String, String> riga = db.row("select * from users where username = ?", username);
		if(riga == null) {
			return null;
		}
		return context.getBean(User.class, riga);
	}
	
	public int cercaIdPerUsername(String username) {
		return Integer.parseInt(
				db.row("select id from users where username = ?", username).get("id")
				);
	
	}

	public boolean isUsernameEsistente(String username) {
		return trovaPerUsername(username) == null ? false : true;
	}
	
	public boolean create(User u)
	{
		String query = "insert into users(username, password, enabled, nome, cognome, datadinascita) values (?,?,?,?,?,?);";
		return db.update(query, 
				u.getUsername(), 
				u.getPassword(), 
				"1",  // di default l'utente è abilitato
				u.getNome(), 
				u.getCognome(),  
				u.getDatadinascita() + "");
	}

}
