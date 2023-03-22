package com.generation.mysmartwallet.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.generation.mysmartwallet.database.Database;
import com.generation.mysmartwallet.entity.Budget;


public class DaoBudget {
	@Autowired
	private Database db;
	
	//import org.springframework.context.ApplicationContext;
	@Autowired
	private ApplicationContext context;
	
	public List<Budget> read(String query, String... params)
	{
		List<Budget> ris = new ArrayList<Budget>();
		List<Map<String, String>> righe = db.rows(query, params);
		for(Map<String,String> riga : righe)
		{
			//Quando devo istanziare un oggetto Spring mediante un bean
			//ALL'INTERNO DI UN METODO devo ricorrere all'oggetto
			//ApplicationContext e al suo metodo getBean()
			Budget bud = context.getBean(Budget.class,riga);
			
			ris.add(bud);
		}
		return ris;
	}
	
	public List<Budget> leggiTutti()
	{
		return read("select * from budgetPerCategoria");
	}

	public boolean create(Budget bud)
	{
		
		String query = "insert into budgetPerCategoria (idconto, budget, nome) values (?,?,?);";
		return db.update(query, bud.getId()+ "", bud.getBudget()+ "", bud.getNome()+ "");
	}
	
	public boolean update(Budget bud)
	{
		String query = "update budgetPerCategoria set budget = ? where id = ?;";
		return db.update(query, bud.getId()+ "", bud.getBudget()+ "");
	}
	
	
	
	public boolean delete(int id)
	{
		String query = "delete from budgetPerCategoria where id = ?;";
		return db.update(query, id + "");
	}

}
