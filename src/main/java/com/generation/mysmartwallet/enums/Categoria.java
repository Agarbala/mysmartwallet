package com.generation.mysmartwallet.enums;

public enum Categoria {
    CASA("Casa"),
    TRASPORTI("Trasporti"),
    FAMIGLIA("Famiglia"),
    SALUTEEBENESSERE("Salute e Benessere"),
    TEMPOLIBERO("Tempo Libero"),
    ALTRO("Altro");

    private final String label;

    private Categoria(String label) {
        this.label = label;
    }

    public static Categoria valueOfLabel(String label) {
        for (Categoria c : values()) {
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
