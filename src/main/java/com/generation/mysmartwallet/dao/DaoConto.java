package com.generation.mysmartwallet.dao;

import org.springframework.beans.factory.annotation.Autowired;


import com.generation.mysmartwallet.database.Database;

public class DaoConto {

	@Autowired
	private Database db;
	
	public boolean create(int idUtente)
	{
		String query = "insert into conto (id, saldo) values (?,?);";
		return db.update(query, idUtente + "", 0 + "");
	}
	
	public double getSaldo(int idConto) {
		return Double.parseDouble(db.row("select saldo from conto where id = ?", idConto + "").get("saldo"));
	}
}
