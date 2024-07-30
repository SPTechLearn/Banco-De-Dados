-- Criar banco de dados "Venda"
create database Venda;

-- Usar banco de dados "Venda"
use Venda;

-- Criar as tabelas "endereco", "cliente", "cliIndicado", "produto" e "compra"
create table endereco(
idEndereco int primary key,
cep char(8),
estado varchar(45),
cidade varchar(45),
rua varchar(45),
numero int,
complemento varchar(45)
);

create table cliente(
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
fkEndereco int,
foreign key (fkEndereco) references endereco (idEndereco)
);

create table cliIndicado(
idcliInd int,
nome varchar(45),
email varchar(45),
fkIndica int,
foreign key (fkIndica) references cliente (idCliente),
primary key (idcliInd,fkIndica)
);

create table produto(
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
preco decimal(10,2)
);

create table compra(
idCompra int,
fkCliente int,
foreign key (fkCliente) references cliente(idCliente),
fkProduto int,
foreign key (fkProduto) references produto(idProduto),
primary key (idCompra,fkCliente,fkProduto),
total decimal(10,2),
dataCom date,
qtProduto int,
desconto decimal(10,2)
);

-- Inserir dados nas tabelas
insert into endereco values
(1, '06268170', 'São Paulo', 'Osasco', 'Reginaldo Nilson da Silva', 51, 'Casa 1'),
(2, '01020304', 'São Paulo', 'São Paulo', 'Hadock Lobo', 505, 'Bloco 5'),
(3, '04030201', 'Minas Gerais', 'Ouro Preto', 'Avenida dos Remedios', 2253, null),
(4, '12345678', 'Bahia', 'Salvador', 'Padre Mauro Cezar', 98, 'Bloco 8'),
(5, '98765432', 'São Paulo', 'Mogi das Cruzes', 'Sergio Cortella', 101, 'Casa 4');

insert into cliente values
(null, 'Paulo Alvares', 'pauloalvares66@gmail.com', 1),
(null, 'Emilly Liberato', 'emyliberato@gmail.com', 2),
(null, 'Fernanda Silva', 'fesilva09@outlook.com', 3),
(null, 'Simair Costa', 'silzinhocosta054@hotmail.com', 4),
(null, 'Pedro Monteiro', 'xaolinmatador@ig.com.br', 5);

insert into cliIndicado values
(1, 'Emilly de Lima', 'emyzinha49@gmail.com', 1),
(2, 'Cleubi Liberato', 'cleubi09@gmail.com', 2),
(3, 'Gilvan Pereira', 'gilpe789@hotmail.com', 3),
(4, 'Bernadete Costa', 'betizinha007@gmail.com', 4),
(5, 'Gabriel Monteiro', 'gabigol555@gmail.com', 5),
(6, 'Paulo Marcio', 'marcinhopulo@gmail.com', 1),
(7, 'Flavio Castro', 'flavindopneu@gmail.com', 2),
(8, 'Kaue Moura', 'kondizilaaofic@gmail.com', 3),
(9, 'Viviana Silva', 'vivisilva@gmail.com', 4),
(10, 'Amanda Peres', 'amandinha7654@gmail.com', 5);

insert into produto values
(null, 'Papel', 'Papel sulfite A4', 5.99),
(null, 'Celular', 'Xiaomi Poco F4 Pro', 1000.00),
(null, 'Notebook', 'Intel corei5 10th geração', 2500.00),
(null, 'Mochila', 'Airbag com marmiteira', 119.99),
(null, 'Caneta', 'Bic Azul', 1.99),
(null, 'Caderno', 'Capa PSG com figurinha', 20.50),
(null, 'Bala', '7 Belo', 1.50),
(null, 'Blusa', 'Zara Cara', 500.00);

insert into compra values
(1, 1, 3, 5000.00, '2022-10-26', 2, 0.00),
(2, 1, 2, 1000.00, '2022-10-28', 1, 100.00),
(3, 2, 1, 59.90, '2022-08-21', 10, 10.00),
(4, 2, 5, 4.98, '2022-08-21', 2, 2.00),
(5, 3, 6, 61.50, '2022-01-09', 3, 5.00),
(6, 3, 7, 199.00, '2022-01-10', 100, 50.00),
(7, 4, 8, 500.00, '2022-04-07', 1, 0.00),
(8, 4, 4, 119.99, '2022-04-07', 1, 0.00),
(9, 5, 1, 11.98, '2022-09-15', 2, 2.00),
(10, 5, 8, 500.00, '2022-09-15', 1, 100.00);

-- Exibir todos os dados das tabelas
select * from endereco;
select * from cliente;
select * from cliIndicado;
select * from produto;
select * from compra;

-- Exibir os dados dos clientes e os dados das suas respectivas vendas
select * from cliente 
	join compra on idCliente = fkCliente;

-- Exibir os dados de um determinado cliente e de suas vendas
select * from cliente 
	join compra on idCliente = fkCliente 
		where nome = 'Paulo Alvares';

-- Exibir os dados dos clientes e dos clientes indicados
select * from cliente 
	join cliIndicado on idCliente = fkIndica;

-- Exibir os dados dos clientes indicados por um determinado cliente
select * from cliIndicado as i 
	join cliente as c on idCliente = fkIndica 
		where c.nome = 'Paulo Alvares';
        
-- Exibir os dados dos clientes, os dados dos clientes indicados, os dados dos produtos e os dados da venda
select * from endereco join cliente on idEndereco = fkEndereco 
	join cliIndicado on idCliente = fkIndica 
		join compra on idCliente = fkCliente
			join produto on idProduto = fkProduto;
            
-- Exibir a data, nome e quantidade do produto de uma venda
select c.dataCom, p.nome, qtProduto from compra as c 
	join produto as p on idProduto = fkProduto;
    
-- Exibir o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos, agrupados pelo nome do produto 
select p.nome, p.preco, sum(c.qtProduto) 'Soma dos valores' from compra as c 
	join produto as p on idProduto = fkProduto order by p.nome;

-- Inserir dados de um novo cliente, exibir os dados dos clientes, exibir os dados das vendas.
insert into cliente values
(null, 'Gabriel Rocha', 'aquiles0672@gmail.com', null);

select * from cliente;

select * from cliente left join compra on idCliente = fkCliente;

-- Exibir o valor mínimo e o valor máximo dos produtos 
select min(preco) 'Valor Mínimo', max(preco) 'Valor Máximo' from produto;

-- Exibir a soma e a média dos preços dos produtos
select sum(preco) 'Soma dos Valores', truncate(avg(preco),2) 'Média dos Valores' from produto;

-- Exibir a quantidade de preços acima da média entre os produtos
select count(preco) from produto
	where preco >= (select avg(preco) from produto); 
    
-- Exibir a soma dos preços diferentes entre os produtos
select sum(distinct preco) from produto;

-- Exibir a soma dos preços dos produtos agrupado por uma determinada venda 
select sum(p.preco) from produto as p join compra as c on idProduto = fkProduto where idCompra = 1;