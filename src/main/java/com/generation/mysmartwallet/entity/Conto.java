package com.generation.mysmartwallet.entity;

import java.util.ArrayList;

import com.generation.mysmartwallet.enums.TipoTransazione;

public class Conto extends Entity {

	private User utente;
	private ArrayList<TipoTransazione> transazioni;
	private ArrayList<Obiettivo> obiettivi;
	private ArrayList<Budget> budgets;
	private double saldo;
	
	
	
	
	public Conto () {}




	public User getUtente() {
		return utente;
	}

	public void setUtente(User utente) {
		this.utente = utente;
	}


	public ArrayList<TipoTransazione> getTransazioni() {
		return transazioni;
	}


	public void setTransazioni(ArrayList<TipoTransazione> transazioni) {
		this.transazioni = transazioni;
	}


	public ArrayList<Obiettivo> getObiettivi() {
		return obiettivi;
	}


	public void setObiettivi(ArrayList<Obiettivo> obiettivi) {
		this.obiettivi = obiettivi;
	}

	public ArrayList<Budget> getBudgets() {
		return budgets;
	}

	public void setBudgets(ArrayList<Budget> budgets) {
		this.budgets = budgets;
	}

	public double getSaldo() {
		return saldo;
	}

	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}


	
	
	
	
	
}
