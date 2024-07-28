create database sprint1;
use sprint1;

create table atleta(
IDatleta int primary key, 
nome varchar(40),
modalidade varchar(40),
qtMedalha int);

insert into atleta values
(1, 'Mauro','Volêi',3),
(2, 'Paulo','Futebol',9),
(3, 'Ana','Volêi',1),
(4, 'Ryan','Basquete',4),
(5, 'Emilly','Futebol',6),
(6, 'Geoavana','Corrida',3),
(7, 'Matheus','Corrida',2),
(8, 'Isabela','Basquete',8),
(9, 'Fernanda','Futebol',1),
(10, 'Leonardo','Futebol',3);

select * from atleta;

select nome, qtMedalha from atleta;

select * from atleta where modalidade like 'Futebol';

select * from atleta order by modalidade asc;

select * from atleta order by qtMedalha desc;

select * from atleta where nome like '%s%';

select * from atleta where nome like 'M%';

select * from atleta where nome like '%o';

select * from atleta where nome like '%r_';

drop table atleta;