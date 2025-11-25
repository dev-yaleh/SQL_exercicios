CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_estudantes(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(120) NOT NULL,
data_nascimento DATE NOT NULL,
serie VARCHAR(20) NOT NULL,
situacao VARCHAR(50) NOT NULL,
nota DECIMAL(4,2) NOT NULL,
PRIMARY KEY (id)
);

SELECT * FROM tb_estudantes;

INSERT INTO tb_estudantes (nome, data_nascimento, serie, situacao, nota) 
VALUES ("Ana Clara Silva", "2010-03-12", "7º Ano", "ativo", 7.00),
("Bruno Oliveira", "2009-07-25", "8º Ano", "ativo", 6.50),
("Carla Mendes", "2011-10-02", "6º Ano", "ativo", 5.00),
("Diego Santos", "2008-01-18", "9º Ano", "concluinte", 8.75),
("Eduarda Campos", "2010-12-04", "7º Ano", "ativo", 10.00),
("Felipe Rocha", "2011-05-30", "6º Ano", "transferido", 9.50),
("Gabriela Nunes", "2009-09-14", "8º Ano", "ativo", 2.75),
("Henrique Costa", "2008-11-20", "9º Ano", "ativo", 5.00);

SELECT * FROM tb_estudantes WHERE nota > 7.00;

SELECT * FROM tb_estudantes WHERE nota < 7.00;

UPDATE tb_estudantes SET situacao = "concluinte" WHERE id = 8;