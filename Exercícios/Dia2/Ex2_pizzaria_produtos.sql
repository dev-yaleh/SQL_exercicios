CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

-- 2 ATRIBUTOS + ID
CREATE TABLE tb_categorias( -- 1° parte
	id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID ÚNICO
    categoria VARCHAR(255) NOT NULL, -- NOME DA CATEGORIA
    descricao VARCHAR(1000) NOT NULL -- DESCRIÇÃO DA CATEGORIA
);

-- 4 ATRIBUTOS (OU MAIS) + ID
CREATE TABLE tb_pizzas( -- 2° parte
	id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID ÚNICO
    nome VARCHAR(255) NOT NULL, -- NOME DO PRODUTO
    preco DECIMAL (10,2) NOT NULL, -- VALOR DO PRODUTO
    quantidade INT NOT NULL, -- ESTOQUE TOTAL
    tamanho VARCHAR(255), -- TAMANHO
    categoria_id BIGINT, -- CHAVE FK
    
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- 5 REGISTROS PARA CATEGORIAS
INSERT INTO tb_categorias (categoria, descricao) VALUES
("Tradicionais", "Pizzas clássicas e populares no cardápio brasileiro."),
("Especiais", "Combinações diferenciadas e ingredientes selecionados."),
("Doces", "Pizzas feitas com ingredientes doces e coberturas especiais."),
("Vegetarianas", "Pizzas sem carne, com foco em vegetais e queijos."),
("Premium", "Pizzas gourmet com ingredientes de alta qualidade.");

SELECT * FROM tb_categorias;

DROP TABLE tb_categorias;

DROP TABLE tb_pizzas;

-- 8 REGISTROS PARA PIZZAS
INSERT INTO tb_pizzas (nome, preco, quantidade, tamanho, categoria_id) VALUES
("Mussarela", 39.90, 15, "Grande", 1),
("Calabresa", 42.50, 20, "Grande", 1),
("Portuguesa", 49.90, 12, "Grande", 1),
("Frango com Catupiry", 54.90, 10, "Grande", 2),
("Quatro Queijos", 59.90, 8, "Grande", 2),
("Chocolate com Morango", 48.90, 5, "Grande", 3),
("Vegetariana Supreme", 52.90, 7, "Grande", 4),
("Trufada Premium", 79.90, 4, "Grande", 5);


SELECT * FROM tb_pizzas;

-- VALOR > 45
SELECT * FROM tb_pizzas WHERE preco > 45;

-- VALOR ENTRE 50 ~ 100
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

-- NOME QUE TENHA A LETRA 'M'
SELECT * FROM tb_pizzas WHERE nome LIKE "%m%";

-- INNER JOIN TABLES PIZZAS COM CATEGORIAS
SELECT nome, preco, quantidade, tamanho, tb_categorias.categoria, tb_categorias.descricao
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoria_id = tb_categorias.id;

-- INNER JOIN APENAS O ID DE PIZZA DOCE
SELECT nome, preco, quantidade, tamanho, tb_categorias.categoria, tb_categorias.descricao
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE categoria_id = 3;