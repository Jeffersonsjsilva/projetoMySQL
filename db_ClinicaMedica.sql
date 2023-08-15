-- Nome: Jefferson Santana de Jesus Silva 

-- deletando banco de dados caso exista
drop database dbClinicaMedica;
-- criando o banco de dados 
create database dbClinicaMedica;
-- acessando o banco de dados
use dbClinicaMedica;
-- criando as tabelas
create table tbMedicos(
medico_codigo int,
nome varchar(50),
telefone varchar(11)
);
create table tbConsulta(
codigo_consulta int,
data_consulta datetime,
medico_codigo int,
paciente_codigo int,
receita_codigo int
);
create table tbPaciente(
paciente_codigo int,
nome varchar(50),
telefone varchar(11),
convenio varchar(45)
);
create table tbReceitaMedica(
receita_codigo int,
descricao varchar(500)
);
-- visualizar tabelas 
show tables;
--- visualizar estrutura das tabelas
desc tbMedicos;
desc tbConsulta;
desc tbPaciente;
desc tbReceitaMedica;
