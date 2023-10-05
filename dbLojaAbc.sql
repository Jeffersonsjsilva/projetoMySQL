drop database dbLojaABC;

create database dbLojaABC;

use dbLojaABC;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) unique,
dNasci date,
endereco varchar(100),
cep char(9),
numero char(10),
bairro varchar(100),
cidade varchar(100),
estado char(2),
primary key(codFunc)
);

-- insert into tbFuncionarios(nome,email,cpf,dNasci,endereco,cep,numero,bairro,cidade,estado) values();


-- Busca por código
-- select * from tbFuncionarios where codFunc = 1;

-- Busca por nome

-- select * from tbFuncionarios where nome like '%a%';

-- inserir campo de código não existente

-- select codFunc+1 from tbFuncionarios order by codFunc desc;

-- buscar funcionarios

select * from tbFuncionarios where nome = "@nome";