drop database dbMercadoSA;

create database dbMercadoSA;
show databases;
use dbMercadoSA;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf char (14) not null unique,
salario decimal(9.2) default 0 check(salario >=0),
sexo char(1) default 'F' check(sexo in('F','M')),
primary key(codFunc)
);

create table tbCliente(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char (10),
primary key (codCli)
);

create table tbFornecedor(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codForn)
);

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);


create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
dataEntrada date,
horaEntrada time,
quantidade decimal(9,2),
valorUnit decimal(9,2),
codForn int not null,
primary key (codProd),
foreign key(codForn) references tbFornecedor(codForn)
);

create table tbVendas(
codVenda int not null auto_increment,
codUsu int not null,
codCli int not null,
codProd int not null,
dataVenda date,
horaVenda time,
quantidade decimal(9,2),
valorTotal decimal(9,2),
primary key (codVenda),
foreign key (codUsu) references tbUsuarios(codUsu),
foreign key (codCli) references tbCliente(codCli),
foreign key (codProd) references tbProdutos(codProd)
);

desc tbFuncionarios;
desc tbCliente;
desc tbFornecedor;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

-- inserindo registros nas tabelas
insert into tbFuncionarios(nome,email,cpf,salario,sexo) values('Manoel Gomes','bluepenman@gmail.com','145.879.864-64',1500.00,'M');
insert into tbCliente(nome,email,telCel) values ('Joaquim','joaquinzao@gmail.com','98563-9631');
insert into tbCliente(nome,email,telCel) values ('Jotaro Joestar','jotaro@gmail.com','96359-7513');
insert into tbFornecedor(nome,email,cnpj) values ('burger king', 'bkzao@gmail.com','57.135.485/4871-54');
insert into tbFornecedor(nome,email,cnpj) values ('KFC', 'KFCZAO@gmail.com','99.236.236/8741-49');
insert into tbUsuarios(nome,senha,codFunc) values('Manoel Gomes','canetaazul',1);
insert into tbProdutos(descricao,dataEntrada,horaEntrada,quantidade,valorUnit,codForn) values ('Frango','2023/08/10','16:53:00',20,10.00,2);
insert into tbProdutos(descricao,dataEntrada,horaEntrada,quantidade,valorUnit,codForn) values ('Hamburguer','2023/08/10','16:30:00',10,20.00,1);
insert into tbProdutos(descricao,dataEntrada,horaEntrada,quantidade,valorUnit,codForn) values ('Batata','2023/08/10','16:11:00',25,5.00,1);
insert into tbVendas(codUsu,codCli,codProd,dataVenda,horaVenda,quantidade,valorTotal) values (1,2,2,'2023/08/10','17:00:00',2,40.00);
insert into tbVendas(codUsu,codCli,codProd,dataVenda,horaVenda,quantidade,valorTotal) values (1,1,3,'2023/08/10','17:00:00',1,5.00);

-- pesquisando as tabelas
select*from tbFuncionarios;
select*from tbCliente;
select*from tbFornecedor;
select*from tbUsuarios;
select*from tbProdutos;
select*from tbVendas;