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

create table tbConta(
codConta int not null auto_increment,
avaliacao varchar(100),
valorGorjeta decimal(9,2),
ValorConta decimal(9,2),
valorTotal decimal(9,2),
codFunc int not null,
primary key (codConta),
foreign key (codFunc) references tbFuncionarios(codfun)
);


-- insert into tbConta(avaliacao, valorGorjeta, valorConta, valorTotal, codFunc) values (@avaliacao, @valorGorjeta, @ValorConta, @valorTotal, @codFunc);

-- select codFunc from tbFuncionarios where nome like '%+nome+%';

-- insert into tbUsuarios(usuario,senha,codFunc)values('admin','admin',1);

-- insert into tbUsuarios(usuario,senha,codFunc)values(@usuario,@senha,@codFunc);

-- select * from tbUsuarios where usuario = 'admin' and senha = 'admin';

-- select func.nome from tbUsuarios as usu inner join tbFuncionarios as func on usu.codFunc != func.codFunc;

-- -insert into tbFuncionarios(nome,email,cpf,dNasci,endereco,cep,numero,bairro,cidade,estado) values();

-- alterar usuarios
-- update into tbUsuarios set usuario = @usuario, senha = @senha where codusu = @codusu;

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


-- select usu.usuario, usu.senha, func.codFunc from tbFuncionarios as func inner join tbUsuarios as usu on func.codFunc = usu.codFunc where func.nome = 'marquito';
