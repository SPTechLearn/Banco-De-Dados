create database sprint1;
use sprint1;

create table musica(
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40));

insert into musica values 
(1, 'Do I Wanna Know','Arctic Monkeys','Indie'),
(2, 'The Less I Know The Better','Tame Impala','Indie'),
(3, 'Supera','Péricles','Pagode'),
(4, 'Yesterday','The Beatles','Rock'),
(5, 'Scar Tissue','Red Hot Chillie Peppers','Rock'),
(6, 'Come Together','The Beatles','Rock'),
(7, 'Anos Luz','Matue','Rap'),
(8, 'Formula Magica da Paz','Racionais','Rap'),
(9, 'Polarize','Twenty One Pilots','`Pop'),
(10, '505','Arctic Monkeys','Indie');

select * from musica;

select titulo, artista from musica;

select * from musica where genero like 'Rock';

select * from musica where artista like 'The Beatles';

select * from musica order by titulo;

select * from musica order by artista desc;

select * from musica where titulo like 'S%';

select * from musica where artista like '%s';

select * from musica where genero like '_a%';

select * from musica where titulo like '%a_';

drop table musica;
