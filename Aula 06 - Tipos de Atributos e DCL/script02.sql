use sprint1;

create table curso (
idCurso int primary key auto_increment,
nome varchar(50),
sigla char(3),
coordenador varchar(50)
);

insert into curso (nome, sigla, coordenador) values
('Administração', 'ADM', 'Mauro'),
('Gerencia','GER','Claudinho'),
('Logistica','LOG','Paulo');

create table unidade (
idUnidade int primary key auto_increment,
nome varchar(30)
);

insert into unidade (nome) values
('Maria Rosa'),
('Euclides Cunha'),
('Mauro Filho');

alter table curso add column fkunidade int;
alter table curso add foreign key (fkunidade) references unidade(idUnidade);

update curso set fkunidade = 1 where idCurso = 1;  
update curso set fkunidade = 2 where idCurso = 2;  
update curso set fkunidade = 3 where idCurso = 3;

select curso.nome, unidade.nome from curso join unidade on idUnidade = fkunidade;