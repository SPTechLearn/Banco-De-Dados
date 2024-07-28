create database sprint2;
use sprint2;

create table atleta(
idAtleta int primary key auto_increment,
nome varchar (40),
modalidade varchar (40),
qtdMedalha int
);

insert into atleta values
('Mauro','Volêi',3),
('Paulo','Futebol',9),
('Ana','Volêi',1),
('Ryan','Basquete',4),
('Emilly','Futebol',6),
('Geoavana','Corrida',3),
('Matheus','Corrida',2),
('Isabela','Basquete',8),
('Fernanda','Futebol',1),
('Leonardo','Futebol',3);

create table pais(
idPais int primary key auto_increment,
nome varchar (30),
capital varchar (40)
);

insert into pais (nome, capital)values
('Brasil', 'Brasilia'),
('Canada', 'Otawa'),
('Estados Unidos', 'Whashington'),
('França', 'Paris'),
('Italia', 'Roma');

alter table atleta add column fkpais int;
alter table atleta add foreign key (fkpais) references pais(idPais);

select * from atleta;

update atleta set fkpais = 1 where idAtleta = 1;  
update atleta set fkpais = 2 where idAtleta = 2;  
update atleta set fkpais = 3 where idAtleta = 3;  
update atleta set fkpais = 4 where idAtleta = 4;  
update atleta set fkpais = 5 where idAtleta = 5;  
update atleta set fkpais = 1 where idAtleta = 6;  
update atleta set fkpais = 2 where idAtleta = 7;  
update atleta set fkpais = 3 where idAtleta = 8;  
update atleta set fkpais = 4 where idAtleta = 9;  
update atleta set fkpais = 5 where idAtleta = 10;

select * from atleta;

select atleta.nome, pais.nome from atleta join pais on idpais = fkpais;

select * from atleta join pais on idPais = fkpais where pais.capital = 'Brasilia';

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
