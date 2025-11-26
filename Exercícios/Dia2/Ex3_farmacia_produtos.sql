CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

-- 2 ATRIBUTOS + ID
CREATE TABLE tb_categorias( -- 1° parte
	id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID ÚNICO
    categoria VARCHAR(255) NOT NULL, -- NOME DA CATEGORIA
    descricao VARCHAR(1000) NOT NULL -- DESCRIÇÃO DA CATEGORIA
);

-- 4 ATRIBUTOS (OU MAIS) + ID
CREATE TABLE tb_produtos( -- 2° parte
	id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID ÚNICO
    nome VARCHAR(255) NOT NULL, -- NOME DO PRODUTO
    preco DECIMAL (10,2) NOT NULL, -- VALOR DO PRODUTO
    quantidade INT NOT NULL, -- ESTOQUE TOTAL
    marca VARCHAR(255), -- NOME DA MARCA
    categoria_id BIGINT, -- CHAVE FK
    
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- 5 REGISTROS
INSERT INTO tb_categorias (categoria, descricao) VALUES
("Medicamentos", "Medicamentos tarja branca, vermelha e preta"),
("Higiene Pessoal", "Itens de higiene diária e cuidados pessoais"),
("Cosméticos", "Perfumes, desodorantes e cosméticos"),
("Vitaminas e Suplementos", "Suplementos, multivitamínicos e reforço imunológico"),
("Cuidados Infantis", "Produtos para bebês e crianças");

SELECT * FROM tb_categorias;

DROP TABLE tb_categorias;

DROP TABLE tb_produtos;

-- 8 REGISTROS PARA PRODUTOS
INSERT INTO tb_produtos (nome, preco, quantidade, marca, categoria_id) VALUES
("Paracetamol 750mg", 12.50, 100, "Medley", 1),
("Shampoo Anticaspa 200ml", 22.90, 40, "Clear", 2),
("Desodorante Aerosol 150ml", 18.90, 60, "Rexona", 3),
("Vitamina C 1000mg", 29.90, 50, "Sundown", 4),
("Fraldas Descartáveis P", 38.90, 80, "Pampers", 5),
("Dipirona Sódica 500mg", 9.80, 120, "Neo Química", 1),
("Sabonete Líquido Neutro 250ml", 14.50, 70, "Granado", 2),
("Creme Hidratante Corporal 200ml", 27.90, 45, "Nivea", 3);


SELECT * FROM tb_produtos;

-- VALOR > 50
SELECT * FROM tb_produtos WHERE preco > 50;

INSERT INTO tb_produtos (nome, preco, quantidade, marca, categoria_id) VALUES
("Creme Hidratante Corporal 479ml", 79.90, 15, "Cetaphil", 3);

-- VALOR ENTRE 70 ~ 150
SELECT * FROM tb_produtos WHERE preco BETWEEN 70 AND 1500;

-- NOME QUE TENHA A LETRA 'C'
SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

-- INNER JOIN TABLES PRODUTOS COM CATEGORIAS
SELECT nome, preco, quantidade, marca, tb_categorias.categoria, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

-- INNER JOIN APENAS O ID DE COSMÉTICO
SELECT nome, preco, quantidade, marca, tb_categorias.categoria, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id
WHERE categoria_id = 3;
