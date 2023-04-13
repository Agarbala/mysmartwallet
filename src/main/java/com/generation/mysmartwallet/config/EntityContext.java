package com.generation.mysmartwallet.config;

import com.generation.mysmartwallet.dao.DaoBudget;
import com.generation.mysmartwallet.dao.DaoConto;
import com.generation.mysmartwallet.dao.DaoObiettivo;
import com.generation.mysmartwallet.dao.DaoTransazioni;
import com.generation.mysmartwallet.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import java.util.ArrayList;
import java.util.Map;

@Configuration
public class EntityContext {

    @Autowired
    private DaoTransazioni daoTransazioni;
    @Autowired
    private DaoObiettivo daoObiettivo;
    @Autowired
    private DaoBudget daoBudget;
    @Autowired
    private DaoConto daoConto;

    @Bean
    @Scope("prototype")
    User user(Map<String, String> row) {
        User u = new User();
        u.fromMap(row);
        return u;
    }

    @Bean
    @Scope("prototype")
    Transazione transazione(Map<String, String> row) {
        Transazione t = new Transazione();
        t.fromMap(row);
        return t;
    }

    @Bean
    @Scope("prototype")
    Obiettivo obiettivo(Map<String, String> row) {
        Obiettivo o = new Obiettivo();
        o.fromMap(row);
        return o;
    }

    @Bean
    @Scope("prototype")
    Budget budget(Map<String, String> row) {
        Budget b = new Budget();
        b.fromMap(row);
        return b;
    }

    // Creo un oggetto Conto solo una volta per sessione, al logout invalido la
    // sessione
    @Bean
    @Scope("session")
    Conto conto(int id) {
        Conto c = new Conto();
        c.setId(id);
        c.setSaldo(daoConto.getSaldo(id));
        c.setTransazioni((ArrayList<Transazione>) daoTransazioni.tuttePerUtente(id));
        c.setObiettivi((ArrayList<Obiettivo>) daoObiettivo.tuttiPerUtente(id));
        c.setBudgets((ArrayList<Budget>) daoBudget.tuttiPerUtente(id));
        return c;
    }
}
