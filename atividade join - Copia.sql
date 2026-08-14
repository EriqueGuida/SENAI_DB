DROP DATABASE bd_livraria_join;
CREATE DATABASE bd_livraria_join;
USE bd_livraria_join;

-- ==============================
-- TABELA 1 (lado 1 do 1:N)
-- ==============================
CREATE TABLE editoras (
    id_editora INT PRIMARY KEY,
    nome_editora VARCHAR(100),
    cidade VARCHAR(100)
);

-- ==============================
-- TABELA 2 (lado N do 1:N)
-- ==============================
CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(150),
    ano_publicacao INT,
    id_editora INT,
    FOREIGN KEY (id_editora) REFERENCES editoras(id_editora)
);

INSERT INTO editoras VALUES
(1, 'Editora Alfa', 'São Paulo'),
(2, 'Editora Beta', 'Rio de Janeiro'),
(3, 'Editora Gama', 'Belo Horizonte');

INSERT INTO livros VALUES
(101, 'Introdução ao SQL', 2020, 1),
(102, 'Modelagem de Dados na Prática', 2021, 1),
(103, 'Algoritmos Descomplicados', 2019, 2),
(104, 'Redes de Computadores para Iniciantes', 2022, 2);

-- livro ainda não vinculado a nenhuma editora
INSERT INTO livros (id_livro, titulo, ano_publicacao, id_editora) VALUES
(105, 'Livro Independente', 2023, NULL);

SELECT l.id_livro, l.titulo, e.nome_editora FROM livros AS l
INNER JOIN editoras AS e ON l.id_editora = e.id_editora;

SELECT l.id_livro, l.titulo, e.nome_editora FROM livros AS l
LEFT JOIN editoras AS e ON l.id_editora = e.id_editora;

SELECT l.id_livro, l.titulo, e.nome_editora FROM livros AS l
RIGHT JOIN editoras AS e ON l.id_editora = e.id_editora;


