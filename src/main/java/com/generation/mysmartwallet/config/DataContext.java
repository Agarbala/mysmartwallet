package com.generation.mysmartwallet.config;

import com.generation.mysmartwallet.dao.*;
import com.generation.mysmartwallet.database.Database;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataContext {

    @Bean
    Database db() {
        return new Database();
    }

    @Bean
    DaoUtente daoUtente() {
        return new DaoUtente();
    }

    @Bean
    DaoTransazioni daoTransazioni() {
        return new DaoTransazioni();
    }

    @Bean
    DaoObiettivo daoObiettivi() {
        return new DaoObiettivo();
    }

    @Bean
    DaoBudget daoBudget() {
        return new DaoBudget();
    }

    @Bean
    DaoConto daoConto() {
        return new DaoConto();
    }
}
