CREATE DATABASE gestao_escolar;
USE gestao_escolar;

CREATE TABLE aluno(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
data_nascimento DATE NOT NULL,
telefone CHAR(13) NOT NULL
);

INSERT INTO aluno (nome, data_nascimento, telefone)
VALUES
('Mario', '1981-01-01', '1234567890123'),
('Luigi', '1983-01-01', '1234567890123'),
('Peach', '1985-01-01', '1234567890123'),
('Toad', '1985-01-01', '1234567890123'),
('Yoshi', '1990-01-01', '1234567890123');

CREATE TABLE turma (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
turno ENUM('Manhã', 'Tarde', 'Noite'),
ano_letivo VARCHAR(45)
);

INSERT INTO turma (nome, turno, ano_letivo)
VALUES
('1-A', 'Manhã', '2026'),
('1-B', 'Noite', '2026');