CREATE DATABASE db_quitanda; -- Comentário

USE db_quitanda;

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT, -- Usado geralmente para IDs ou SKUs (o banco de dados auto add +1 no n° seguinte) 
	nome VARCHAR(255) NOT NULL, -- Caracter Variável, estipulando um tamanho máx (255), não pode ficar sem preencher
	quantidade INT, -- Números com o tamanho menor que BIGINT
    datavalidade DATE, -- Data AAAA/MM/DD (Será formatado no Backend)
	preco DECIMAL NOT NULL, -- Números com duas casas após a vírgula, não pode ficar sem preencher
    PRIMARY KEY (id)  -- Estipular Primary KEY (PK) como "id" (Toda Tabela tem que ter uma coluna prioritária)
);

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("tomate",100, "2023-12-15", 8.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("maçã",20, "2023-12-15", 5.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("laranja",50, "2023-12-15", 10.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("banana",200, "2023-12-15", 12.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("uva",1200, "2023-12-15", 30.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("pêra",500, "2023-12-15", 2.99);

SELECT * FROM tb_produtos; -- SELECIONAR TODOS OS DADOS DA TABELA tb_produtos

SELECT nome, preco FROM tb_produtos; -- SELECIONAR COLUNAS ESPECÍFICAS

SELECT * FROM tb_produtos WHERE id = 1; -- SELECIONAR TODOS OS DADOS DO PRODUTO QUE O ID SEJA 1

SELECT * FROM tb_produtos WHERE preco > 5; -- SELECIONAR TODOS OS DADOS DOS PRODUTOS QUE TENAM O PREÇO MAIOR QUE 5

-- ALTERAR A ESTRUTURA DA TABELA JÁ CRIADA (MODIFICAR)
ALTER TABLE tb_produtos MODIFY preco DECIMAL(6,2); -- 6 DÍGITOS ANTES E 2 DÍGITOS DEPOIS DA VÍRGULA (EX: 9999.99)

-- ATUALIZAÇÃO DOS DADOS DA TABELA (POIS QUANDO FOI CADASTRADO O PRECO FOI ALTERADO PARA N° REDONDO)
UPDATE tb_produtos SET preco = 2.99 WHERE Id = 6; -- SEMPRE UTILIZAR A CLAUSULA "WHERE" E O CAMPO UNICO

-- EXCLUIR/DELETAR OS DADOS DA TABELA
DELETE FROM tb_produtos WHERE Id = 2;

SELECT * FROM tb_produtos WHERE Id = 2;

