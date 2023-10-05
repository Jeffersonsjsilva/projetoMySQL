-- Nome: Jefferson Santana de Jesus Silva

-- apagando o banco de dados
drop database dbCds;

-- criando banco de dados
create database dbCds;
use dbCds;
-- criando tabelas com chave primaria
create table tbArtistas(
cod_art int not null auto_increment,
nome_art varchar(100) not null unique,
primary key(cod_art)
);

create table tbGravadoras(
cod_grav int not null auto_increment,
nome_grav varchar(50) not null unique,
primary key (cod_grav)
);

create table tbCategorias(
cod_cat int not null auto_increment,
nome_cat varchar(50) not null unique,
primary key (cod_cat)
);

create table tbEstados(
sigla_est char(2) not null,
nome_est varchar(50) not null unique,
primary key (sigla_est)
);

create table tbCidades(
cod_cid int not null auto_increment,
sigla_est char(2) not null,
nome_cid varchar(50) not null,
primary key(cod_cid),
foreign key(sigla_est) references tbEstados(sigla_est)
);

create table tbClientes(
cod_cli int not null auto_increment,
cod_cid int not null,
nome_cli varchar(50) not null,
end_cli varchar(100) not null,
renda_cli decimal(9,2) not null default 0 check(renda_cli >= 0),
sexo_cli char(1) not null default 'F' check(sexo_cli in('F','M')),
primary key (cod_cli),
foreign key (cod_cid) references tbCidades(cod_cid)
);

create table tbConjuge(
cod_conj int not null auto_increment,
cod_cli int not null,
nome_conj varchar(50) not null,
renda_conj decimal(9,2) not null default 0 check(renda_conj >= 0),
sexo_conj char(1) not null default 'F' check(sexo_conj in('F','M')),
primary key (cod_conj),
foreign key (cod_cli) references tbClientes(cod_cli)
);


create table tbFuncionarios(
cod_func int not null auto_increment,
nome_func varchar(50) not null,
end_func varchar(100) not null,
sal_func decimal(9,2) not null default 0 check(sal_func >=0),
sexo_func char(1) not null default 'F' check(sexo_func in('F','M')),
primary key (cod_func)
);

create table tbDependentes(
cod_dep int not null auto_increment,
cod_func int not null,
nome_dep varchar(100) not null,
sexo_dep char(1) not null default 'F' check(sexo_dep in('F','M')),
primary key (cod_dep),
foreign key(cod_func) references tbFuncionarios(cod_func)
);

create table tbTitulos(
cod_tit int not null auto_increment,
cod_cat int not null,
cod_grav int not null,
nome_cd varchar(50) not null unique,
val_cd decimal(9,2) not null check(val_cd >= 0),
qtd_estq int not null check(qtd_estq >= 0),
primary key(cod_tit),
foreign key (cod_cat) references tbCategorias(cod_cat),
foreign key (cod_grav) references tbGravadoras(cod_grav)
);

create table tbPedidos(
num_ped int not null auto_increment,
cod_cli int not null,
cod_func int not null,
data_ped datetime not null,
val_ped decimal(9,2) not null default 0 check(val_ped >=0),
primary key (num_ped),
foreign key(cod_cli) references tbClientes(cod_cli),
foreign key (cod_func) references tbFuncionarios(cod_func)
);

create table tbTitulos_pedidos(
num_ped int not null,
cod_tit int not null,
qtd_cd int not null check(qtd_cd >= 1),
val_cd decimal(9,2) not null check(val_cd > 0),
foreign key(num_ped) references tbPedidos(num_ped),
foreign key(cod_tit) references tbTitulos(cod_tit)
);

create table tbTitulos_Artistas(
cod_tit int not null,
cod_art int not null,
foreign key(cod_tit) references tbTitulos(cod_tit),
foreign key(cod_art) references tbArtistas(cod_art)
);

-- inserindo registros na tabela tbArtistas
insert into tbArtistas(nome_art) values('MARISA MONTE');
insert into tbArtistas(nome_art) values('GILBERTO GIL');
insert into tbArtistas(nome_art) values('CAETANO VELOSO');
insert into tbArtistas(nome_art) values('MILTON NASCIMENTO');
insert into tbArtistas(nome_art) values('LEGIÃO URBANA');
insert into tbArtistas(nome_art) values('THE BEATLES');
insert into tbArtistas(nome_art) values('RITA LEE');
-- inserindo registros na tabela tbGravadoras
insert into tbGravadoras(nome_grav) values('POLYGRAM');
insert into tbGravadoras(nome_grav) values('EMI');
insert into tbGravadoras(nome_grav) values('SOM LIVRE');
insert into tbGravadoras(nome_grav) values('SOM MUSIC');
-- inserindo registros na tabela tbCategorias
insert into tbCategorias(nome_cat) values('MPB');
insert into tbCategorias(nome_cat) values('TRILHA SONORA');
insert into tbCategorias(nome_cat) values('ROCK INTERNACIONAL');
insert into tbCategorias(nome_cat) values('ROCK NACIONAL');
-- inserindo registros na tabela tbEstados
insert into tbEstados(sigla_est,nome_est) values ('SP','SÃO PAULO');
insert into tbEstados(sigla_est,nome_est) values ('MG','MINAS GERAIS');
insert into tbEstados(sigla_est,nome_est) values ('RJ','RIO DE JANEIRO');
insert into tbEstados(sigla_est,nome_est) values ('ES','ESPIRITO SANTO');
-- inserindo registros na tabela tbCidades
insert into tbCidades(sigla_est,nome_cid) values ('SP','SÃO PAULO');
insert into tbCidades(sigla_est,nome_cid) values ('SP','SOROCABA');
insert into tbCidades(sigla_est,nome_cid) values ('SP','JUNDIAÍ');
insert into tbCidades(sigla_est,nome_cid) values ('SP','AMERICANA');
insert into tbCidades(sigla_est,nome_cid) values ('SP','ARARAQUARA');
insert into tbCidades(sigla_est,nome_cid) values ('MG','OURO PRETO');
insert into tbCidades(sigla_est,nome_cid) values ('ES','CACHOEIRA DO ITAPEMIRIM');
-- inserindo registros na tabela tbClientes
insert into tbClientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (1,'JOSÉ NOGUEIRA','RUA A',1500.00,'M');
insert into tbClientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (1,'ÂNGELO PEREIRA','RUA B',2000.00,'M');
insert into tbClientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (1,'ALÉM MAR PARANHOS','RUA C',1500.00,'M');
insert into tbClientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (1,'CATARINA SOUZA','RUA D',892.00,'F');
insert into tbClientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (1,'VAGNER COSTA','RUA E',950.00,'M');
insert into tbClientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (2,'ANTENOR DA COSTA','RUA F',1582.00,'M');
insert into tbClientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (2,'MARIA AMÉLIA DE SOUZA','RUA G',1152.00,'F');
insert into tbClientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (2,'PAULO ROBERTO SILVA','RUA H',3250.00,'M');
insert into tbClientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (3,'FÁTIMA SOUZA','RUA I',1632.00,'F');
insert into tbClientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli) values (3,'JOEL DA SILVA','RUA J',2000.00,'M');
-- inserindo registros na tabela tbConjuge
insert into tbConjuge(cod_cli,nome_conj,renda_conj,sexo_conj) values(1,'CARLA NOGUEIRA',2500.00,'F');
insert into tbConjuge(cod_cli,nome_conj,renda_conj,sexo_conj) values(2,'EMILIA PEREIRA',5500.00,'F');	
insert into tbConjuge(cod_cli,nome_conj,renda_conj,sexo_conj) values(6,'ALTIVA DA COSTA',3000.00,'F');
insert into tbConjuge(cod_cli,nome_conj,renda_conj,sexo_conj) values(7,'CARLOS DE SOUZA',3250.00,'M');
-- inserindo registros na tabela tbFuncionarios
insert into tbFuncionarios(nome_func,end_func,sal_func,sexo_func) values ('VÂNIA GABRIELA PEREIRA','RUA A',2500.00,'F');
insert into tbFuncionarios(nome_func,end_func,sal_func,sexo_func) values ('NORBERTO PEREIRA DA SILVA','RUA B',300.00,'M');
insert into tbFuncionarios(nome_func,end_func,sal_func,sexo_func) values ('OLAVO LINHARES','RUA C',580.00,'M');
insert into tbFuncionarios(nome_func,end_func,sal_func,sexo_func) values ('PAULA DA SILVA','RUA D',3000.00,'F');
insert into tbFuncionarios(nome_func,end_func,sal_func,sexo_func) values ('ROLANDO ROCHA','RUA E',2000.00,'M');
-- inserindo registros na tabela tbDependentes
insert into tbDependentes(cod_func,nome_dep,sexo_dep) values (1,'ANA PEREIRA','F');
insert into tbDependentes(cod_func,nome_dep,sexo_dep) values (1,'ROBERTO PEREIRA','M');
insert into tbDependentes(cod_func,nome_dep,sexo_dep) values (1,'CELSO PEREIRA','M');
insert into tbDependentes(cod_func,nome_dep,sexo_dep) values (3,'BRISA LINHARES','F');
insert into tbDependentes(cod_func,nome_dep,sexo_dep) values (3,'MARI SOL LINHARES','F');
insert into tbDependentes(cod_func,nome_dep,sexo_dep) values (4,'SONIA DA SILVA','F');
-- inserindo registros na tabela tbTitulos
insert into tbTitulos(cod_cat,cod_grav,nome_cd,val_cd,qtd_estq) values(1,1,'TRIBALISTAS',30.00,1500);
insert into tbTitulos(cod_cat,cod_grav,nome_cd,val_cd,qtd_estq) values(1,2,'TROPICÁLIA',50.00,500);
insert into tbTitulos(cod_cat,cod_grav,nome_cd,val_cd,qtd_estq) values(1,1,'AQUELE ABARAÇO',50.00,600);
insert into tbTitulos(cod_cat,cod_grav,nome_cd,val_cd,qtd_estq) values(1,2,'REFAZENDA',60.00,1000);
insert into tbTitulos(cod_cat,cod_grav,nome_cd,val_cd,qtd_estq) values(1,3,'TOTALMENTE DEMAIS',50.00,2000);
insert into tbTitulos(cod_cat,cod_grav,nome_cd,val_cd,qtd_estq) values(1,3,'TRAVESSIA',55.00,500);
insert into tbTitulos(cod_cat,cod_grav,nome_cd,val_cd,qtd_estq) values(1,2,'COURAGE',30.00,200);
insert into tbTitulos(cod_cat,cod_grav,nome_cd,val_cd,qtd_estq) values(4,3,'LEGIÃO URBANA',20.00,100);
insert into tbTitulos(cod_cat,cod_grav,nome_cd,val_cd,qtd_estq) values(3,2,'THE BEATLES',30.00,300);
insert into tbTitulos(cod_cat,cod_grav,nome_cd,val_cd,qtd_estq) values(4,1,'RITA LEE',30.00,500);
--inserindo registros na tabela tbPedidos
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped) values (1,2,'02/05/02',1500.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped) values (3,4,'02/05/02',50.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped) values (4,5,'02/06/02',100.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped) values (1,4,'02/02/03',200.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped) values (7,5,'02/03/03',300.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped) values (4,4,'02/03/03',100.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped) values (5,5,'02/03/03',50.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped) values (8,2,'02/03/03',50.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped) values (2,2,'02/03/03',2000.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped) values (7,1,'02/03/03',3000.00);
-- inserindo registros na tabela tbTitulo_pedidos
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(1,1,2,30.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(1,2,3,20.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(2,1,1,50.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(2,2,3,30.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(3,1,1,40.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(4,2,3,20.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(5,1,2,25.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(6,2,3,30.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(6,3,1,35.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(7,4,2,55.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(8,1,4,60.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(9,2,3,15.00);
insert into tbTitulos_pedidos(num_ped,cod_tit,qtd_cd,val_cd) values(10,7,2,15.00);
-- inserindo registors na tabela tbTitulos_artistas
insert into tbTitulos_Artistas(cod_tit,cod_art) values(1,1);
insert into tbTitulos_Artistas(cod_tit,cod_art) values(2,2);
insert into tbTitulos_Artistas(cod_tit,cod_art) values(3,2);
insert into tbTitulos_Artistas(cod_tit,cod_art) values(4,2);
insert into tbTitulos_Artistas(cod_tit,cod_art) values(5,3);
insert into tbTitulos_Artistas(cod_tit,cod_art) values(6,4);
insert into tbTitulos_Artistas(cod_tit,cod_art) values(7,4);
insert into tbTitulos_Artistas(cod_tit,cod_art) values(8,5);
insert into tbTitulos_Artistas(cod_tit,cod_art) values(9,6);
insert into tbTitulos_Artistas(cod_tit,cod_art) values(10,7);


-- LABORATORIO 9

-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD.
select 
tit.nome_cd as 'Nome dos titulos', 
grav.nome_grav  as 'Nome da gravadora'
from tbGravadoras as grav 
inner join tbTitulos as tit on
grav.cod_grav = tit.cod_grav;

-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD.

select 
nome_cd as 'Nome dos titulos', 
nome_cat as 'Categoria' from tbCategorias as cat
inner join tbTitulos as tit on
cat.cod_cat = tit.cod_cat;

-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de
-- cada CD

select
tit.nome_cd as 'CDs', 
grav.nome_grav as 'Gravadora', 
cat.nome_cat as 'Categoria' from tbGravadoras as grav 
inner join tbTitulos as tit on
grav.cod_grav = tit.cod_grav
inner join tbCategorias as cat on
tit.cod_cat = cat.cod_cat;

-- 4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o
-- cliente fez.

select
titp.num_ped as 'Número do pedido',
cli.nome_cli as 'Nome do cliente',
tit.nome_cd as 'Titulo'
from tbClientes as cli
inner join tbPedidos as ped
on cli.cod_cli = ped.cod_cli
inner join tbTitulos_pedidos as titp
on titp.num_ped = ped.num_ped
inner join tbTitulos as tit
on tit.cod_tit = titp.cod_tit
order by titp.num_ped;

-- 5. Selecione o nome do funcionário, número, data e valor dos pedidos que este
-- funcionário registrou, além do nome do cliente que está fazendo o pedido.

select 
nome_func as 'Funcionário', 
num_ped as 'Número do pedido', 
data_ped as 'Data', 
val_ped as 'Valor do pedido', 
nome_cli as 'Cliente '
from tbFuncionarios as func
inner join tbPedidos as ped on
func.cod_func = ped.cod_func
inner join tbClientes as cli on
ped.cod_cli = cli.cod_cli;

-- 6. Selecione o nome dos funcionários e o nome de todos os dependentes de cada
-- funcionário.

select 
nome_func as 'Funcionário',
nome_dep as 'Dependente'
from tbFuncionarios as func
inner join tbDependentes as denp on
func.cod_func = denp.cod_func;

-- 7. Selecione o nome dos clientes e o nome dos cônjuges de cada cliente.

select
nome_cli as 'Cliente', 
nome_conj as 'Cônjuge'
from tbClientes as cli
left join tbConjuge as conj on
cli.cod_cli = conj.cod_cli;

-- 8. Selecione o nome de todos os clientes. Se estes possuem cônjuges, mostrar os nomes
-- de seus cônjuges também.

select
nome_cli as 'Cliente', 
nome_conj as 'Cônjuge'
from tbClientes as cli
inner join tbConjuge as conj on
cli.cod_cli = conj.cod_cli;

-- 9. Selecione nome do cliente, nome do cônjuge, número do pedido que cada cliente fez,
-- valor de cada pedido que cada cliente fez e código do funcionário que atendeu a cada
-- pedido.

select
cli.nome_cli as 'Cliente', 
conj.nome_conj as 'Cônjuge', 
ped.num_ped as 'Número do pedido', 
ped.val_ped as 'Valor do pedido', 
func.cod_func as 'Código do funcionário'
from tbClientes as cli
inner join tbConjuge as conj on
cli.cod_cli = conj.cod_cli
inner join tbPedidos as ped on
ped.cod_cli = cli.cod_cli
inner join tbFuncionarios as func on 
ped.cod_func = func.cod_func;
