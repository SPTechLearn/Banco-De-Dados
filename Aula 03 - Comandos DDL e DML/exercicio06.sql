create table revista (
idRevista int primary key auto_increment,
nome varchar (40),
categoria varchar (30)
);
insert into revista(nome) values
('Veja'),
('Vogue'),
('Tititi'),
('Forbes');
select * from revista;

update revista set categoria = 'Politica' where idRevista in (1, 4);
update revista set categoria = 'Moda' where idRevista = 2;
select * from revista;

insert into revista(nome,categoria) values
('Mundo Estranho', 'Curiosidades'),
('Isto é', 'Noticias'),
('Marie Claire', 'Moda');
select * from revista;
desc revista;

alter table revista modify column categoria varchar (40);
desc revista;

alter table revista add Periodicidade varchar (15);
select * from revista;

drop database sprint1;