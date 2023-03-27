package com.generation.mysmartwallet.entity;

import java.time.LocalDate;
import java.util.Optional;

import com.generation.mysmartwallet.enums.Categoria;
import com.generation.mysmartwallet.enums.MetodoPagamento;
import com.generation.mysmartwallet.enums.TipoTransazione;

public class Transazione extends Entity {

	private int idconto;
	private double importo;
	private LocalDate datatransazione;
	private String note;
	private String nome;
	private MetodoPagamento metodo;
	private Categoria categoria;
	private TipoTransazione tipo;
	private int obiettivoid;
	
	
	public Transazione() {}


	
	public int getIdconto() {
		return idconto;
	}



	public void setIdconto(int idconto) {
		this.idconto = idconto;
	}



	public int getObiettivoid() {
		return obiettivoid;
	}


	public void setObiettivoid(int obiettivoid) {
		this.obiettivoid = obiettivoid;
	}

	public double getImporto() {
		return importo;
	}


	public void setImporto(double importo) {
		this.importo = importo;
	}


	public LocalDate getDatatransazione() {
		return datatransazione;
	}


	public void setDatatransazione(LocalDate datatransazione) {
		this.datatransazione = datatransazione;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public MetodoPagamento getMetodo() {
		return metodo;
	}


	public void setMetodo(MetodoPagamento metodo) {
		this.metodo = metodo;
	}


	public Categoria getCategoria() {
		return categoria;
	}


	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}


	public TipoTransazione getTipo() {
		return tipo;
	}


	public void setTipo(TipoTransazione tipo) {
		this.tipo = tipo;
	}
	
	
	
	
	
}
