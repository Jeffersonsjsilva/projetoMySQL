-- excluindo banco de dados caso exista
drop database dbManicure;
-- criando banco de dados
create database dbManicure;
-- mostrando banco de dados existentes
show databases;
-- acessando o banco de dados
use dbManicure;
--criando tabelas e campos
create table tbProdutos(
id_prod int,
descricao varchar(100),
quantidade decimal(9,2),
dataEntrada date,
valorUnit decimal(9,2)
);
-- visualizar tabelas
show tables;
-- visualizar estruturas das tabelas
desc tbProdutos;
-- inserindo registros nas tabelas
insert into tbProdutos(id_prod,descricao,quantidade,dataEntrada,valorUnit) values(1,'Alicate de unha',10,'2023/08/01',5.50);
insert into tbProdutos(id_prod,descricao,quantidade,dataEntrada,valorUnit) values(2,'Algodão',150,'2023/07/31',2.80);
insert into tbProdutos(id_prod,descricao,quantidade,dataEntrada,valorUnit) values(3,'Esmalte',30,'2023/05/20',10.50);
insert into tbProdutos(id_prod,descricao,quantidade,dataEntrada,valorUnit) values(4,'Acetona',50,'2023/04/29',6.30);
insert into tbProdutos(id_prod,descricao,quantidade,dataEntrada,valorUnit) values(5,'Unha postiça',45,'2023/06/06',2.50);
insert into tbProdutos(id_prod,descricao,quantidade,dataEntrada,valorUnit) values(6,'Unha',45,'2023/06/06',2.50);
insert into tbProdutos(id_prod,descricao,quantidade,dataEntrada,valorUnit) values(7,'postiça',45,'2023/06/06',2.50);
-- visualizar os registros inseridos nas tabelas
select * from tbProdutos;
-- alterando registros das tabelas
update tbProdutos set descricao = 'Palito de unha', valorUnit = 1.35, quantidade = 32, dataEntrada = '2023/05/24' where id_prod = 6;
update tbProdutos set descricao = 'Mascara de proteção', valorUnit = 5.50, quantidade = 57, dataEntrada = '2023/06/14' where id_prod = 7;
-- visualizar os registros inseridos nas tabelas
select * from tbProdutos;
-- apagar registro das tabelas
delete from tbProdutos where id_prod = 7;
-- visualizar os registros inseridos nas tabelas
select * from tbProdutos;