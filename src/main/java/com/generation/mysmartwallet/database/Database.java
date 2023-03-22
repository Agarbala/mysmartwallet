package com.generation.mysmartwallet.database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;

public class Database
{
	private Connection c;
	
	@Value("${<db.nomedb>}")
	private String NOMEDB;
	@Value("${<db.username>}")
	private String USER;
	@Value("${<db.password>}")
	private String PASSWORD;
	
	public Database()
    {
        String timeZone = "useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false&amp";
        String percorso = "jdbc:mysql://localhost:3306/"+ NOMEDB + "?" 
                          + timeZone + "&useSSL=false";
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.c = DriverManager.getConnection(percorso, USER, PASSWORD);
        }
        catch(Exception e)
        {
            System.out.println("Catch nel costruttore della classe Database\n"	+
            				   "Controlla build path, username, password"		);
            e.printStackTrace();
        }
    }
	
	public List<Map<String, String>> rows(String query, String... params)
	{
		List<Map<String, String>> ris = new ArrayList<Map<String, String>>();
		
		try
		{
			PreparedStatement p = c.prepareStatement(query);
			
			for(int i = 0; i < params.length; i++)
				p.setString(i + 1, params[i]);
			
			ResultSet rs = p.executeQuery();
			
			while(rs.next())
			{
				Map<String, String> riga = new LinkedHashMap<String, String>();
				
				for(int i = 1; i <= rs.getMetaData().getColumnCount(); i++)
				{
					riga.put(	rs.getMetaData().getColumnLabel(i).toLowerCase(),
								rs.getString(i));									
					
				}
				
				ris.add(riga);
				
				
			}
		}
		catch(Exception e)
		{
			System.out.println("Catch del metodo rows della classe Database in Utility");
			e.printStackTrace();
		}
		
		return ris;
	}
	
	public Map<String, String> row(String query, String... params)
	{
		try
		{
			return	rows(query, params).get(0);
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	public boolean update(String query, String... params)
	{
		try
		{
			PreparedStatement p = c.prepareStatement(query);
			
			for(int i = 0; i < params.length; i++)
			{
				p.setString(i + 1, params[i]);
			}
			
			p.executeUpdate();
			return true;
		}
		catch(Exception e)
		{
			System.out.println("Catch del metodo update di Database in Utility");
			e.printStackTrace();
			return false;
		}
	}
}