CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

-- 2 ATRIBUTOS + ID
CREATE TABLE tb_classes( -- 1° parte
	id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID ÚNICO
    classe VARCHAR(255) NOT NULL, -- NOME DA CLASSE
    descricao VARCHAR(1000) NOT NULL -- DESCRIÇÃO DA CLASSE
);

-- 4 ATRIBUTOS (OU MAIS) + ID
CREATE TABLE tb_personagens( -- 2° parte
	id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID ÚNICO
    nome VARCHAR(255) NOT NULL, -- NOME DO PERSONAGEM
    nivel INT NOT NULL, -- NÍVEL DO PERSONAGEM
    vida_maxima INT NOT NULL, -- HP TOTAL
    ataque INT NOT NULL, -- ATK TOTAL
    defesa INT NOT NULL, -- DEF TOTAL
    habilidade_especial VARCHAR(255), -- NOME DA ULIMATE/ HABILIDADE ESPECIAL
    classe_id BIGINT, -- CHAVE FK
    
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- 5 REGISTROS
INSERT INTO tb_classes (classe, descricao) VALUES 
("Patrulheiro", "Mestre do arco, rastreio e sobrevivência. Especialista em ataques à distância e precisão."),
("Ladino", "Ágil, furtivo e especializado em ataques críticos e emboscadas."),
("Clérigo", "Guardião espiritual que combina combate com magias de cura e proteção."),
("Bárbaro", "Guerreiro selvagem com força enorme e resistência acima do normal."),
("Mago", "Especialista em artes arcanas, domina feitiços de alto dano e controle, porém possui pouca resistência física.");

SELECT * FROM tb_classes;

-- 8 REGISTROS PARA PERSONAGENS
INSERT INTO tb_personagens (nome, nivel, vida_maxima, ataque, defesa, habilidade_especial, classe_id) VALUES
("Ivy Noaks", "4", "21", "1900", "1200", "Tiro ao Alvo", "1"),
("Fern Noaks", "3", "19", "1800", "900", "Parkour", "2"),
("Roc Tigerlar", "5", "23", "2000", "2000", "Transmutação Animal", "4"),
("Ryu Eterno", "4", "25", "2100", "2100", "Benção Divina", "3"),
("Yui ", "4", "17", "3000", "800", "Tempestade Arcana", "5"),
("Rowan Earthguard", "8", "30", "2900", "1200", "Toque da Natureza", "3"),
("Mira Swiftstep", "9", "26", "2600", "1100", "Lâmina Veloz", "2"),
("Arwen Oakleaf", "7", "28",  "2600", "2100","Flecha Fantasma", "1");

SELECT * FROM tb_personagens;

-- ATAQUE > 2000
SELECT * FROM tb_personagens WHERE ataque > 2000;

-- DEFESA 1000 ~ 2000
SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

-- NOME QUE TENHA A LETRA 'C'
SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

-- INNER JOIN TABLES PERSONAGENS COM CLASSES
SELECT nome, nivel, vida_maxima, habilidade_especial, tb_classes.classe, tb_classes.descricao
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.classe_id = tb_classes.id;

-- INNER JOIN APENAS O ID DE ARQUEIRO
SELECT nome, nivel, vida_maxima, habilidade_especial, tb_classes.classe, tb_classes.descricao
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.classe_id = tb_classes.id
WHERE classe_id = 1;
