create database dbzoo;

use dbzoo;

create table tbAnimais(
codAni int not null auto_increment,
nome varchar (100),
tipo varchar (100),
idade int,
primary key (codAni)
);


-- insert into tbAnimais(nome,tipo,idade) values(@nome,@tipo,@idade);
-- select nome from tbanimais where nome like '%a%';

update into tbAnimais set nome = @nome, tipo = @tipo, idade = @idade where codAni = @codAni;

	update into tbAnimais set nome = Asto, tipo = Rinoceront, idade = 3 where codAni = 2;