package com.generation.mysmartwallet.entity;

import java.time.LocalDate;

public class Obiettivo extends Entity {

	
	private String nome;
	private double importo;
	private LocalDate dataInizio;
	private LocalDate dataFine;
	private boolean completato;
	private String note;
	
	
	public Obiettivo () {}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public double getImporto() {
		return importo;
	}


	public void setImporto(double importo) {
		this.importo = importo;
	}


	public LocalDate getDataInizio() {
		return dataInizio;
	}


	public void setDataInizio(LocalDate dataInizio) {
		this.dataInizio = dataInizio;
	}


	public LocalDate getDataFine() {
		return dataFine;
	}


	public void setDataFine(LocalDate dataFine) {
		this.dataFine = dataFine;
	}


	public boolean isCompletato() {
		return completato;
	}


	public void setCompletato(boolean completato) {
		this.completato = completato;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}
	
	
	
	
	
}
