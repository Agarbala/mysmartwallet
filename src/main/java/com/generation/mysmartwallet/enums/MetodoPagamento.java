package com.generation.mysmartwallet.enums;

public enum MetodoPagamento {
    CONTANTI("Contanti"),
    CARTA("Carta"),
    ALTRO("Altro");

    private final String label;

    MetodoPagamento(String label) {
        this.label = label;
    }

    public static MetodoPagamento valueOfLabel(String label) {
        for (MetodoPagamento c : values()) {
            if (c.label.equalsIgnoreCase(label)) {
                return c;
            }
        }
        return null;
    }

    public String getLabel() {
        return label;
    }
}