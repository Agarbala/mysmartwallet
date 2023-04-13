#
DDL
create
database MySmartWallet;
use
MySmartWallet;

CREATE TABLE users
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    username      VARCHAR(100) NOT NULL,
    password      VARCHAR(100) NOT NULL,
    enabled       BOOLEAN,
    nome          VARCHAR(100) NOT NULL,
    cognome       VARCHAR(100) NOT NULL,
    datadinascita DATE         NOT NULL
);

create table conto
(
    id    int primary key,
    saldo double default (0.0),
    foreign key (id) references users (id) ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE obiettivi
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    importo    DOUBLE       NOT NULL,
    datainizio DATE         NOT NULL,
    datafine   DATE         NOT NULL,
    completato BOOLEAN,
    nome       VARCHAR(100) NOT NULL,
    note       VARCHAR(1000),
    rata       double as (if( PERIOD_DIFF(EXTRACT (YEAR_MONTH FROM datafine), EXTRACT (YEAR_MONTH FROM datainizio)) > 0, (importo/PERIOD_DIFF(EXTRACT (YEAR_MONTH FROM datafine), EXTRACT (YEAR_MONTH FROM datainizio))), importo)),
    idconto    INT          NOT NULL,
    FOREIGN KEY (idconto)
        REFERENCES conto (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
-- drop table obiettivi;
-- select * from obiettivi;
CREATE TABLE transazioni
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    idconto         INT,
    importo         DOUBLE       NOT NULL,
    datatransazione DATE         NOT NULL,
    note            VARCHAR(1000),
    nome            VARCHAR(100) NOT NULL,
    metodo          ENUM('Contanti', 'Carta', 'Altro') NOT NULL,
    categoria       ENUM('Casa', 'Trasporti', 'Famiglia', 'Salute e Benessere', 'Tempo Libero', 'Altro') NOT NULL,
    tipo            ENUM('Entrata', 'Uscita'),
    obiettivoid     INT,
    FOREIGN KEY (idconto)
        REFERENCES conto (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (obiettivoid)
        REFERENCES obiettivi (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
-- drop table transazioni;
-- select * from transazioni;
CREATE TABLE budgetPerCategoria
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    idconto INT    NOT NULL,
    budget  DOUBLE NOT NULL,
    nome    ENUM('Casa', 'Trasporti', 'Famiglia', 'Salute e Benessere', 'Tempo Libero', 'Altro') NOT NULL,
    FOREIGN KEY (idconto)
        REFERENCES conto (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
-- drop table budgetpercategoria;
-- select * from budgetpercategoria;
CREATE TABLE transazioniRicorrenti
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    idconto     INT    NOT NULL,
    importo     DOUBLE NOT NULL,
    datainizio  DATE   NOT NULL,
    frequenza   INT    NOT NULL,
    unita       ENUM('Settimana', 'Mese', 'Anno') NOT NULL,
    metodo      ENUM('Contanti', 'Carta', 'Altro') NOT NULL,
    categoria   ENUM('Casa', 'Trasporti', 'Famiglia', 'Salute e Benessere', 'Tempo Libero', 'Altro') NOT NULL,
    tipo        ENUM('Entrata', 'Uscita') NOT NULL,
    obiettivoid INT    NOT NULL,
    FOREIGN KEY (idconto)
        REFERENCES conto (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
