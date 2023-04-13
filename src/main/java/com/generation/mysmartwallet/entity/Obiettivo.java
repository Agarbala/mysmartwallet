package com.generation.mysmartwallet.entity;

import java.time.LocalDate;

public class Obiettivo extends Entity {

    private String nome;
    private double importo;
    private LocalDate datainizio;
    private LocalDate datafine;
    private boolean completato;
    private String note;
    private int idconto;
    private double rata;

    public Obiettivo() {
    }

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

    public LocalDate getDatainizio() {
        return datainizio;
    }

    public void setDatainizio(LocalDate datainizio) {
        this.datainizio = datainizio;
    }

    public LocalDate getDatafine() {
        return datafine;
    }

    public void setDatafine(LocalDate datafine) {
        this.datafine = datafine;
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

    public int getIdconto() {
        return idconto;
    }

    public void setIdconto(int idconto) {
        this.idconto = idconto;
    }

    public double getRata() {
        return rata;
    }

    public void setRata(double rata) {
        this.rata = rata;
    }

}
