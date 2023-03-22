package com.generation.mysmartwallet.entity;

import com.generation.mysmartwallet.enums.Categoria;

public class Budget {

	private Categoria nome;
	private double budjet;

	
	public Budget() {}

	
	
	
	public Categoria getNome() {
		return nome;
	}

	public void setNome(Categoria nome) {
		this.nome = nome;
	}

	public double getBudjet() {
		return budjet;
	}

	public void setBudjet(double budjet) {
		this.budjet = budjet;
	}
	
	
	
	
}

