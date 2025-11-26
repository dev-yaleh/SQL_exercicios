CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

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

-- 5 REGISTROS PARA CATEGORIAS
INSERT INTO tb_categorias (categoria, descricao) VALUES
("Bovinos", "Carnes de boi: cortes nobres, para churrasco e para o dia a dia."),
("Suínos", "Carnes de porco: cortes frescos e defumados."),
("Aves", "Carnes de frango, peru e outras aves."),
("Linguiças", "Linguiças artesanais, apimentadas, toscanas e especiais."),
("Miúdos", "Fígado, coração, rim e outros cortes internos.");

SELECT * FROM tb_categorias;

DROP TABLE tb_categorias;

DROP TABLE tb_produtos;

-- 8 REGISTROS PARA PRODUTOS
INSERT INTO tb_produtos (nome, preco, quantidade, marca, categoria_id) VALUES
("Picanha", 89.90, 20, "Cidade das Carnes", 1),
("Contra Filé", 59.90, 35, "Cidade das Carnes", 1),
("Costelinha Suína", 34.90, 25, "GranSabor", 2),
("Lombo Suíno", 29.90, 30, "GranSabor", 2),
("Coxa e Sobrecoxa de Frango", 15.90, 50, "FrangoFresco", 3),
("Peito de Frango", 19.90, 40, "FrangoFresco", 3),
("Linguiça Toscana", 22.90, 45, "SaborSul", 4),
("Fígado Bovino", 12.90, 15, "Cidade das Carnes", 5);

SELECT * FROM tb_produtos;

-- VALOR > 50
SELECT * FROM tb_produtos WHERE preco > 50;

-- VALOR ENTRE 50 ~ 150
SELECT * FROM tb_produtos WHERE preco BETWEEN 50 AND 150;

-- NOME QUE TENHA A LETRA 'C'
SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

-- INNER JOIN TABLES PRODUTOS COM CATEGORIAS
SELECT nome, preco, quantidade, marca, tb_categorias.categoria, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

-- INNER JOIN APENAS O ID DE AVES
SELECT nome, preco, quantidade, marca, tb_categorias.categoria, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id
WHERE categoria_id = 3;