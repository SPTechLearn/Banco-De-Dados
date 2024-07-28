create database Pet;

use Pet;

create table pet(
idPet int auto_increment,
tipo varchar(45),
nome varchar(45),
raça varchar(45),
dtNasc date,
fkCliente int,
foreign key (fkCliente) references cliente(idCliente),
primary key (idPet,fkCliente))auto_increment=100;

create table cliente(
idCliente int primary key auto_increment,
nome varchar(45),
telefoneFixo char(11),
telefoneCelular char(11),
endereço varchar(45)
);

insert into pet values
(null, 'Cachorro','Plebe','Pincher','2008-09-08',1),
(null, 'Gato','Marry','Siames','2008-08-09',2),
(null, 'Gato','Cube','Malhado','2007-09-12',1),
(null, 'Cachorro','Mike','Pastor-Alemão','2008-11-25',3),
(null, 'Papagaio','Tarracho','Arara','2006-12-12',2),
(null, 'Gato','Kitgalor','Siames','2012-12-22',1),
(null, 'Cachorro','Luke','Vira-Lata','2020-01-02',3);

insert into cliente values
(null, 'Paulo Alvares', 11975650891, 11946096810, 'Osasco'),
(null, 'Marcos Pontes', 11919805657, 11901869064, 'Osasco'),
(null, 'Alvaro Alvares', 11967891234, 11943219876, 'São Paulo');

select * from pet;

select * from cliente;

alter table cliente modify column nome varchar (99);

select * from pet where tipo = 'Cachorro';

select nome, dtNasc from pet;

select *from pet order by nome;

select * from cliente order by endereço desc;

select * from pet where nome like 'M%';

select * from cliente where nome like '%Alvares';

update cliente set telefoneFixo = 11976865434 where idCliente = 3;

select * from cliente;

select * from pet join cliente on idCliente = fkcliente;

select * from pet join cliente on idCliente = fkcliente where idCliente = 1;

delete from pet where fkCliente = 3;

select * from pet;

drop table pet;

drop table cliente;

-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

create database GastosF;

use GastosF;

create table pessoa(
idPessoa int primary key auto_increment,
nome varchar(45),
dtNasc date,
profissao varchar(45));

create table gasto(
idGasto int auto_increment,
dtGasto date,
valor decimal(5,2),
descriçao varchar(99),
fkPessoa int,
foreign key (fkPessoa) references pessoa(idPessoa),
primary key (idGasto,fkPessoa))auto_increment=0;

insert into pessoa values
(null, 'Paulo Alvares', '2004-02-06', 'Desempregado'),
(null, 'Fernanda Alvares', '1979-05-09', 'Professora'),
(null, 'Gil Alvares', '1975-08-13', 'Segurança');

insert into gasto values
(null, '2022-08-09',450.00,'Mesa de escritório',1),
(null, '2022-09-12',3.50,'Pão',2),
(null, '2022-09-10',80.00,'Café do Starbucks',1),
(null, '2022-08-23',100.00,'Caixa de Som',3),
(null, '2022-08-31',50.00,'Blusa',2),
(null, '2022-08-09',150.00,'Violão',3);

select * from pessoa;

select * from gasto;

select * from pessoa where profissao = 'Desempregado';

select * from gasto where dtGasto = '2022-08-09';

select * from pessoa join gasto on idPessoa = fkPessoa;

select * from pessoa join gasto on idPessoa = fkPessoa where idPessoa = 1; 

update pessoa set nome = 'Gil Pereira' where idPessoa = 3;

delete from gasto where idGasto = 2;

-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

create database PraticaFuncionario;

use PraticaFuncionario;

create table setor(
idSetor int primary key auto_increment,
nome varchar(45),
andar int);

create table funcionario(
idFuncionario int auto_increment,
nome varchar(45),
telefone char(11),
salario decimal(6,2),
fkSetor int,
foreign key (fkSetor) references setor(idSetor),
primary key (idFuncionario,fkSetor))auto_increment=0;

create table acompanhante(
idAcompanhante int auto_increment,
nome varchar(45),
relaçao varchar(45),
dtNasc date,
fkFunc int,
foreign key (fkFunc) references funcionario(idFuncionario),
primary key (idAcompanhante,fkFunc))auto_increment=0;

insert into setor values 
(null, 'Segurança', 1),
(null, 'Marketing', 2),
(null, 'Finanças', 3),
(null, 'Comercial', 4),
(null, 'Logistica', 5);

insert into funcionario values
(null, 'Paulo Alvares', 11975650891, 4000.00, 4),
(null, 'Emilly Liberato', 11909871234, 2500.00, 2),
(null, 'Ryan Landucci', 11981435643, 3000.00, 1),
(null, 'Alvaro Moreira', 11981543654, 4500.00, 4),
(null, 'Pablo Mariano', 11947659876, 1000.00, 1),
(null, 'Cleber Machado', 11908976354, 1000.00, 3),
(null, 'Galvão Bueno', 11967854132, 2000.00, 3),
(null, 'Rodrigo Cezaretto', 11907987465, 3500.00, 5),
(null, 'Jamily Silva', 11971643987, 3000.00, 2),
(null, 'Neymar Junior', 11986541234, 1500.00, 5);

insert into acompanhante values
(null, 'Emilly de Lima', 'Esposa', '1994-09-22', 1),
(null, null, null, null, 2),
(null, 'Flavio Ferreira', 'Namorado', '2003-11-21', 3),
(null, 'Jorge Alcantra', 'Irmão', '1976-01-01', 4),
(null, 'Edson Silva', 'Pai', '1976-02-06', 5),
(null, null, null, null, 6),
(null, 'Marcia Silva', 'Mãe', '1980-05-13', 7),
(null, 'Fernanda Alvares', 'Mãe', '1979-05-09', 8),
(null, 'Emilly Silva', 'Irmã', '1994-07-30', 9),
(null, 'João Vitor', 'Pai', '1987-11-22', 10);

select * from setor;

select * from funcionario;

select * from acompanhante;

select * from setor join funcionario on idSetor = fkSetor;

select * from setor join funcionario on idSetor = fkSetor where idSetor = 1; 

select * from funcionario join acompanhante on idFuncionario = fkFunc;

select * from funcionario join acompanhante on idFuncionario = fkFunc where idFuncionario = 1;

select * from setor join funcionario join acompanhante on idSetor = fkSetor and idFuncionario = fkFunc; 

-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

create database Treinador;

use Treinador;

create table treinador(
idTreinador int primary key auto_increment,
nome varchar(45),
telefone char(11),
email varchar (45),
fkTreinador int,
foreign key (fkTreinador) references treinador (idTreinador))auto_increment=10;

create table nadador(
idNadador int primary key auto_increment,
nome varchar(45),
estado varchar(45),
dtNasc date,
fkTreinador int,
foreign key (fkTreinador) references treinador(idTreinador)) auto_increment=100;

insert into treinador values
(null, 'Rodrigo Marques', 1197565091,'rodrigo.marques@gmail.com',null),
(null, 'Emilly de Lima', 11996781432,'emilly.lima@gmail.com',null),
(null, 'Ricardo Landucci', 11998675678,'ricardo.landucci@gmail.com',10),
(null, 'Ariella Ferreira', 11946096810,'ariella.ferreira@gmail.com',null),
(null, 'Valeria Waterson', 11979865098,'valeria.waterson@gmail.com',10);

insert into nadador values
(null, 'Paulo Alvares', 'São Paulo', '2004-02-06',10),
(null, 'Emilly Liberato', 'São Paulo', '2004-09-22',11),
(null, 'Mauro Tavares', 'Santa Catarina', '1996-05-23',10),
(null, 'Viviana Marques', 'Amazonas', '1985-12-30',13),
(null, 'Ryan Lancducci', 'Distrito Federal', '2003-08-13',12),
(null, 'Leonardo Vasconcelos', 'Mato Grosso', '1997-11-02',11),
(null, 'Paulo André', 'Sergipe', '1979-05-09',14);

select * from treinador;

select * from nadador;

select * from treinador join nadador on treinador.idTreinador = nadador.fkTreinador;

select * from treinador join nadador on treinador.idTreinador = nadador.fkTreinador where treinador.idTreinador = 13;

select treinador.*, treinadorOrientador.nome  from treinador join treinador treinadorOrientador on treinadorOrientador.idTreinador = treinador.fkTreinador;

select treinador.*, treinadorOrientador.nome  from treinador join treinador treinadorOrientador on treinadorOrientador.idTreinador = treinador.fkTreinador where treiandorOrientador.idTreinador = 10;

select * from treinador join nadador on treinador.idTreinador = nadador.fkTreinador join treinador as tOrientador on tOrientador.idTreinador = treinador.fkTreinador;

select treinador.nome, nadador.*, tOrientador.* from treinador join nadador on treinador.idTreinador = nadador.fkTreinador join treinador as tOrientador on tOrientador.idTreinador = treinador.fkTreinador where tOrientador.idTreinador = 10;