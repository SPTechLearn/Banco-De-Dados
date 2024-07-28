CREATE USER 'prod'@'localhost' IDENTIFIED BY
	'SPTECH';
    
-- GRANT ALL privileges ON faculdade1adsc.*
-- 	TO 'prod'@'localhost';

GRANT SELECT, UPDATE, DELETE, CREATE ON
	faculdade1adsc.*
 	TO 'prod'@'localhost';
    
FLUSH privileges;

-- Aula 7
USE faculdade1adsc;

CREATE TABLE funcionario (
idFunc int primary key auto_increment,
nome varchar(45),
salario decimal(3,2)
);

CREATE TABLE dependente (
idDep int auto_increment,
nome varchar(45),
parentesco varchar(45),
fkFunc int,
foreign key (fkFunc) references funcionario(idFunc),
primary key (idDep,fkFunc)
)auto_increment=100;

INSERT INTO funcionario values
	(null, 'Paulo', 0.99),
	(null, 'Rafael', 0.99);
    
SELECT * FROM funcionario;    
    
INSERT INTO dependente values
	(null, 'Paula', 'irmã',1),
	(null, 'Rafaela', 'irmã',2),
	(null, 'Paulão', 'pai', 1);
    
SELECT * FROM dependente;

SELECT * FROM funcionario as func
	JOIN dependente as dep
		ON func.idFunc = dep.fkFunc;
        
SELECT func.nome as NomeFunc,
	   dep.nome as NomeDep
       FROM funcionario as func
		JOIN dependente as dep
		ON func.idFunc = dep.fkFunc;