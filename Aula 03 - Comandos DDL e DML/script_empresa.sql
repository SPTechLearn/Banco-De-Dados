-- DDL: DATA DEFINITION LANGUAGE - TODOS Q TEM TABLE
-- DML: DATA MANIPULATION LANGUAGE - INSERT, SELECT,
-- UPDATE E DELETE

-- UPDATE NOMETABELA SET CAMPO1 = 'XPTO', CAMPO2 = 'OTPX'
	-- WHERE ID = 1;

-- DELETE FROM NOMETABELA WHERE ID = 1;

-- CREATE TABLE NOMETABELA ( CAMPO1 TIPAGEM, CAMPO2 TIPAGEM);

USE faculdade1adsc;

SELECT * FROM aluno;

-- Aula 3
-- alter table
ALTER TABLE aluno ADD COLUMN email varchar(50);

DESC aluno;

SELECT * FROM aluno;

UPDATE aluno SET email = 'pedro@sptech.school'
	WHERE ra = '01212166';
    
    
UPDATE aluno SET email = 'leticia@sptech.school'
		WHERE ra = '01222004';
        
UPDATE aluno SET email = 'matheus@sptech.school'
	WHERE ra = '01222100';
    
-- Excluir a coluna bairro
ALTER TABLE aluno DROP COLUMN bairro;

DESC aluno;

SELECT * FROM aluno;

ALTER TABLE aluno RENAME COLUMN nome to nomeAluno;

-- Criar a tabela empresa
CREATE TABLE empresa (
id int primary key auto_increment,
nome varchar(50) NOT NULL,
responsavel varchar(50) DEFAULT 'Alguém',
dtFund DATETIME,
tipo varchar(50), CONSTRAINT chkTipo CHECK
	(tipo in ('Matriz', 'Filial'))
);

DESC empresa;

INSERT INTO empresa (nome, dtFund, tipo) VALUES
	('SPTech', '2016-01-01 08:00:00', 'Matriz');
    
SELECT * FROM empresa;

INSERT INTO empresa (nome, responsavel, dtFund, tipo) VALUES
	('Accenture', 'Rosana', '2009-12-30', 'Loja');
-- Error Code: 3819. Check constraint 'chkTipo' is violated.

INSERT INTO empresa (nome, responsavel, dtFund, tipo) VALUES
	('Accenture', 'Rosana', '2009-12-30', 'Matriz');
    
SELECT * FROM empresa;

-- Alterar o check para matriz, filial e loja
ALTER TABLE empresa DROP CONSTRAINT chkTipo;

INSERT INTO empresa (nome, responsavel, dtFund, tipo) VALUES
	('Safra', 'Eli', '2000-02-18', 'Loja');
    
SELECT * FROM empresa;

ALTER TABLE empresa ADD CONSTRAINT chkTipo CHECK
	(tipo in ('Matriz', 'Filial', 'Loja'));
    
-- forma diferente do comando da linha 77
ALTER TABLE empresa ADD CONSTRAINT chkTipo CHECK
	(tipo ='Matriz'or tipo = 'Filial'or tipo = 'Loja');
    
-- campo email da tabela aluno
ALTER TABLE aluno ADD CONSTRAINT chkEmail CHECK
	(email LIKE '%@%');
    
INSERT INTO empresa (nome, responsavel, dtFund, tipo) VALUES
	('Mercado do Luiz', 'Luiz', '2000-02-18', 'Mercado');
-- Error Code: 3819. Check constraint 'chkTipo' is violated

SELECT * FROM empresa;

DELETE FROM empresa WHERE id >=1;

INSERT INTO empresa VALUES 
	(null, 'SPtech', 'Petry', '2016-01-01', 'Matriz');
    
TRUNCATE TABLE empresa;

SELECT * FROM empresa;

INSERT INTO empresa VALUES 
	(null, 'SPtech', 'Petry', '2016-01-01', 'Matriz');

/*CREATE TABLE empresa (
id int primary key auto_increment,
nome varchar(50) NOT NULL,
responsavel varchar(50) DEFAULT 'Alguém',
dtFund DATETIME,
tipo varchar(50), CONSTRAINT chkTipo CHECK
	(tipo in ('Matriz', 'Filial'))
) auto_increment = 100;*/