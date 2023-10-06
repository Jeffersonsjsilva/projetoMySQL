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

create table tbUsuarios(
codUsu int not null auto_increment,
usuario varchar(30) not null,
senha varchar(10) not null,
codFunc int not null,
primary key(codUsu),
foreign key (codFunc) references tbFuncionarios(codFunc)
);

insert into tbUsuarios(usuario,senha,codFunc)values('admin','admin',1);


	select * from tbUsuarios where usuario = 'admin' and senha = 'admin';

-- insert into tbFuncionarios(nome,email,cpf,dNasci,endereco,cep,numero,bairro,cidade,estado) values();


-- Busca por código
-- select * from tbFuncionarios where codFunc = 1;

-- Busca por nome
-- select * from tbFuncionarios where nome like '%a%';

-- inserir campo de código não existente
-- select codFunc+1 from tbFuncionarios order by codFunc desc;

-- buscar funcionarios
-- select * from tbFuncionarios where nome = @nome;

-- alterar funcionarios
-- update tbFuncionarios set nome = @nome, email = @email, cpf = @cpf, dNasci = @dNasci, endereco = @endereco, cep = @cep, numero = @numero, bairro = @bairro, cidade = @cidade, estado = @estado where codFunc = @codFunc;

-- excluindo funcionarios
-- delete from tbFuncionarios where codFunc = @codFunc; 
