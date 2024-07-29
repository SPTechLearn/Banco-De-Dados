
/*Fazer a modelagem lógica de um sistema para cadastrar os treinadores de
nadadores, que participarão de vários campeonatos, representando o Brasil.
- Cada treinador treina mais de um nadador.
- Cada nadador tem apenas um treinador.
- Sobre cada nadador, o sistema guarda um identificador, que identifica de forma
única cada um deles. Esse identificador começa com o valor 100 e é inserido de
forma automática. Além desse identificador, o sistema guarda o nome, o estado de
origem e a data de nascimento do nadador.
*/


/*
Sobre cada treinador, o sistema guarda um identificador, que identifica de forma
única cada treinador. Esse identificador começa com o valor 10 e é inserido de forma
automática. O sistema também guarda o nome do treinador, o telefone (apenas um
número de telefone) e o e-mail do treinador.
*/


/*Um treinador mais experiente orienta outros treinadores novatos. Cada treinador
novato é orientado apenas por um treinador.
*/


-- Escrever os comandos do MySQL para:
-- a) Criar um banco de dados chamado Treinador.
drop database if exists treinador;

create database treinador;

-- b) Selecionar esse banco de dados.
use treinador;

-- c) Criar as tabelas correspondentes à sua modelagem.


drop table if exists treinador;

create table treinador(
idtreinador int primary key auto_increment,
nome varchar(50),
telefone char(11),
email varchar(50),
fktreinadororientador int,
foreign key treinador_fktreinadororientador (fktreinadororientador) references treinador (idtreinador)) AUTO_INCREMENT = 10;


-- ALTER TABLE treinador AUTO_INCREMENT = 10;
-- ALTER TABLE treinador add foreign key treinador_fktreinadororientador (fktreinadororientador) references treinador (idtreinador);


drop table if exists nadador;

create table nadador(
idnadador int primary key auto_increment,
nome varchar(50),
uf char(2),
dtnasc date,
fktreinador int,
foreign key nadador_fktreinador (fktreinador) references treinador(idtreinador)) AUTO_INCREMENT = 100;



insert into treinador(nome,telefone,email,fktreinadororientador) values 
('Vivian','11968887979','vivian.silva@sptech.school',null);

insert into treinador(nome,telefone,email,fktreinadororientador) values
('Rafael','11968887978','rafael.oliveira@sptech.school',10);

insert into treinador(nome,telefone,email,fktreinadororientador) values
('Celia','11968887977','celia@sptech.school',null);

insert into treinador(nome,telefone,email,fktreinadororientador) values
('Alex','11968887976','alex@sptech.school',13);

-- Celia -> Alex
-- update treinador set fktreinadororientador = 12 where idtreinador = 13;


-- ALTER TABLE nadador AUTO_INCREMENT = 100;

insert into nadador(nome, uf, dtnasc,fktreinador) values
('Paul Macdnonald', 'SP', '1942-06-18',10),
('Ringo King', 'RJ', '1940-07-07',10), 
('John Hut', 'MG', '1940-10-09',10), 
('Jorge Bell', 'ES', '1943-02-25',11),
('Zakk FC', 'PR', '1983-04-22',12),
('Josh Pop', 'RS', '1962-03-02',13);


-- update nadador set fktreinador = 10 where idnadador between 100 and 102;
-- update nadador set fktreinador = 11 where idnadador = 103;

-- d) Inserir dados nas tabelas, de forma que exista mais de um nadador para algum
-- treinador, e mais de um treinador sendo orientado por algum treinador mais
-- experiente.


-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from treinador;

select * from nadador;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- -- Alter na treinador
		-- alter table treinador add column fktreinadorexp int;
		-- alter table treinador add  foreign key fktreinadorexp (fktreinadorexp) references treinador (idtreinador);

-- -- Alter na nadador
-- alter table nadador add column fktreinador int;
-- alter table treinador add  foreign key fktreinador (fktreinador) references treinador (idtreinador);

-- g) Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
select
	treinador.nome,
	nadador.nome
	from treinador 
		join nadador 
			on treinador.idtreinador = nadador.fktreinador;
	
-- h) Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
select
	treinador.nome,
	nadador.nome
	from treinador 
		join nadador 
			on treinador.idtreinador = nadador.fktreinador
	where treinador.nome = 'Rafael';

		
-- i) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores.
select
	orientador.nome as treinador_orientador,
	treinador.nome as treinador
	from treinador 
		join treinador orientador
			on orientador.idtreinador = treinador.fktreinadororientador; 
		
		
		-- exemplo com left join
		select
	treinador.nome as treinador,
	orientador.nome as treinador_orientador
	from treinador 
		left join treinador orientador
			on orientador.idtreinador = treinador.fktreinadororientador; 
		
	
-- j) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores, 
-- porém somente de um determinado treinador orientador (informar onome do treinador na consulta).
select
	orientador.nome as treinador_orientador,
	treinador.nome as treinador
	from treinador 
		join treinador orientador
			on orientador.idtreinador = treinador.fktreinadororientador
	where orientador.nome = 'Vivian';
		
		
-- l) Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.
select
	-- orientador.nome as treinador_orientador,
	treinador.nome as treinador,
	nadador.nome
	from treinador 		
		join nadador 
			on nadador.fktreinador = treinador.idtreinador
	

select
	orientador.nome as treinador_orientador,
	treinador.nome as treinador,
	nadador.nome as nadador
	from treinador 		
		join nadador 
			on nadador.fktreinador = treinador.idtreinador
		join treinador orientador
			on treinador.fktreinadororientador = orientador.idtreinador;
			
-- LEFT JOIN
select
	orientador.nome as treinador_orientador,
	treinador.nome as treinador,
	nadador.nome
	from treinador 		
		join nadador 
			on nadador.fktreinador = treinador.idtreinador
		left join treinador orientador
			on treinador.fktreinadororientador = orientador.idtreinador;