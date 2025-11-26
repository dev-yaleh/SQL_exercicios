CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

-- 2 ATRIBUTOS + ID
CREATE TABLE tb_categorias( -- 1° parte
	id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID ÚNICO
    categoria VARCHAR(255) NOT NULL, -- NOME DA CATEGORIA
    descricao VARCHAR(1000) NOT NULL -- DESCRIÇÃO DA CATEGORIA
);

-- 4 ATRIBUTOS (OU MAIS) + ID
CREATE TABLE tb_cursos( -- 2° parte
	id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID ÚNICO
    nome VARCHAR(255) NOT NULL, -- NOME DO PRODUTO
    preco DECIMAL(10,2) NOT NULL, -- VALOR DO CURSO
    carga_horaria INT NOT NULL, -- CARGA HORÁRIA DO CURSO
    instrutor VARCHAR(255) NOT NULL, -- NOME DO INSTRUTOR
    categoria_id BIGINT, -- CHAVE FK
    
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- 5 REGISTROS PARA CATEGORIAS
INSERT INTO tb_categorias (categoria, descricao) VALUES
("Programação", "Cursos de desenvolvimento web, lógica, backend e frontend."),
("Design", "Cursos de UI/UX, design gráfico e ferramentas criativas."),
("Negócios", "Cursos de empreendedorismo, gestão e marketing."),
("Idiomas", "Cursos de inglês, espanhol, francês e outras línguas."),
("Tecnologia da Informação", "Cursos técnicos de redes, segurança e infraestrutura.");

SELECT * FROM tb_categorias;

DROP TABLE tb_categorias;

DROP TABLE tb_cursos;

-- 8 REGISTROS PARA CURSOS
INSERT INTO tb_cursos (nome, preco, carga_horaria, instrutor, categoria_id) VALUES
("JavaScript Full Stack", 999.90, 120, "Carlos Almeida", 1),
("Python para Iniciantes", 350.90, 80, "Mariana Duarte", 1),
("UX Design Essencial", 750.90, 60, "Julia Monteiro", 2),
("Photoshop do Zero ao Avançado", 800.90, 75, "Felipe Castro", 2),
("Marketing Digital para Negócios", 690.90, 90, "Rafael Silva", 3),
("Inglês Intermediário", 550.00, 110, "Sarah Thompson", 4),
("Espanhol Básico", 450.00, 70, "Luis Martinez", 4),
("Fundamentos de Redes de Computadores", 600.90, 95, "Daniel Farias", 5);

SELECT * FROM tb_cursos;

-- VALOR > 500
SELECT * FROM tb_cursos WHERE preco > 500;

-- VALOR ENTRE 600 ~ 1000
SELECT * FROM tb_cursos WHERE preco BETWEEN 600 AND 1000;

-- NOME QUE TENHA A LETRA 'J'
SELECT * FROM tb_cursos WHERE nome LIKE "%j%";

-- INNER JOIN TABLES CURSOS COM CATEGORIAS
SELECT nome, preco, carga_horaria, instrutor, tb_categorias.categoria, tb_categorias.descricao
FROM tb_cursos INNER JOIN tb_categorias 
ON tb_cursos.categoria_id = tb_categorias.id;

-- INNER JOIN APENAS O ID DE PROGRAMAÇÃO
SELECT nome, preco, carga_horaria, instrutor, tb_categorias.categoria, tb_categorias.descricao
FROM tb_cursos INNER JOIN tb_categorias 
ON tb_cursos.categoria_id = tb_categorias.id
WHERE categoria_id = 1;