create database sprint1;
use sprint1;

create table curso(
idCurso int primary key,
nome varchar (50),
sigla varchar (3),
coordenador varchar (50));

insert into curso values
(1, 'Algoritmos', 'Alg', 'Fernando'),
(2, 'Música', 'Mus', 'Laura'),
(3, 'Banco de Dados', 'Bdd', 'Vivian'),
(4, 'Desenho', 'Des', 'Emilly'),
(5, 'Matematica', 'Mat', 'Gustavo'),
(6, 'Gastronomia', 'Gas', 'Clara');

select * from curso;

select coordenador from curso;

select * from curso where sigla like 'Mus';

select * from curso order by nome asc;

select * from curso order by coordenador desc;

select * from curso where nome like 'A%';

select * from curso where nome like '%a';

select * from curso where nome like '_a%';

select * from curso where nome like '%c_';

drop table curso;