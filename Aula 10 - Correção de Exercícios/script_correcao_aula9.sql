-- primeiro criamos a database e acessamos ela
create database continuada2;
use continuada2;
-- Criar uma tabela com recursividade, cada hotel tem um ou muitos quartos mas cada quarto e de somente um hotel. relacionamento (1,n)
-- Um hotel tem somenta uma matriz, e quando tem matriz na sua fk ele e filial, quando nao tem ele pode ou nao ser uma matriz
create table Hotel(
idHotel int primary key,
nome varchar(45),
cep char(8),
logradouro varchar(45),
numero varchar(15),
fkmatriz int,
foreign key matriz (fkmatriz) references Hotel (idHotel)
);
-- Chave primaria composta para o a tabela quarto pois ela necessita de uma referência
create table Quarto(
idQuarto int,
nome varchar(45),
andar int,
tipo varchar(45), constraint chkTipo check (tipo in ('solteiro', 'casal')),
fkHotel int, foreign key quarto (fkHotel) references Hotel(idHotel), primary key (fkHotel, idQuarto)
);

-- agora vamos inserir dados em ambas as tabelas(primary key da tabela é seu ID com a Fkhotel) 
insert into Hotel values (null, 'trans-silvania', '06260180','Avenida do amor','53',null);
insert into Quarto values (1,'ninho do amor',69,'casal',1);

-- agora vamos exibir o os dados dos hotéis e seus respectivos quartos com JOIN sendo que o parâmetro de referência é a idhotel = fKhotel
select * from Hotel join Quarto on idHotel=fkHotel;

-- se usassemos o LEFT JOIN mostrariamos todas as informações da tabela Hotel pois ela está a esquerda
select * from Hotel left join Quarto on idHotel=fkHotel;

-- exibir apenas o hotel e o nome dos respectivos quartos do tipo solteiro
-- (AS é utilizado para apelidarmos a tabela e facilitarmos nosso select, por exemplo select H(tabela hotel).nome(Coluna nome) as hotel('apelido da coluna hotel'))
-- O mesmo acontece em seguida mas agora para apelidar a tabelas ex:('from Hotel as H join Quarto as Q')
select H.nome as hotel, Q.nome as quartos from Hotel as H join Quarto as Q on H.idHotel = Q.fkHotel where Q.tipo = 'solteiro';

-- agora exibiremos os dados dos hotéis(idHotel)e sua respectiva matriz(fkMatriz)
-- Em caso de recursividade é mandatório utilizar AS, caso contrário SQL dará erro de ambiguidade
select * from Hotel as filial join Hotel as Matriz on filial.fkmatriz = Matriz.idHotel; 
-- Hierarquia maior é sempre a FK!

-- agora iremos atualizar o tipo de algum quarto com o comando 'UPDATE'
-- utilizamos o AND pois a chave primária da nossa tabela Quarto é composta, então colocamos os 2 campos que formam nossa primary key
update Quarto set andar='10' where idQuarto=1 and fkhotel=1;

-- agora iremos excluir uma LINHA inteira utilizando o DELETE com o WHERE como parâmetro do que eu quero deletar, e tamém utilizamos os 2 campos que formam nossa primary key
delete from quarto where idQuarto=1 and fkhotel=1;

-- Agora faremos um join entre 3 tabelas, como temos recursividade somos obrigado a utilizar AS pois se não também dará erro de Ambiguidade 
select * from Hotel join Hotel as Matriz on hotel.fkMatriz = Matriz.idHotel join Quarto on fkHotel = Hotel.idHotel