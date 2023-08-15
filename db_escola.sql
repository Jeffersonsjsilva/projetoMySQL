-- Nome: Jefferson Santana de Jesus Silva 

-- deletando banco de dados caso exista
drop database dbEscola;
-- criando o banco de dados 
create database dbEscola;
-- acessando o banco de dados
use dbEscola;
-- criando as tabelas
create table tbAtividade(
codigo_at int,
atividade varchar(45)
);

create table tbRegistro(
id_aluno int,
id_turma int,
ausencia int,
id_registro int
);

create table tbTurma(
id int,
quant_alunos int,
horario_aula datetime,
duracao_aula datetime,
data_inicio date,
data_fim date,
atividade int,
id_instrutor int,
id_monitor int
);

create table tbAluno(
matricula int,
data_matricula date,
nome varchar(45),
endereco varchar (45),
telefone varchar (11),
nascimento date,
altura float,
peso float,
id_turma int
);

create table tbInstrutor(
rg int,
nome varchar(45),
nascimento date,
titulacao varchar(45),
telefone varchar(11)
);

create table tbMonitor(
id_aluno int
);

-- visualizar tabelas 
show tables;

--- visualizar estrutura das tabelas
desc tbAtividade;
desc tbRegistro;
desc tbTurma;
desc tbAluno;
desc tbInstrutor;
desc tbMonitor;