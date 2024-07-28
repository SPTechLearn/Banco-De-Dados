USE faculdade1adsc;

SHOW TABLES;
DESC aluno;
DESC empresa;

SELECT * FROM aluno;
SELECT * FROM empresa;

INSERT INTO empresa (nome, tipo) VALUES
	('C6Bank', 'Matriz');
    
ALTER TABLE aluno ADD COLUMN fkEmpresa int;
ALTER TABLE aluno ADD foreign key (fkEmpresa)
	references empresa(id);
    
UPDATE aluno SET fkEmpresa = 1 WHERE ra = '01212166';    
UPDATE aluno SET fkEmpresa = 2 WHERE ra = '01222004';    

-- nosso primeiro join
SELECT * FROM aluno JOIN empresa 
	ON id = fkEmpresa;

SELECT aluno.nomeAluno, empresa.nome FROM aluno
	JOIN empresa ON id = fkEmpresa;
    
SELECT aluno.nomeAluno as Aluno, 
	   empresa.nome as Empresa 
	FROM aluno
		JOIN empresa ON id = fkEmpresa;
        
SELECT a.nomeAluno as Aluno, 
	   e.nome as Empresa 
	FROM aluno as a
		JOIN empresa as e ON id = fkEmpresa;