-- Criar e usar o banco de dados
create database Continuada2;

use Continuada2;

-- Criar as Tabelas "endereço", "hotel" e "quarto"
create table endereço(
idEndereço int primary key auto_increment,
estado varchar(45),
cidade varchar(45),
bairro varchar(45),
rua varchar(45),
CEP char(8));

create table hotel(
idHotel int primary key auto_increment,
nome varchar(45),
tHotel varchar(45), constraint chktHotel check (tHotel in ('Matriz', 'Filial')),
fkEndereço int, foreign key(fkEndereço) references endereço (idEndereço));

create table quarto(
idQuarto int,
nome varchar(45),
andar int,
tQuarto varchar(45), constraint chktQuarto check (tQuarto in ('Solteiro', 'Casal')),
fkHotel int, foreign key (fkHotel) references hotel (idHotel),
primary key (idQuarto,fkHotel));

-- Inserir dados nas tabelas "endereço", "hotel" e "quarto"
insert into endereço values
(null, 'São Paulo', 'Osasco', 'Baronesa', 'Reginaldo Nilson da Silva', '06268001'),
(null, 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', 'Calçadão Impanema', '06268002'),
(null, 'São Paulo', 'São Paulo', 'Consolação', 'Avenida Paulista', '06268003'),
(null, 'Minas Gerais', 'Ouro Preto', 'Água Limpa', 'Padre Bolim', '06268004'),
(null, 'Bahia', 'Salvador', 'Pituba', 'Antônio de Paula Ribas', '06268005');

insert into hotel values
(null, 'Boulevard Marcondes', 'Matriz', 1),
(null, 'Boulevard Tenório', 'Filial', 2),
(null, 'Boulevard Edu Guedes', 'Filial', 3),
(null, 'Boulevard Franscisco', 'Filial', 4),
(null, 'Boulevard Paulistão', 'Filial', 5);

insert into quarto values
(1, 'Suite Principal',5,'Casal',1),
(2, 'Suite Principal',5,'Casal',2),
(3, 'Suite Principal',5,'Casal',3),
(4, 'Suite Principal',5,'Casal',4),
(5, 'Suite Principal',5,'Casal',5),
(6, 'Suite Solitário',4,'Solteiro',1),
(7, 'Suite Solitário',4,'Solteiro',2),
(8, 'Suite Solitário',4,'Solteiro',3),
(9, 'Suite Solitário',4,'Solteiro',4),
(10, 'Suite Solitário',4,'Solteiro',5),
(11, 'Ta podendo',3,'Casal',1),
(12, 'Ta podendo',3,'Casal',2),
(13, 'Ta podendo',3,'Casal',3),
(14, 'Ta podendo',3,'Casal',4),
(15, 'Ta podendo',3,'Casal',5),
(16, 'Solitário',2,'Solteiro',1),
(17, 'Solitário',2,'Solteiro',2),
(18, 'Solitário',2,'Solteiro',3),
(19, 'Solitário',2,'Solteiro',4),
(20, 'Solitário',2,'Solteiro',5),
(21, 'Meia Bomba',1,'Casal',1),
(22, 'Meia Bomba',1,'Casal',2),
(23, 'Meia Bomba',1,'Casal',3),
(24, 'Meia Bomba',1,'Casal',4),
(25, 'Meia Bomba',1,'Casal',5);

-- Exibir todos os dados das tabelas separadamente
select * from endereço;

select * from hotel;

select * from quarto;

-- Exibir os dados dos hotéis e seus respectivos quartos
select * from hotel join quarto on idHotel = fkHotel;

-- Exibir os dados dos hotéis e seus respectivos quartos do tipo solteiro
select * from hotel join quarto on idHotel = fkHotel where tQuarto = 'Solteiro';

-- Exibir os dados dos hotéis e sua respectiva matriz
select * from hotel join quarto on idHotel = fkHotel where tHotel = 'Matriz';

-- Exibir apenas o nome e o andar de um determinado quarto que contém uma determinado caracter
select nome, andar from quarto where nome like '%o%';

-- Atualizar o tipo de algum quarto e exibi-lo para ver se funcionou
update quarto set tQuarto = 'Casal' where idQuarto = 7;

select * from quarto;

-- Excluir algum quarto da tabela e exibi-lo para ver se funcionou
delete from quarto where idQuarto = 25;

select * from quarto;

-- Exibir os dados da tabelas hotél, sua matriz e seus quartos
select * from hotel join endereço join quarto on idEndereço = fkEndereço and idHotel = fkHotel;

-- Excluir o banco de dados
drop database Continuada2;