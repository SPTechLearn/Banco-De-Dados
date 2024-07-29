-- Criando e usando o database
create database AlunoProjeto;
use AlunoProjeto;

-- Criando as tabelas "Projeto", "Aluno" e "Acompanhante"
create table Projeto(
idProjeto int primary key auto_increment,
nome varchar(45),
descricao varchar(100));

create table Aluno(
RA char(8) primary key,
nome varchar(45),
telefone char(11),
fkProjeto int, foreign key (fkProjeto) references Projeto (idProjeto),
fkRepresentante char(8), foreign key (fkRepresentante) references Aluno (RA));

create table Acompanhante(
idAcompanhante int auto_increment,
nome varchar(45),
relacao varchar(45),
fkAluno char(8), foreign key (fkAluno) references Aluno (RA),
primary key (idAcompanhante,fkAluno));

-- Inserinfo dados nas tabelas "Projeto", "Aluno" e "Acompanhante"
insert into Projeto values
(null, 'Volcaron', 'Vulcão em erupção, usando reação quimíca'),
(null, 'Ondata', 'Dashboard para data centers, usando os conhecimentos de T.I'),
(null, 'Melado', 'Mel anti gordura, sem açucar e sem glutem, projeto de nutrição');

insert into Aluno values
('01222001','Paulo Alvares', '11975650891',2,null),
('01222002','Emilly Liberato', '11975651234',2,'01222001'),
('01222003','Ryan Landucci', '11912340891',1,'01222001'),
('01222004','Leonardo Vasconcelos', '11975659876',1,'01222001'),
('01222005','Thiago Pequeno', '11998760891',2,'01222001'),
('01222006','Pedro Rocha', '11975654321',1,null),
('01222007','Iury Neves', '11943210891',2,'01222006'),
('01222008','Giovanna Teles', '11975650983',2,'01222006'),
('01222009','João Campos', '11975653986',1,'01222006'),
('01222010','Geovana Joia', '11975650229',3,null),
('01222011','Fernanda de Lima', '11975650000',3,'01222010'),
('01222012','Marcos Ferreira', '11975653866',3,'01222010'),
('01222013','Nauana Pontes', '11975659478',3,'01222010');

insert into Acompanhante values
(null, 'Fernanda Alvares', 'Mãe', '01222001'),
(null, 'Marcos Jorge', 'Pai', '01222002'),
(null, 'Melissa Teves', 'Irmã', '01222003'),
(null, 'Glauber Rocha', 'Primo', '01222004'),
(null, 'Viviana Antunes', 'Tia', '01222005'),
(null, 'Antonia Pereira', 'Namorada', '01222006'),
(null, 'Lucas Chaves', 'Namorado', '01222007'),
(null, 'Matheus da Costa', 'Irmão', '01222008'),
(null, 'Suelen Silva', 'Mãe', '01222009'),
(null, 'Vivian Marques', 'Irmã', '01222010'),
(null, 'Jorge Alex', 'Pai', '01222011'),
(null, 'Paulo Lennon', 'Primo', '01222012'),
(null, 'Jhon Mccarteney', 'Tio', '01222013');

-- Exibindo os dados das tabelas separadamente
select * from Projeto;
select * from Aluno;
select * from Acompanhante;

-- Exibindo os dados dos Alunos e seus Projetos
select * from Aluno join Projeto on fkProjeto = idProjeto;

-- Exibindo os dados do Alunos e seus Acompanhantes
select * from Aluno join Acompanhante on fkAluno = RA;

-- Exibindo os dados dos Alunos e seus Representantes
select * from Aluno as a join Aluno as r on a.RA = r.fkRepresentante;

-- Exibindo os dados dos Alunos e de seus Projetos
select * from Aluno join Projeto on fkProjeto = idProjeto where Projeto.nome = 'Volcaron';

-- Exibindo os dados dos Alunos, seus Projetos e de seus Acompanhantes
select * from Aluno join Projeto on fkProjeto = idProjeto 
		      join Acompanhante on fkAluno = RA;
              
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

-- Criando e selecionando o banco de dados
create database Campanha;
use Campanha;

-- Criando as tabelas "Organizador e CampanhaDoa"
create table Organizador(
idOrganizador int auto_increment primary key,
nome varchar(45),
rua varchar(45),
bairro varchar(45),
email varchar(45),
fkExperiente int, foreign key(fkExperiente) references Organizador(idOrganizador))auto_increment=30;

create table CampanhaDoa(
idCampanha int auto_increment,
categoria varchar(45),
instituicao1 varchar(45),
instituicao2 varchar(45),
dtFinal date,
fkOrganizador int, foreign key(fkOrganizador) references Organizador(idOrganizador),
primary key(idCampanha, fkOrganizador))auto_increment=500;

-- Inserindo dados nas tabelas "Organizador" e "CampanhaDoa"
insert into Organizador values
(null,'Paulo Alvares', 'Reginaldo Nilson da Silva','Baronesa','pauloalvares66@gmail.com', null),
(null,'Emilly Liberato', 'Octalles Marcondes Ferreira','Helena Maria','emyzinha77@gmail.com', null),
(null,'Ryan Landucci', 'Avenida dos Remédios','Remédios','landucciRyan908@gmail.com', null),
(null,'Patricia de Lima', 'Maria Campos Flores','Veloso','patricinhadagraça838@outlook.com', 30),
(null,'Luiza Mccartney', 'Avenida Paulista','Consolação','luizabeatles6987@outlook.com', 30),
(null,'Ricardo Maglio', 'João Ventura dos Santos','Baronesa','maglioricardovisk32@hotmail.com', 31),
(null,'Nicolle Waterson', 'Raposo Tavares','Campo das Flores','watersoninterprises@gmail.com', 32);

insert into CampanhaDoa values
(null, 'Roupa', 'SafraBanck', 'Ripadores','2022-09-30',30),
(null, 'Produtos para Pets', 'Love Dogers', 'Tamar','2022-10-31',30),
(null, 'Produtos de Higiene', 'Globo', 'SBT','2022-12-12',31),
(null, 'Arrecadação de Dinheiro', 'Teleton', 'AACD','2022-12-25',32),
(null, 'Alimentos', 'Fatec', 'USP','2022-11-30',33),
(null, 'Roupa', 'Assistencia Social', 'ETEC','2022-09-30',34),
(null, 'Instrumentos Musicais', 'Clave de Sol', 'Muniarcas','2022-10-15',34),
(null, 'Alimentos', 'SafraBanck', 'Globo','2022-09-22',35),
(null, 'Produtos de Higiene', 'AACD', 'ETEC','2022-11-30',36);

-- Exibindo os dados das tabelas "Organizador" e "CampanhaDoa" separadamente
select * from Organizador;
select * from CampanhaDoa;

-- Exibindo os dados dos Organizadores e de suas Campanhas
select * from Organizador join CampanhaDoa on fkOrganizador = idOrganizador;

-- Exibindo os dados de um organizador e suas campanhas
select * from Organizador join CampanhaDoa on fkOrganizador = idOrganizador where nome = 'Paulo Alvares';

-- Exibindo os dados dos organizadores novatos e de seus orientadores
select * from Organizador as o join Organizador as e on o.idOrganizador = e.fkExperiente;

-- Exibir os dados dos organizadores novatos orientados por um organizador
select * from Organizador as o join Organizador as e on o.idOrganizador = e.fkExperiente where o.nome = 'Paulo Alvares'; 

-- Exibir os dados dos organizadores novatos com seus orientadores e suas campanhas
select * from Organizador as o join Organizador as e on o.idOrganizador = e.fkExperiente join CampanhaDoa on fkOrganizador = o.idOrganizador;

-- Exibir os dados de um organizador novato, seu orientador e suas campanhas 
select * from Organizador as o join Organizador as e on o.idOrganizador = e.fkExperiente join CampanhaDoa on fkOrganizador = o.idOrganizador where e.nome = 'Luiza Mccartney';