CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(120) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
estoque INT NOT NULL,
categoria VARCHAR(80)NOT NULL,
PRIMARY KEY (id)
);

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos (nome, preco, estoque, categoria) 
VALUES ("Samsung A15", 1299.90, 45, "Eletrônicos"),
("Notebook", 2599.00, 20, "Informática"),
("JBL Tune", 299.90, 80, "Áudio"),
("Camiseta", 89.90, 150, "Vestuário"),
("Cafeteira", 159.90, 35, "Eletrodomésticos");

SELECT * FROM tb_produtos WHERE preco > 500.00;

SELECT * FROM tb_produtos WHERE preco < 500.00;

UPDATE tb_produtos SET estoque = 94 WHERE id = 4;