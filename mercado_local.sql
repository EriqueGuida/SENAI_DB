CREATE DATABASE mercado_local;
USE mercado_local;

CREATE TABLE produto (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
estoque INT
); 

INSERT INTO produto (nome, preco, estoque) 
VALUES
('Abacaxi', 10.2, 1),
('Abacaxi', 10.2, 1),
('Abacaxi', 10.2, 1),
('MAça', 10.2, 1),
('Morango', 10.2, 1);

SELECT * FROM produto;

CREATE TABLE pedido (
id INT PRIMARY KEY AUTO_INCREMENT,
data DATETIME DEFAULT CURRENT_TIMESTAMP,
valor_total DECIMAL (10,2),
forma_pagamento ENUM ('Dinheiro', 'Crédito', 'Débito', 'PIX', 'Cheque') NOT NULL
);

INSERT INTO pedido (valor_total, forma_pagamento) 
VALUES
(33.4, 'Crédito'),
(10.00, 'PIX');

SELECT * FROM pedido;