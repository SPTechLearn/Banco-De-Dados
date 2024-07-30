-- Criar banco de dados "semestre1"
create database semestre1;

-- Usar "semestre1"
use semestre1;

-- Criar tabelas "grupo", "aluno", "professor" e "avaliacao"
create table grupo(
idGrupo int primary key auto_increment,
nome varchar(45),
descricao varchar(45)
);

create table aluno(
RA char(8) primary key,
nome varchar(45),
email varchar(45),
fkGrupo int,
foreign key(fkGrupo) references grupo(idGrupo)
);

create table professor(
idProfessor int primary key auto_increment,
nome varchar(45),
disciplina varchar(45)
)auto_increment = 10000;

create table avaliacao(
fkGrupo int,
foreign key(fkGrupo) references grupo(idGrupo),
fkProfessor1 int,
foreign key(fkProfessor1) references professor(idProfessor),
fkProfessor2 int,
foreign key(fkProfessor2) references professor(idProfessor),
dtHora datetime,
nota decimal(2,1),
primary key(fkGrupo,fkProfessor1,fkProfessor2)
);

-- Inserir dados nas tabelas "grupo", "aluno", "professor" e "avaliacao"
insert into grupo values
(null,'Grupo1','Controle de temperatura em data centers'),
(null,'Grupo2','Controle de temperatura em farmácias'),
(null,'Grupo3','Controle de umidade em estufas'),
(null,'Grupo4','Controle de luz em ambientes fechados');

insert into aluno values
('01222001','Paulo Alvares', 'pauloalvares66@gmail.com', 1),
('01222002','Pedro Rocha', 'pedrorocha011@gmail.com', 1),
('01222003','Luis Nison', 'luisnis0n@gmail.com', 1),
('01222004','Jõao Vitor', 'joaovitor123@gmail.com', 1),
('01222005','Emilly Liberatto', 'emyzinha0908@gmail.com', 1),
('01222006','Newton Gabriel', 'newtonferreira@gmail.com', 2),
('01222007','Henrique Dwart', 'dwarteSantos123@gmail.com', 2),
('01222008','Marcos Vinicius', 'marquinhosdavilla09567@gmail.com', 2),
('01222009','Fernanda Pires', 'fepires097@gmail.com', 3),
('01222010','Cleiton Mauro', 'cleimau09@gmail.com', 3),
('01222011','Suzane Rocha', 'surocha56@gmail.com', 3),
('01222012','Alan de Freitas', 'alanzinho765@gmail.com', 3),
('01222013','Marcos Leonardo', 'meninodavila098@gmail.com', 4),
('01222014','Neymar Junior', 'neymarjunior09@gmail.com', 4);

insert into professor values
(null,'Fernanda Caramico', 'Pesquisa e Inovação'),
(null,'Vivian Silva', 'Banco de Dados'),
(null,'José Yoshida', 'Algoritmos'),
(null,'Rogério Chola', 'Arquitetura Computacional'),
(null,'JP', 'Algoritmos'),
(null,'Mônica', 'Tecnologia da Informação');

insert into avaliacao values
(1, 10001, 10002, '2022/10/26 14:00:03', 9.5),
(2, 10000, 10003, '2022/10/26 15:00:40', 8.5),
(3, 10003, 10005, '2022/10/26 15:51:10', 6.5),
(4, 10000, 10004, '2022/10/26 16:01:12', 4.5);

-- Exibir dados das tabelas
select * from grupo;
select * from aluno;
select * from professor;
select * from avaliacao;

-- Exibir os dados dos grupos e de seus membros
select * from grupo join aluno on fkGrupo = idGrupo;

-- Exibir os dados de um unico grupo e seus membros
select * from grupo join aluno on fkGrupo = idGrupo where idGrupo = 1;

-- Exibir as médias atribuidas aos grupos
select truncate(avg(nota),1) 'Média das Notas' from avaliacao;

-- Exibir a nota mínima e a nota maxíma atribuida aos grupos
select min(nota) 'Menor Nota', max(nota) 'Maior Nota' from avaliacao;

-- Exibir a soma das notas dos grupo
select sum(nota) 'Soma das Notas' from avaliacao;

-- Exibir os dados dos professores, dos grupos avaliados, a nota e a data da avaliação
select * from professor join avaliacao on fkProfessor1 = idProfessor 
	or fkProfessor2 = idProfessor
		join grupo on fkGrupo = idGrupo;
        
-- Exibir os dados dos professores, de um grupo específico, a nota e a data da avaliação
select * from professor join avaliacao on fkProfessor1 = idProfessor 
	or fkProfessor2 = idProfessor
		join grupo on fkGrupo = idGrupo where idGrupo = 1;
        
-- Exibir os nomes dos grupos que foram avaliados por um determinado professor
select g.nome from grupo as g join avaliacao as a on fkGrupo = idGrupo
	join professor as p on fkProfessor1 = idProfessor
		or fkProfessor2 = idProfessor where p.nome = 'José Yoshida';
        
-- Exibir os dados dos grupos, dos membros, dos professores avaliadores, a data e hora da avaliação.
select * from grupo join aluno as al on al.fkGrupo = idGrupo
	join avaliacao as a on a.fkGrupo = idGrupo
		join professor on fkProfessor1 = idProfessor 
			or fkProfessor2 = idProfessor;
            
-- Exibir a quantidade de notas distintas
select count(distinct(nota)) 'Notas Diferentes' from avaliacao;

-- Exibir o nome do professor, a média das notas e a soma das notas agrupadas por professor 
select nome, truncate(avg(nota),1) 'Média das Notas', sum(distinct(nota)) 'Soma das Notas' from professor join avaliacao group by nome;

-- Exibir o nome do grupo, a média das notas e a soma das notas agrupadas por grupo 
select nome, truncate(avg(nota),1) 'Média das Notas', sum(distinct(nota)) 'Soma das Notas' from grupo join avaliacao group by nome;

-- Exibir o nome do professor, a menor nota e a maior nota agrupadas por professor 
select nome, min(nota) 'Menor Nota', max(nota) 'Maior Nota' from professor join avaliacao group by nome; 

-- Exibir o nome do grupo, a menor nota e a maior nota agrupadas por grupo 
select nome, min(nota) 'Menor Nota', max(nota) 'Maior Nota' from grupo join avaliacao group by nome;