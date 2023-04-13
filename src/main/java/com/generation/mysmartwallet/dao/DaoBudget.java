package com.generation.mysmartwallet.dao;

import com.generation.mysmartwallet.database.Database;
import com.generation.mysmartwallet.entity.Budget;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DaoBudget {
    @Autowired
    private Database db;

    @Autowired
    private ApplicationContext context;

    public List<Budget> read(String query, String... params) {
        List<Budget> ris = new ArrayList<Budget>();
        List<Map<String, String>> righe = db.rows(query, params);
        for (Map<String, String> riga : righe) {
            Budget bud = context.getBean(Budget.class, riga);
            ris.add(bud);
        }
        return ris;
    }

    public List<Budget> tuttiPerUtente(int idUtente) {
        return read("select * from budgetPerCategoria where idConto = ?", idUtente + "");
    }

    public boolean create(Budget bud) {
        if (bud.getId() == 0) {
            String query = "insert into budgetPerCategoria (idconto, budget, nome) values (?,?,?);";
            System.out.println("ho aggiunto il budget");
            return db.update(query, bud.getIdconto() + "", bud.getBudget() + "", bud.getNome());
        }

        String query = "update budgetPerCategoria set budget = ? where id = ?;";
        System.out.println("ho aggiornato il budget");
        return db.update(query, bud.getBudget() + "", bud.getId() + "");

    }

    public boolean update(Budget bud) {
        String query = "update budgetPerCategoria set budget = ? where id = ?;";
        return db.update(query, bud.getId() + "", bud.getBudget() + "");
    }

    public boolean delete(int id) {
        String query = "delete from budgetPerCategoria where id = ?;";
        return db.update(query, id + "");
    }

    public String getIdPerCategoria(String categoria) {
        String query = "select * from budgetPerCategoria where nome = ?";
        return db.row(query, categoria) == null ? "0" : db.row(query, categoria).get("id");
    }

}
