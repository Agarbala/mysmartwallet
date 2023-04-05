package com.generation.mysmartwallet.enums;

public enum TipoTransazione {
    ENTRATA("Entrata"),
    USCITA("Uscita");

    private final String label;

    private TipoTransazione(String label) {
        this.label = label;
    }

    public static TipoTransazione valueOfLabel(String label) {
        for (TipoTransazione c : values()) {
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
