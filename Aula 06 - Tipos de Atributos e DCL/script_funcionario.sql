-- CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE funcionario (
idFunc int primary key auto_increment,
nome varchar(45), -- + sobrenome = atributo composto
sobrenome varchar(45),
telefoneFixo char(11), -- + telefoneCelular = atributo multivalorado
telefoneCelular char(12),
ddd char(2), -- + preixo + sufixo = atributo composto
prefixo char(5),
sufixo char(4)
);

INSERT INTO funcionario (nome, telefoneFixo) VALUES
	('Vivian', '11-54321111');
    
SELECT * FROM funcionario;

INSERT INTO funcionario (sobrenome, ddd, prefixo, sufixo) VALUES
	('Souza', '11', '98765', '3344');
    
UPDATE funcionario SET nome = 'Paulo', sobrenome = 'Silva',
	prefixo = '98080' WHERE idFunc = 3;

SELECT concat('Meu nome completo é ', ifnull(nome, ''),
 ' ', ifnull(sobrenome, '')) as Completo
	FROM funcionario;
    
SELECT concat('Meu nome completo é ', ifnull(nome, 'Não tenho nome'),
 ' ', ifnull(sobrenome, 'Não tenho sobrenome')) as Completo
	FROM funcionario;