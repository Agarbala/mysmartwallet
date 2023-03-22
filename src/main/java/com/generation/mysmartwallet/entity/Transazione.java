package com.generation.mysmartwallet.entity;

import java.time.LocalDate;

import com.generation.mysmartwallet.entity.Entity;
import com.generation.mysmartwallet.enums.Categoria;
import com.generation.mysmartwallet.enums.MetodoPagamento;
import com.generation.mysmartwallet.enums.TipoTransazione;

public class Transazione extends Entity {

	
	private double importo;
	private LocalDate dataTransazione;
	private String note;
	private String nome;
	private MetodoPagamento metodo;
	private Categoria categoria;
	private TipoTransazione tipo;
	
	
	
}
