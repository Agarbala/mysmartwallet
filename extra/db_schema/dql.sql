select *
from users
where id = ?;

select *
from transazioni
where idconto = ?;

select saldo
from conto
where id = ?;

select *
from budgetPerCategoria
where idconto = ?;