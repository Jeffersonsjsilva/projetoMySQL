-- nome: Jefferson Santana de Jesus Silva

-- apagando o banco de dados caso exista
drop database dbBiblioteca;
-- criando o banco de dados
create database dbBiblioteca;
-- visualizando bancos de dados
show databases;
-- acessando banco de dados criado
use dbBiblioteca;
-- criando tabela tbGenero
create table tbGenero(
idGenero int not null auto_increment,
descGen varchar(100) not null,
primary key (idGenero)
);
-- criando tabela tbAutor
create table tbAutor(
idAutor int not null auto_increment,
nomeAut varchar(100) not null,
emailAut varchar(100) not null,
primary key (idAutor)
);
-- criando tabela tbCliente
create table tbCliente(
idCliente int not null auto_increment,
nomeCli varchar(100) not null,
telCli char(13) not null,
primary key (idCliente)
);

-- criando tabela tbVenda
create table tbVenda(
idVenda int not null auto_increment,
idCliente int not null,
data date not null,
totalVenda decimal(9,2) not null check(totalVenda >= 0),
primary key(idVenda),
foreign key(idCliente) references tbCliente(idCliente)
);
-- criando tabela tbLivro
create table tbLivro(
idLivro int not null auto_increment,
idGenero int not null,
titLiv varchar(100) not null,
precLiv decimal(9,2) not null check (precLiv >=0),
qtd_estq int not null check(qtd_estq >= 0),
primary key (idLivro),
foreign key (idGenero) references tbGenero(idGenero)
);
-- criando tabela tbItensDaVenda
create table tbItensDaVenda(
idVenda int not null,
idLivro int not null,
qtdItens decimal(9,2) not null,
valTotal decimal (9,2) not null default 0 check(valTotal >=0 ),
foreign key (idVenda) references tbVenda(idVenda),
foreign key (idLivro) references tbLivro(idLivro)
);
-- criando tabela tbEscreve
create table tbEscreve(
idLivro int not null,
idAutor int not null,
foreign key (idLivro) references tbLivro(idLivro),
foreign key (idAutor) references tbAutor(idAutor)
);

-- inserindo registros na tabela tbGenero
insert into tbGenero(descGen) values('AÇÃO');
insert into tbGenero(descGen) values('AVENTURA');
insert into tbGenero(descGen) values('HQ/MANGÁ');
insert into tbGenero(descGen) values('BIOGRAFIA');
insert into tbGenero(descGen) values('FILOSOFIA');
insert into tbGenero(descGen) values('FANTASIA');
insert into tbGenero(descGen) values('BIOLOGIA');
insert into tbGenero(descGen) values('QUIMICA');
insert into tbGenero(descGen) values('AUTO-AJUDA');
insert into tbGenero(descGen) values('SOCIOLOGIA');
select*from tbGenero;
-- inserindo registros na tabela tbAutor
insert into tbAutor(nomeAut,emailAut) values('J R R Tolkien','tolkien@gmail.com');
insert into tbAutor(nomeAut,emailAut) values('Immanuel Kant','Kant@gmail.com');
insert into tbAutor(nomeAut,emailAut) values('Eiichiro Oda','oda@gmail.com');
insert into tbAutor(nomeAut,emailAut) values('George Orwell','orwell@gmail.com');
insert into tbAutor(nomeAut,emailAut) values('Masashi Kishimoto','kishimoto@gmail.com');
insert into tbAutor(nomeAut,emailAut) values('Rick Riordan','rick@gmail.com');
insert into tbAutor(nomeAut,emailAut) values('Neil Gaiman','gaiman@gmail.com');
insert into tbAutor(nomeAut,emailAut) values('Pedro Bial','bial@gmail.com');
insert into tbAutor(nomeAut,emailAut) values('Lewis Carell','carell@gmail.com');
insert into tbAutor(nomeAut,emailAut) values('John Green','green@gmail.com');
select * from tbAutor;
-- inserindo registro na tabela tbLivro
insert into tbLivro(idGenero,titLiv,precLiv,qtd_estq) values (2,'O senhor dos Aneis: A sociedade do anel',60.00,100);
insert into tbLivro(idGenero,titLiv,precLiv,qtd_estq) values (2,'O senhor dos Aneis: As duas torres',60.00,90);
insert into tbLivro(idGenero,titLiv,precLiv,qtd_estq) values (2,'O senhor dos Aneis: O retorno do rei',60.00,85);
insert into tbLivro(idGenero,titLiv,precLiv,qtd_estq) values (4,'1984',70.00,300);
insert into tbLivro(idGenero,titLiv,precLiv,qtd_estq) values (3,'One piece',30.00,500);
insert into tbLivro(idGenero,titLiv,precLiv,qtd_estq) values (3,'Watchmen',45.00,200);
insert into tbLivro(idGenero,titLiv,precLiv,qtd_estq) values (3,'Naruto',25.00,175);
insert into tbLivro(idGenero,titLiv,precLiv,qtd_estq) values (3,'Hunter X Hunter',20.00,150);
insert into tbLivro(idGenero,titLiv,precLiv,qtd_estq) values (3,'Yu Yu Hakusho',35.00,60);
insert into tbLivro(idGenero,titLiv,precLiv,qtd_estq) values (3,'Vingadores',50.00,190);
select * from tbLivro;
-- inserindo registros na tabela tbEscreve
insert into tbEscreve(idLivro,idAutor) values(1,1);
insert into tbEscreve(idLivro,idAutor) values(2,1);
insert into tbEscreve(idLivro,idAutor) values(3,1);
insert into tbEscreve(idLivro,idAutor) values(4,4);
insert into tbEscreve(idLivro,idAutor) values(5,3);
insert into tbEscreve(idLivro,idAutor) values(6,3);
insert into tbEscreve(idLivro,idAutor) values(7,3);
insert into tbEscreve(idLivro,idAutor) values(8,3);
insert into tbEscreve(idLivro,idAutor) values(9,3);
insert into tbEscreve(idLivro,idAutor) values(10,3);
select * from tbEscreve;
-- inserindo registros na tabela tbCliente
insert into tbCliente(nomeCli,telCli) values('Jefferson Araujo','11 96532-1479');
insert into tbCliente(nomeCli,telCli) values('Ryan Cardoso','11 93697-4138');
insert into tbCliente(nomeCli,telCli) values('Marcos Joaquim','61 97863-4236');
insert into tbCliente(nomeCli,telCli) values('Manoel Gomes','98 98563-3287');
insert into tbCliente(nomeCli,telCli) values('Wesley Sniper','97 97894-3285');
insert into tbCliente(nomeCli,telCli) values('Jennifer Lawrence','63 97432-7851');
insert into tbCliente(nomeCli,telCli) values('Renato Augusto','11 94896-2746');
insert into tbCliente(nomeCli,telCli) values('Bruno Mendez','27 94562-8975');
insert into tbCliente(nomeCli,telCli) values('Matheus Araujo','31 92735-9564');
insert into tbCliente(nomeCli,telCli) values('Lucas Verissimo','22 94737-7462');
select*from tbCliente;
--inserindo registros na tabela tbVenda
insert into tbVenda(idCliente,data,totalVenda) values(1,'23/08/22',120.00);
insert into tbVenda(idCliente,data,totalVenda) values(2,'23/08/20',70.00);
insert into tbVenda(idCliente,data,totalVenda) values(3,'23/08/18',90.00);
insert into tbVenda(idCliente,data,totalVenda) values(4,'23/08/22',50.00);
insert into tbVenda(idCliente,data,totalVenda) values(5,'23/08/15',240.00);
insert into tbVenda(idCliente,data,totalVenda) values(6,'23/08/17',150.00);
insert into tbVenda(idCliente,data,totalVenda) values(7,'23/08/20',120.00);
insert into tbVenda(idCliente,data,totalVenda) values(8,'23/08/08',90.00);
insert into tbVenda(idCliente,data,totalVenda) values(9,'23/08/14',100.00);
insert into tbVenda(idCliente,data,totalVenda) values(10,'23/08/21',100.00);
select*from tbVenda;
-- inserindo registros na tabela tbItensDaVenda
insert into tbItensDaVenda(idVenda,idLivro,qtdItens,valTotal) values(1,2,2,120.00);
insert into tbItensDaVenda(idVenda,idLivro,qtdItens,valTotal) values(2,4,1,70.00);
insert into tbItensDaVenda(idVenda,idLivro,qtdItens,valTotal) values(3,5,3,90.00);
insert into tbItensDaVenda(idVenda,idLivro,qtdItens,valTotal) values(4,4,2,140.00);
insert into tbItensDaVenda(idVenda,idLivro,qtdItens,valTotal) values(5,1,4,240.00);
insert into tbItensDaVenda(idVenda,idLivro,qtdItens,valTotal) values(6,2,3,180.00);
insert into tbItensDaVenda(idVenda,idLivro,qtdItens,valTotal) values(7,3,2,90.00);
insert into tbItensDaVenda(idVenda,idLivro,qtdItens,valTotal) values(8,4,2,140.00);
insert into tbItensDaVenda(idVenda,idLivro,qtdItens,valTotal) values(9,1,4,240.00);
insert into tbItensDaVenda(idVenda,idLivro,qtdItens,valTotal) values(10,2,5,300.00);
select * from tbItensDaVenda order by valTotal;
-- inserindo update na tabela tbGenero
update tbGenero set descGen = 'AUTO-BIOGRAFIA' where idGenero = 6;
update tbGenero set descGen = 'AVENTURA E JORNADA' where idGenero = 2;
update tbGenero set descGen = 'QUADRINHOS E MANGÁS' where idGenero = 3;
update tbGenero set descGen = 'FILOSOFIA E SOCIOLOGIA' where idGenero = 5;
update tbGenero set descGen = 'CONTO E FABULAS' where idGenero = 10;
select *from tbGenero;
-- inserindo update na tabela tbAutor
update tbAutor set nomeAut = 'J.R.R.TOLKIEN' where  idAutor = 1;
update tbAutor set nomeAut = 'I. KANT' where  idAutor = 2;
update tbAutor set nomeAut = 'E. ODA' where  idAutor = 3;
update tbAutor set nomeAut = 'P. BIAL' where  idAutor = 8;
update tbAutor set nomeAut = 'J. GREEN' where  idAutor = 10;
select * from tbAutor;
-- inserindo update na tabela tbLivro
update tbLivro set qtd_estq = 125 where idLivro = 1;
update tbLivro set titLiv = 'One Piece vol 1' where idLivro = 5;
update tbLivro set qtd_estq = 600 where idLivro = 5;
update tbLivro set titLiv = 'Naruto vol 1' where idLivro = 7;
update tbLivro set titLiv = 'Yu Yu Hakusho vol 1' where idLivro = 8;
select * from tbLivro order by qtd_estq;

-- inserindo update na tabela tbEscreve
update tbEscreve set idLivro = 9 where idAutor = 8;
update tbEscreve set idLivro = 10 where idAutor = 6;
update tbEscreve set idLivro = 8 where idAutor = 7;
update tbEscreve set idLivro = 6 where idAutor = 6;
update tbEscreve set idLivro = 7 where idAutor = 10;
select * from tbEscreve;
-- inserindo update na tabela tbCliente
update tbCliente set nomeCli = 'Cássio Ramos' where idCliente = 6;
update tbCliente set telCli = '96 98564-7896' where idCliente = 6;
update tbCliente set nomeCli = 'Matias Rojas' where idCliente = 9;
update tbCliente set TelCli = '11 98742-7358' where idCliente = 10;
update tbCliente set nomeCli = 'Dimitri Payet' where idCliente = 7;
select * from tbCliente;
-- inserindo update na tabela tbVenda
update tbVenda set data = '23/08/22' where idVenda = 3;
update tbVenda set data = '23/08/15' where idVenda = 7;
update tbVenda set totalVenda = 85.00 where idVenda = 8;
update tbVenda set totalVenda = 95.00 where idVenda = 10;
update tbVenda set data = '23/08/19' where idVenda = 4;
select * from tbVenda order by data;
-- inserindo update na tabela tbItensDaVenda
update tbItensDaVenda set qtdItens = 3 where idVenda = 2;
update tbItensDaVenda set valTotal = valTotal * 1.10 where idVenda = 2;
update tbItensDaVenda set qtdItens = 4 where idVenda = 8;
update tbItensDaVenda set valTotal = 180.00 where idVenda = 8;
update tbItensDaVenda set valTotal = valTotal * 0.90 where idVenda = 10;
select * from tbItensDaVenda order by valTotal;
-- deletando registros na tabela tbGenero
delete from tbGenero where idGenero = 6;
delete from tbGenero where idGenero = 7;
delete from tbGenero where idGenero = 8;
delete from tbGenero where idGenero = 9;
delete from tbGenero where idGenero = 10;
select * from tbGenero;
-- deletando registros na tabela tbAutor
delete from tbAutor where idAutor = 6;
delete from tbAutor where idAutor = 7;
delete from tbAutor where idAutor = 8;
delete from tbAutor where idAutor = 9;
delete from tbAutor where idAutor = 10;
select * from tbAutor;
-- deleteando registros na tabela tbEscreve
delete from tbEscreve where idLivro = 6;
delete from tbEscreve where idLivro = 7;
delete from tbEscreve where idLivro = 8;
delete from tbEscreve where idLivro = 9;
delete from tbEscreve where idLivro = 10;
select * from tbEscreve;
-- deletando registros na tabela tbLivro
delete from tbLivro where idLivro = 6;
delete from tbLivro where idLivro = 7;
delete from tbLivro where idLivro = 8;
delete from tbLivro where idLivro = 9;
delete from tbLivro where idLivro = 10;
select * from tbLivro;
-- deletando registros na tabela tbItensDaVenda
delete from tbItensDaVenda where idVenda = 6;
delete from tbItensDaVenda where idVenda = 7;
delete from tbItensDaVenda where idVenda = 8;
delete from tbItensDaVenda where idVenda = 9;
delete from tbItensDaVenda where idVenda = 10;
select * from tbItensDaVenda;
-- deletando registros na tabela tbVenda
delete from tbVenda where idVenda = 6;
delete from tbVenda where idVenda = 7;
delete from tbVenda where idVenda = 8;
delete from tbVenda where idVenda = 9;
delete from tbVenda where idVenda = 10;
select*from tbVenda;
-- deletando registros na tabela tbCliente
delete from tbCLiente where idCliente = 6;
delete from tbCLiente where idCliente = 7;
delete from tbCLiente where idCliente = 8;
delete from tbCLiente where idCliente = 9;
delete from tbCLiente where idCliente = 10;
select*from tbCliente;

-- utilizando o select com oque foi apresentado em aula
select nomeCli as 'Nome do Cliente', telCli as 'Telefone do Cliente' from tbCliente;