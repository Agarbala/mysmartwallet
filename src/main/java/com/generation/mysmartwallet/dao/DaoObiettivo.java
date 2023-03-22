package com.generation.mysmartwallet.dao;

import java.util.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.generation.mysmartwallet.database.Database;
import com.generation.mysmartwallet.entity.Obiettivo;


public class DaoObiettivo {
	@Autowired
	private Database db;
	
	//import org.springframework.context.ApplicationContext;
	@Autowired
	private ApplicationContext context;
	
	public List<Obiettivo> read(String query, String... params)
	{
		List<Obiettivo> ris = new ArrayList<Obiettivo>();
		List<Map<String, String>> righe = db.rows(query, params);
		for(Map<String,String> riga : righe)
		{
			//Quando devo istanziare un oggetto Spring mediante un bean
			//ALL'INTERNO DI UN METODO devo ricorrere all'oggetto
			//ApplicationContext e al suo metodo getBean()
			Obiettivo ob = context.getBean(Obiettivo.class,riga);
			
			ris.add(ob);
		}
		return ris;
	}
	
	public List<Obiettivo> leggiTutti()
	{
		return read("select * from obiettivo");
	}

	public boolean create(Obiettivo o)
	{
		
		String query = "insert into obiettivo (idconto, importo, datainizio, datafine, completato, nome) values (?,?,?,?,?,?);";
		return db.update(query, o.getId()+"", o.getImporto()+ "", o.getDatainizio()+ "", o.getDatafine()+ "", o.isCompletato()? "1":"0", o.getNome());
	}
	
	public boolean update(Obiettivo o)
	{
		String query = "update obiettivo set  idconto = ?, importo = ?, datainizio = ?, datafine = ?, nome = ? where id = ?;";
		return db.update(query, o.getId()+ "", o.getImporto()+ "", o.getDatainizio()+ "", o.getDatafine()+ "", o.getNome());
	}
	
	
	// E' stato implementato il delete, ma non è presente nel DML
	public boolean delete(int id)
	{
		String query = "delete from obiettivo where id = ?;";
		return db.update(query, id + "");
	}
	
}
