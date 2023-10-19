create database dbzoo;

use dbzoo;

create table tbAnimais(
codAni int not null auto_increment,
nome varchar (100),
tipo varchar (100),
idade int,
primary key (codAni)
);


insert into tbAnimais(nome,tipo,idade) values(@nome,@tipo,@idade);