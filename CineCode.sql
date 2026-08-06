DROP DATABASE CineCode;
CREATE DATABASE CineCode;
USE CineCode;

CREATE TABLE clientes (
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome_cliente VARCHAR(60) NOT NULL,
estado VARCHAR(45),
regiao VARCHAR(45),
sexo VARCHAR(10),
data_nascimento DATE,
data_conta DATE
);

CREATE TABLE filmes (
id_filme INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(60) NOT NULL,
genero VARCHAR(45),
duracao VARCHAR(45),
ano_lancamento INT NOT NULL,
preco_aluguel DOUBLE(10, 2)
);

CREATE TABLE atores(
id_ator INT PRIMARY KEY AUTO_INCREMENT,
nome_ator VARCHAR(60) NOT NULL,
ano_nascimento DATE,
nacionalidade VARCHAR(20) NOT NULL,
sexo VARCHAR(10)
);

CREATE TABLE alugueis(
id_aluguel INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT NOT NULL,
id_filme INT NOT NULL,
nota DOUBLE,
data_aluguel DATE,
FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY(id_filme) REFERENCES filmes(id_filme)
);

CREATE TABLE atuacoes (
id_protagonista INT PRIMARY KEY AUTO_INCREMENT,
id_filme INT,
id_ator INT,
FOREIGN KEY(id_filme) REFERENCES filmes(id_filme),
FOREIGN KEY(id_ator) REFERENCES atores(id_ator)
);

INSERT INTO clientes (nome_cliente, estado, regiao, sexo, data_nascimento, data_conta)
VALUES
('cliente 1', 'RJ', 'Centro', 'Indefinido', '2001-01-01', '2001-01-01'),
('cliente 2', 'RJ', 'Centro', 'Indefinido', '2001-01-01', '2001-01-01'),
('cliente 3', 'RJ', 'Centro', 'Indefinido', '2001-01-01', '2001-01-01');

INSERT INTO filmes (titulo, genero, duracao, ano_lancamento, preco_aluguel)
VALUES ('Filme 1', 'Genero 1', '130', 1999, 50);

INSERT INTO atores (nome_ator, ano_nascimento, nacionalidade, sexo)
VALUES 
('Ator 1', '1999-01-01', 'País 1', 'Indefinido'),
('Ator 2', '1999-01-01', 'País 2', 'Indefinido');

INSERT INTO atuacoes (id_filme, id_ator)
VALUES (1, 2);

INSERT INTO alugueis (id_cliente, id_filme, nota, data_aluguel)
VALUES
(1, 1, 0.0, '2001-01-01'),
(1, 1, 5.7, '2001-01-01');