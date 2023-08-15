--nome: Jefferson Santana de Jesus Silva
--deletando banco de dados caso exista
drop database dbLoterica;
--criando o banco de dados
create database dbLoterica;
--visualizar os bancos de dados
show databases;
-- acessando o banco de dados
use dbLoterica;
-- criando tabelas e campos
create table tbJogos(
id_Jogo int,
nome varchar(100),
valor decimal(9,2),
data date
);
--visualizando tabelas
show tables;
--visualizando estruturas da tabela
desc tbJogos;
-- inserindo registro nas tabelas
insert into tbJogos(id_Jogo,nome,valor,data) values(1,'Mega-Sena',9.99,'2023/06/06');
insert into tbJogos(id_Jogo,nome,valor,data) values(2,'Tele-Sena',5.00,'2023/05/23');
insert into tbJogos(id_Jogo,nome,valor,data) values(3,'Mega da virada',4.69,'2023/06/13');
insert into tbJogos(id_Jogo,nome,valor,data) values(4,'Jogo do bicho',6.85,'2023/06/15');
insert into tbJogos(id_Jogo,nome,valor,data) values(5,'Blaze',9.85,'2023/06/24');
insert into tbJogos(id_Jogo,nome,valor,data) values(6,'Pixbet',10.15,'2023/06/19');
insert into tbJogos(id_Jogo,nome,valor,data) values(7,'Show do milhão',15.50,'2023/06/23');
insert into tbJogos(id_Jogo,nome,valor,data) values(8,'Raspadinha',50.00,'2023/06/22');
insert into tbJogos(id_Jogo,nome,valor,data) values(9,'Bingo',7.90,'2023/06/18');
insert into tbJogos(id_Jogo,nome,valor,data) values(10,'Lotomania',6.85,'2023/06/15');
-- visualizando registros
select * from tbJogos;
-- alterando registro das tabelas
update tbJogos set nome = 'Roda-Roda', valor = 18.90, data = '2023/05/04' where id_Jogo = 9;
update tbJogos set nome = 'Jogo da vida', valor = 99.99, data = '2023/07/07' where id_Jogo = 10;
-- visualizando registros
select * from tbJogos;
-- deletando registros
delete from tbJogos where id_Jogo = 8;
delete from tbJogos where id_Jogo = 9;
delete from tbJogos where id_Jogo = 6;
--visualizando registros
select * from tbJogos;