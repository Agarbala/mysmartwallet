package com.generation.mysmartwallet.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.generation.mysmartwallet.database.Database;
import com.generation.mysmartwallet.entity.User;

public class DaoUtente {
		@Autowired
		private Database db;
		
		//import org.springframework.context.ApplicationContext;
		@Autowired
		private ApplicationContext context;
		
		public List<User> read(String query, String... params)
		{
			List<User> ris = new ArrayList<User>();
			List<Map<String, String>> righe = db.rows(query, params);
			for(Map<String,String> riga : righe)
			{
				//Quando devo istanziare un oggetto Spring mediante un bean
				//ALL'INTERNO DI UN METODO devo ricorrere all'oggetto
				//ApplicationContext e al suo metodo getBean()
				User us = context.getBean(User.class,riga);
				
				ris.add(us);
			}
			return ris;
		}
		
		public List<User> leggiTutti()
		{
			return read("select * from users");
		}

		public boolean create(User u)
		{
			String query = "insert into users(username, password, enabled, nome, cognome, datadinascita) values (?,?,?,?,?,?);";
			return db.update(query, u.getUsername(), u.getPassword(), u.isEnabled()? "1":"0" , u.getNome(), u.getCognome(),  u.getDatanascita() + "");
		}
		
	
		

}
