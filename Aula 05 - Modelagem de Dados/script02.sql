create database sprint2;
use sprint2;

create table musica(
idMusica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40));

insert into musica (titulo,artista,genero) values 
('Do I Wanna Know','Arctic Monkeys','Indie'),
('Supera','Péricles','Pagode'),
('Yesterday','The Beatles','Rock'),
('Scar Tissue','Red Hot Chillie Peppers','Rock'),
('Come Together','The Beatles','Rock'),
('505','Arctic Monkeys','Indie');

create table album(
idAlbum int primary key auto_increment,
nome varchar(40),
tipo varchar(30), constraint ftipo check (tipo in ('Fisico', 'Digital'))
); 

insert into album (nome, tipo) values
('AM', 'Fisico'),
('Pagode do Periclão', 'Digital'),
('Abbey Road', 'Fisico'),
('Californication','Fisico');

alter table album add column dtlan date;
insert into album (dtlan) values
('2013-10-08'),
('2020-08-01'),
('1963-09-10'),
('1989-11-23');

select idMusica from musica; 
select titulo from musica; 
select artista from musica; 
select genero from musica; 
select idAlbum from album; 
select dtlan from album; 
select nome from album; 
select tipo from album; 

alter table musica add column fkalbum int;
alter table musica add foreign key (fkalbum) references album(idAlbum);

update musica set fkalbum = 1 where idMusica = 1;  
update musica set fkalbum = 2 where idMusica = 2;  
update musica set fkalbum = 3 where idMusica = 3;  
update musica set fkalbum = 4 where idMusica = 4;  
update musica set fkalbum = 3 where idMusica = 5;  
update musica set fkalbum = 1 where idMusica = 6;

select musica.titulo, album.idAlbum from musica join album on idAlbum = fkalbum;
select musica.titulo, album.nome from musica join album on idAlbum = fkalbum;
select * from musica join album on idAlbum = fkalbum where album.nome = 'AM';