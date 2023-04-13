package com.generation.mysmartwallet.entity;

import com.generation.mysmartwallet.enums.Categoria;

public class Budget extends Entity {

    private Categoria nome;
    private double budget;
    private int idconto;

    public Budget() {
    }

    public String getNome() {
        return nome.getLabel();
    }

    public void setNome(Categoria nome) {
        this.nome = nome;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    public int getIdconto() {
        return idconto;
    }

    public void setIdconto(int idconto) {
        this.idconto = idconto;
    }

}
