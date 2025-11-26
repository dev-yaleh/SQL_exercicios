CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

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
("Elétrica", "Produtos e acessórios para instalações elétricas"),
("Hidráulica", "Materiais para água, esgoto e conexões"),
("Ferramentas", "Ferramentas manuais e elétricas"),
("Pintura", "Tintas, rolos, pincéis e acessórios"),
("Acabamento", "Revestimentos, pisos, metais e decoração");

SELECT * FROM tb_categorias;

DROP TABLE tb_categorias;

DROP TABLE tb_produtos;

-- 8 REGISTROS PARA PRODUTOS
INSERT INTO tb_produtos (nome, preco, quantidade, marca, categoria_id) VALUES
("Barra de Led", 120.00, 50, "Tigre", 1),
("Torneira", 85.50, 20, "Deca", 2),
("Martelo", 35.00, 15, "Vonder", 3),
("Tinta 18L", 220.00, 10, "Suvinil", 4),
("Piso 60x60", 79.90, 200, "Portobello", 5),
("Chave Philips", 18.90, 40, "Tramontina", 3),
("Registro de 1/2", 32.50, 35, "Tigre", 2),
("Rolo de Pintura 23cm", 24.00, 60, "Atlas", 4);

SELECT * FROM tb_produtos;

-- VALOR > 100
SELECT * FROM tb_produtos WHERE preco > 100;

-- VALOR ENTRE 70 ~ 150
SELECT * FROM tb_produtos WHERE preco BETWEEN 70 AND 150;

-- NOME QUE TENHA A LETRA 'C'
SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

-- INNER JOIN TABLES PRODUTOS COM CATEGORIAS
SELECT nome, preco, quantidade, marca, tb_categorias.categoria, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

-- INNER JOIN APENAS O ID DE HIDRÁULICA
SELECT nome, preco, quantidade, marca, tb_categorias.categoria, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id
WHERE categoria_id = 2;
