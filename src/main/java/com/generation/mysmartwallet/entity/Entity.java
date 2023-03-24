package com.generation.mysmartwallet.entity;

import java.lang.reflect.Method;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import com.generation.mysmartwallet.enums.Categoria;
import com.generation.mysmartwallet.enums.MetodoPagamento;
import com.generation.mysmartwallet.enums.TipoTransazione;

public abstract class Entity
{
	private int id;



	public Entity() {}

	public Entity(int id)
	{
		this.id = id;
	}



	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}


	public Map<String, String> toMap()
	{
		Map<String, String> ris = new HashMap<String, String>();

		for(Method m : this.getClass().getMethods())
		{
			if(	m.getName().startsWith("get")	&&
					!m.getName().equalsIgnoreCase("getClass"))
			{
				try
				{
					String key = m.getName().substring(3).toLowerCase();
					String value = m.invoke(this) + "";
					ris.put(key, value);
				}
				catch(Exception e)
				{
					System.out.println("Eccezione del metodo toMap() in Entity");
					e.printStackTrace();
				}
			}
			else if(m.getName().startsWith("is"))
			{
				try
				{
					String key = m.getName().substring(2).toLowerCase();
					String value = m.invoke(this) + "";
					ris.put(key, value);
				}
				catch(Exception e)
				{
					System.out.println("Eccezione del metodo toMap() in Entity");
					e.printStackTrace();
				}
			}
		}

		return ris;
	}

	public Entity fromMap(Map<String, String> map)
	{
		for(Method m : this.getClass().getMethods())
		{
			if(m.getName().startsWith("set") && m.getParameterCount() == 1)
			{
				String nomeProprieta = m.getName().substring(3).toLowerCase();

				if(map.containsKey(nomeProprieta))
				{
					String valore = map.get(nomeProprieta);
					try
					{
						String tipo = m.getParameters()[0].getType().getSimpleName().toLowerCase();
						switch(tipo)
						{
						case "string"	:
							m.invoke(this, valore);
							break;

						case "int"	:
							if(valore == null) {
								m.invoke(this, 0);
								break;
							}
							m.invoke(this, Integer.parseInt(valore));
							break;
						case "double"	:
							m.invoke(this, Double.parseDouble(valore));
							break;

						case "date"	:
							m.invoke(this, Date.valueOf(valore));
							break;

						case "boolean"	:
							m.invoke(this,	valore.equals("1")	    ||
									valore.equalsIgnoreCase("true")	||
									valore.equalsIgnoreCase("vero")	||
									valore.equalsIgnoreCase("si")	||
									valore.equalsIgnoreCase("sì"))	;
							break;
						case "localdate":
							m.invoke(this, LocalDate.parse(valore));
							break;
						//Aggiunto supporto per le Enumeration
						case "categoria":
							m.invoke(this, Enum.valueOf(Categoria.class, valore.toUpperCase()));
							break;
						case "metodopagamento":
							m.invoke(this, Enum.valueOf(MetodoPagamento.class, valore.toUpperCase()));
							break;
						case "tipotransazione":
							m.invoke(this, Enum.valueOf(TipoTransazione.class, valore.toUpperCase()));
							break;
						default	:
							System.err.println("Nel fromMap() non ho riconosciuto il tipo " + tipo);
							break;

						}
					}
					catch(Exception e)
					{
						System.out.println("Catch del metodo fromMap() di Entity");
						e.printStackTrace();
					}

				}

			}

		}

		return this;

	}

	public String toString()
	{
		String ris = "Id: " + id + "\n";
		Map<String, String> mappa = toMap();

		for(String key : mappa.keySet())
			if(!key.equals("id"))
				ris += key + " : " + mappa.get(key) + "\n";

		ris += "------------------------\n";
		return ris;
	}
}