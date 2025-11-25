CREATE DATABASE db_rh_empresa;

USE db_rh_empresa;

CREATE TABLE tb_colaboradores(
id BIGINT AUTO_INCREMENT, -- Identificador único
nome VARCHAR(255) NOT NULL, -- Nome completo
cargo VARCHAR(255) NOT NULL, -- Cargo ou função
data_admissao DATE, -- Quando o colaborador entrou
salario DECIMAL(9,2) NOT NULL, -- Remuneração atual
situacao VARCHAR(50) NOT NULL, -- Status: ativo, afastado ou desligado
PRIMARY KEY (id)
);

SELECT * FROM tb_colaboradores;

INSERT INTO tb_colaboradores (nome, cargo, data_admissao, salario, situacao) 
VALUES ("Thomas", "Vendedor", "2025-06-15", 1822.22, "Ativo"),
("Marcia", "Sub-gerente", "2024-04-15", 1956.25, "Ativo"),
("Lorenna", "Sub-gerente", "2023-12-15", 2050.00, "Desligado"),
("Bruno", "Gerente", "2023-01-15", 3500.05, "Ativo"),
("Ursula", "Gerente", "2023-12-15", 3680.00, "Afastado");

SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

UPDATE tb_colaboradores SET situacao = "Afastado" WHERE Id = 2;