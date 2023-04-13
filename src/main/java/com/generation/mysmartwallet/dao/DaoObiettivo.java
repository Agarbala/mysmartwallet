package com.generation.mysmartwallet.dao;

import com.generation.mysmartwallet.database.Database;
import com.generation.mysmartwallet.entity.Obiettivo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DaoObiettivo {
    @Autowired
    private Database db;

    @Autowired
    private ApplicationContext context;

    public List<Obiettivo> read(String query, String... params) {
        List<Obiettivo> ris = new ArrayList<Obiettivo>();
        List<Map<String, String>> righe = db.rows(query, params);
        for (Map<String, String> riga : righe) {
            Obiettivo ob = context.getBean(Obiettivo.class, riga);

            ris.add(ob);
        }
        return ris;
    }

    public List<Obiettivo> tuttiPerUtente(int idUtente) {
        return read("select * from obiettivi where idConto = ?", idUtente + "");
    }

    public boolean create(Obiettivo o) {

        String query = "insert into obiettivi (idconto, importo, datainizio, datafine, completato, nome, note) values (?,?,?,?,?,?,?);";
        return db.update(query,
                o.getIdconto() + "",
                o.getImporto() + "",
                o.getDatainizio() + "",
                o.getDatafine() + "",
                o.isCompletato() ? "1" : "0",
                o.getNome(),
                o.getNote());
    }

    public boolean update(Obiettivo o) {
        String query = "update obiettivi set  idconto = ?, importo = ?, datainizio = ?, datafine = ?, nome = ?, note = ? where id = ?;";
        return db.update(query,
                o.getIdconto() + "",
                o.getImporto() + "",
                o.getDatainizio() + "",
                o.getDatafine() + "",
                o.getNome(),
                o.getNote(),
                o.getId() + "");
    }

    public boolean delete(int id) {
        String query = "delete from obiettivi where id = ?;";
        return db.update(query, id + "");
    }

}
