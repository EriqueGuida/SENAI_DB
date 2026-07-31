DROP DATABASE GigaByteDB;
CREATE DATABASE GigaByteDB;
USE GigaByteDB;

CREATE TABLE produtos(
sku VARCHAR(20) PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
categoria VARCHAR(50),
preco DECIMAL(10,2) NOT NULL,
qtd_estoque INT NOT NULL DEFAULT 0
);

SELECT * FROM produtos WHERE categoria = 'Hardware' AND qtd_estoque > 0 ORDER BY preco LIMIT 3;

SELECT nome, sku FROM produtos WHERE qtd_estoque = 0;

SELECT nome, preco FROM produtos ORDER BY preco desc LIMIT 2;

SELECT * FROM produtos WHERE nome LIKE '%Placa%';

SELECT * FROM produtos WHERE categoria = 'Periféricos' ORDER BY preco desc LIMIT 3;