package com.generation.mysmartwallet.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.generation.mysmartwallet.database.Database;
import com.generation.mysmartwallet.entity.Transazione;

import java.util.*;

public class DaoTransazioni {
	@Autowired
	private Database db;

	@Autowired
	private ApplicationContext context;

	public List<Transazione> read(String query, String... params)
	{
		List<Transazione> ris = new ArrayList<Transazione>();
		List<Map<String, String>> righe = db.rows(query, params);
		for(Map<String,String> riga : righe)
		{
			Transazione tr = context.getBean(Transazione.class,riga);
			ris.add(tr);
		}
		return ris;
	}

	public List<Transazione> leggiTutti()
	{
		return read("select * from transazioni");
	}

	public boolean create(Transazione t)
	{
		String query = "insert into transazioni(idconto, importo, datatransazione, note, nome, metodo, categoria, tipo, obiettivoid) values(?,?,?,?,?,?,?,?);";
		return db.update(query, 
				t.getId()+"", 
				t.getImporto()+ "", 
				t.getDatatransazione()+ "", 
				t.getNote(), t.getNome(), 
				t.getMetodo()+"", 
				t.getCategoria()+"", 
				t.getTipo()+ "", 
				t.getObiettivoid().orElse(-1) + "");
	}

	public boolean update(Transazione t)
	{
		String query = "update transazioni set idconto = ?, importo = ?, datatransazione = ?, note = ?, nome= ?, metodo = ?, categoria = ?, tipo = ? where id = ? ;";
		return db.update(query, 
				t.getId()+"", 
				t.getImporto()+ "", 
				t.getDatatransazione()+ "", 
				t.getNote(), 
				t.getNome(), 
				t.getMetodo()+"", 
				t.getCategoria()+"", 
				t.getTipo()+ "" );
	}

	public boolean delete(int id)
	{
		String query = "delete from transazioni where id = ?;";
		return db.update(query, id + "");
	}


}
