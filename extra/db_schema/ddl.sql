# DDL 
create database MySmartWallet;
use MySmartWallet;

create table users(
id int primary key auto_increment,
username varchar(100) not null,
password varchar(100) not null,
enabled boolean,
nome varchar(100) not null,
cognome varchar(100) not null,
datadinascita date not null
);
-- drop table users;
-- select * from users;
create table conto (
  id int primary key,
  saldo double default(0.0),
  foreign key (id) references users(id) ON DELETE CASCADE
  ON UPDATE CASCADE
);
-- drop table conto;
-- select * from conto;
create table obiettivi(
id int primary key auto_increment,
importo double not null,
datainizio date not null,
datafine date not null,
completato boolean,
nome varchar(100) not null,
note varchar(1000),
idconto int not null,
foreign key(idconto) references conto(id) on delete cascade on update cascade
);
-- drop table obiettivi;
-- select * from obiettivi;
create table transazioni(
id int primary key auto_increment,
idconto int,
importo double not null,
datatransazione date not null,
note varchar(1000),
nome varchar(100) not null,
metodo enum("Contanti","Carta","Altro") not null,
categoria enum("Casa","Trasporti","Famiglia","Salute e Benessere","Tempo Libero","Altro") not null,
tipo enum("Entrata","Uscita"),
obiettivoid int,
foreign key(idconto) references conto(id) on delete cascade on update cascade,
foreign key(obiettivoid) references obiettivi(id) on delete cascade on update cascade
);
-- drop table transazioni;
-- select * from transazioni;
create table budgetPerCategoria(
id int primary key auto_increment,
idconto int not null,
budget double not null,
nome enum("Casa","Trasporti","Famiglia","Salute e Benessere","Tempo Libero","Altro") not null,
foreign key(idconto) references conto(id)
);
-- drop table budgetpercategoria;
-- select * from budgetpercategoria;
create table transazioniRicorrenti(
id int primary key auto_increment,
idconto int not null,
importo double not null,
datainizio date not null,
frequenza int not null,
unita enum("Settimana","Mese","Anno") not null,
metodo enum("Contanti","Carta","Altro") not null,
categoria enum("Casa","Trasporti","Famiglia","Salute e Benessere","Tempo Libero","Altro") not null,
tipo enum("Entrata","Uscita") not null,
obiettivoid int not null,
foreign key(idconto) references conto(id)
);

# Trigger(s)