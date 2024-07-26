create database sprint1;
use sprint1;

create table filme(
idFilme int primary key,
titulo varchar(50),
genero varchar(40),
diretor varchar(40));

insert into filme values 
(1,'A Forma da Agua','Drama','Guilhermo Del Toro'),
(2,'Clube da Luta','Drama','David Fincher'),
(3,'Vingadores: Ultimato','Ação','Joe Russo e Anthony Russo'),
(4,'Homem Aranha: Sem Volta pra Casa','Ação','Jon Watts'),
(5,'Parasita','Drama','Bong Joon-ho'),
(6,'Hereditario','Terror','Ari Aster'),
(7,'Harry Potter e o Prisioneiro de Azkaban','Fantasia','Alfonso Cuaron'),
(8,'Senhor dos Aneis e as Duas Torres','Fantasia','Peter Jackson'),
(9,'Circulo de Fogo','Ficção Cientifica','Guilhermo Del Toro'),
(10,'Shrek','Fantasia','Andrew Adamson e Vicky Jenson'),
(11,'Todo Poderoso','Comedia','Tom Shadyac'),
(12,'O Maskara','Comedia','Chuck Russel'),
(13,'Corra','Terror','Jordan Peele'),
(14,'Vingadores: Guerra Infinita','Ação','Joe Russo e Anthony Russo');

select * from filme;

select titulo, diretor from filme;

select * from filme where genero like 'Drama';

select * from filme where diretor like 'Guilhermo Del Toro';

select * from filme order by titulo;

select * from filme order by diretor desc;

select * from filme where titulo like 'V%';

select * from filme where diretor like '%o';

select * from filme where genero like '_o%';

select * from filme where titulo like '%i_';

drop table filme;