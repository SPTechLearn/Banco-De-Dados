# CRIAR BANCO DE DADOS
CREATE DATABASE faculdade1adsc;

# SELECIONAR O BANCO DE DADOS
USE faculdade1adsc;

# CRIAR TABLE aluno
CREATE TABLE aluno (
ra char(8) primary key,
nome varchar(50),
bairro varchar(50)
);

# EXIBIR OS DADOS DA TABELA
SELECT * FROM aluno;

# INSERIR DADOS NA TABELA
INSERT INTO aluno VALUES 
	('01222999', 'Vivian', 'Paraíso');
    
# INSERIR MAIS DE UM ALUNO DE UMA VEZ
INSERT INTO aluno VALUES
	('01212166', 'Pedro', 'Guaianazes'),
	('01222136', 'Igor', 'Grajaú'),
	('01222167', 'Luiz', 'Vila Medeiros');

# EXIBIR OS ALUNOS EM ORDEM ALFABÉTICA
# CRESCENTE
SELECT * FROM aluno ORDER BY nome ASC;
# DECRESCENTE
SELECT * FROM aluno ORDER BY nome DESC;