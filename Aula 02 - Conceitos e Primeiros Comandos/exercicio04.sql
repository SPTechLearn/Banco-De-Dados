create database sprint1;
use sprint1;

create table professor(
idProfessor int primary key,
nome varchar (50),
especialidade varchar (50),
datanascimento date);

insert into professor values
(1, 'Mauro', 'Auxiliar PCD', '1980-09-23'),
(2, 'Fernanda', 'Pedagogia', '1979-05-09'),
(3, 'Marcia', 'Pedagogia', '1975-04-02'),
(4, 'Patricia', 'Educação Fisica', '1985-12-12'),
(5, 'Carlos', 'Algoritmos', '1980-03-08'),
(6, 'Vivian', 'Banco de Dados', '1980-10-13'),
(7, 'Thiago', 'Socioemocional', '1968-01-30'),
(8, 'Neide', 'Algoritmos', '1978-11-28'),
(9, 'Carla', 'Auxiliar PCD', '1983-07-15'),
(10, 'Elaine', 'Matematica', '1978-01-04');

select * from professor;

select especialidade from professor;

select * from professor where especialidade like 'Pedagogia';

select * from professor order by nome asc; 

select * from professor order by datanascimento desc;

select * from professor where nome like 'C%';

select * from professor where nome like '%a';

select * from professor where nome like '_a%';

select * from professor where nome like '%i_';

drop table professor;