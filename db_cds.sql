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
-- inserindo registros na tabela tbCidades
insert into tbCidades()