-- inserire utente 
insert into users(username, password, enabled, nome, cognome, datadinascita) values (?,?,?,?,?,?);


-- inserire transazione 
insert into transazioni(idconto, importo, datatransazione, note, nome, metodo, categoria, tipo, obiettivoid) values(?,?,?,?,?,?,?,?,?);

-- cancellare transazione 
delete from transazioni where id = ?;


-- aggiorna transazione 

update transazioni set idconto = ?, importo = ?, datatransazione = ?, note = ?, nome= ?, metodo = ?, categoria = ?, tipo = ?, obiettivoid = ? where id = ? ;

-- Budget

insert into budgetPerCategoria (idconto, budget, nome) values (?,?,?);


update budgetPerCategoria set budget = ? where id = ?;


delete from budgetPerCategoria where id = ?;


-- obiettivo
insert into obiettivo (idconto, importo, datainizio, datafine, completato, nome) values (?,?,?,?,?,?);


update obiettivo set idconto = ?, importo = ?, datainizio = ?, datafine = ?, nome = ? where id = ?;

delete from obiettivo where id = ?























