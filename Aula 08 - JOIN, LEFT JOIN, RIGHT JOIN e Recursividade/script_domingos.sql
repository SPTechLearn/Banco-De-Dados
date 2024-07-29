CREATE DATABASE domingos;

USE domingos;

CREATE TABLE funcionario (
idFunc int primary key auto_increment,
nome varchar(45),
salario decimal(10,2),
fkSuper int,
constraint fkSupervisor foreign key (fkSuper)
	references funcionario(idFunc)
);

CREATE TABLE dependente (
idDep int,
fkFunc int,
foreign key (fkFunc) references funcionario(idFunc),
primary key (idDep, fkFunc),
nome varchar(45),
parentesco varchar(45)
);

SHOW TABLES;

-- criar um funcionário supervisor
INSERT INTO funcionario VALUES 
	(null, 'Domingos',8.99, null);
    
SELECT * FROM funcionario;

-- inserir os funcionários supervisionados pelo Domingos
INSERT INTO funcionario VALUES 
	(null, 'Vivian', 1.99, 1),
	(null, 'Paulo', 1.99, 1);

INSERT INTO funcionario (nome, salario, fkSuper) VALUES
	('Thiago', 0.09, 2);

SELECT * FROM funcionario;
SELECT * FROM dependente;

INSERT INTO dependente VALUES 
	(1,1,'Sábado','esposa'),
	(1,2,'Betinha','mãe');
    
INSERT INTO dependente VALUES
	(2,1,'Feriado','pai'),
	(1,4,'Tânia','irmã');

SELECT f.nome as NomeFunc,
	   s.nome as NomeSuper
       FROM funcionario as f
		JOIN funcionario as s
			ON f.fkSuper = s.idFunc;
            
SELECT f.nome as NomeFunc,
	   s.nome as NomeSuper,
       d.nome as NomeDep
       FROM funcionario as f
		JOIN funcionario as s
			ON f.fkSuper = s.idFunc
		JOIN dependente as d
			ON d.fkFunc = f.idFunc;
            
SELECT f.nome as NomeFunc,
	   d.nome as NomeDep
       FROM funcionario as f LEFT JOIN dependente as d
		ON f.idFunc = d.fkFunc;
        
SELECT f.nome as NomeFunc,
	   d.nome as NomeDep
       FROM funcionario as f LEFT JOIN dependente as d
		ON f.idFunc = d.fkFunc;
        
SELECT f.nome as NomeFunc,
	   IFNULL(d.nome, 'SEM DEPENDENTE') as NomeDep
       FROM funcionario as f LEFT JOIN dependente as d
		ON f.idFunc = d.fkFunc;
        
SELECT f.*,
	   s.nome as Supervisor
       FROM funcionario as f LEFT JOIN funcionario as s
		ON f.fkSuper = s.idFunc
			WHERE f.fkSuper is null;
            
            
create table treinador (
	idTreinador int primary key auto_increment,
    nome varchar (45),
    tel varchar (12),
    email varchar (45)
);

create table nadador (
idNadador int primary key auto_increment,
nome varchar(45),
origem varchar(45),
dtNasc date,
fkTreinador int,
foreign key (fkTreinador) references treinador(idTreinador)
)auto_increment = 10;

alter table treinador add column fkExperiente int;
alter table treinador 
add constraint fkExperient foreign key (fkExperiente) 
references treinador(idTreinador);


insert into treinador values
(null,'Antedeguemon','4002-8922','antedeguemos.122@gmail.com',null),
(null,'Jailson Mendes','6912-2134','jailsonmendesilva127@gmail.com',null);

INSERT INTO nadador VALUES
(null, 'Domingos Ciclone', 'São Paulo', '2000-09-14', 1),
(null, 'Chico Martelo', 'Bahia', '1989-03-10', 2),
(null, 'Talita Tsunami', 'Rio de Janeiro', '2001-11-04', 2),
(null, 'Francisco Barbatana', 'Paraíba', '1995-02-07', 1);

SELECT * FROM Nadador;
SELECT * FROM Treinador;

desc treinador;

SELECT * FROM treinador as t JOIN treinador as e
	ON t.fkExperiente = e.idTreinador;
    
UPDATE treinador SET fkExperiente = 2 WHERE idTreinador = 1;

delete from treinador where idTreinador >=3;

SELECT t.nome as treinador,
	   e.nome as experiente,
       n.nome as nadador
 FROM treinador as t JOIN treinador as e
	ON t.fkExperiente = e.idTreinador
    JOIN nadador as n 
		ON n.fkTreinador = t.idTreinador;