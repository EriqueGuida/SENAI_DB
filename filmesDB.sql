CREATE DATABASE filmes;
USE filmes;

DROP TABLE midias;
CREATE TABLE midias(
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(100) NOT NULL,
genero VARCHAR (50) NOT NULL,
ano_lancamento INT NOT NULL,
tipo VARCHAR(10)
);


-- Comando para inserir 10 filmes de uma vez
INSERT INTO midias (titulo, genero, ano_lancamento, tipo)
VALUES
('O Poderoso Chefão', 'Crime, Drama', 1972, 'Filme'),
('Pulp Fiction: Tempo de Violência', 'Crime, Drama', 1994, 'Filme'),
('O Cavaleiro das Trevas', 'Ação, Crime', 2008, 'Filme'),
('Interestelar', 'Ficção Científica, Drama', 2014, 'Filme'),
('Matrix', 'Ficção Científica, Ação', 1999, 'Filme'),
('Cidade de Deus', 'Crime, Drama', 2002, 'Filme'),
('O Senhor dos Anéis: O Retorno do Rei', 'Fantasia, Aventura', 2003, 'Filme'),
('A Origem', 'Ficção Científica, Ação', 2010, 'Filme'),
('O Resgate do Soldado Ryan', 'Guerra, Drama', 1998, 'Filme'),
('Parasita', 'Suspense, Comédia', 2019, 'Filme'),
('Forrest Gump', 'Drama, Romance', 1994, 'Filme'),
('O Lobo de Wall Street', 'Biografia, Comédia, Crime', 2013, 'Filme'),
('Gladiador', 'Ação, Aventura, Drama', 2000, 'Filme'),
('O Silêncio dos Inocentes', 'Crime, Drama, Suspense', 1991, 'Filme'),
('A Lista de Schindler', 'Biografia, Drama, História', 1993, 'Filme'),
('Clube da Luta', 'Drama, Suspense', 1999, 'Filme'),
('O Rei Leão', 'Animação, Aventura, Drama', 1994, 'Filme'),
('Se7en: Os Sete Crimes Capitais', 'Crime, Drama, Mistério', 1995, 'Filme'),
('A Viagem de Chihiro', 'Animação, Aventura, Família', 2001, 'Filme'),
('De Volta para o Futuro', 'Aventura, Comédia, Ficção Científica', 1985, 'Filme'),
('Toy Story', 'Animação, Aventura, Comédia', 1995, 'Filme'),
('O Iluminado', 'Terror, Drama', 1980, 'Filme'),
('Blade Runner: O Caçador de Androides', 'Ficção Científica, Ação, Suspense', 1982, 'Filme'),
('Jurassic Park: Parque dos Dinossauros', 'Aventura, Ficção Científica', 1993, 'Filme'),
('Coringa', 'Crime, Drama, Suspense', 2019, 'Filme'),
('Vingadores: Ultimato', 'Ação, Aventura, Ficção Científica', 2019, 'Filme'),
('Titanic', 'Drama, Romance', 1997, 'Filme'),
('Alien: O Oitavo Passageiro', 'Terror, Ficção Científica', 1979, 'Filme'),
('O Exterminador do Futuro 2: O Julgamento Final', 'Ação, Ficção Científica', 1991, 'Filme'),
('Mad Max: Estrada da Fúria', 'Ação, Aventura, Ficção Científica', 2015, 'Filme');

-- Comando para inserir 10 séries
INSERT INTO midias (titulo, genero, ano_lancamento, tipo)
VALUES
('Breaking Bad', 'Crime, Drama, Suspense', 2008, 'Série'),
('Game of Thrones', 'Fantasia, Drama, Ação', 2011, 'Série'),
('Stranger Things', 'Ficção Científica, Terror, Drama', 2016, 'Série'),
('Friends', 'Comédia, Romance', 1994, 'Série'),
('The Office (US)', 'Comédia, Documentário Mock', 2005, 'Série'),
('Chernobyl', 'Drama, História, Minissérie', 2019, 'Série'),
('The Crown', 'Drama, História, Biografia', 2016, 'Série'),
('Black Mirror', 'Ficção Científica, Suspense, Drama', 2011, 'Série'),
('Narcos', 'Crime, Drama, Biografia', 2015, 'Série'),
('Peaky Blinders', 'Crime, Drama', 2013, 'Série'),
('The Mandalorian', 'Ação, Aventura, Ficção Científica', 2019, 'Série'),
('The Witcher', 'Ação, Aventura, Fantasia', 2019, 'Série'),
('La Casa de Papel', 'Ação, Crime, Suspense', 2017, 'Série'),
('The Sopranos', 'Crime, Drama', 1999, 'Série'),
('Better Call Saul', 'Crime, Drama', 2015, 'Série'),
('The Boys', 'Ação, Comédia, Crime', 2019, 'Série'),
('Ozark', 'Crime, Drama, Suspense', 2017, 'Série'),
('Sherlock', 'Crime, Drama, Mistério', 2010, 'Série'),
('Westworld', 'Drama, Mistério, Ficção Científica', 2016, 'Série'),
('Mindhunter', 'Crime, Drama, Suspense', 2017, 'Série'),
('O Gambito da Rainha', 'Drama, Esporte', 2020, 'Série'),
('Dark', 'Drama, Mistério, Ficção Científica', 2017, 'Série'),
('Ted Lasso', 'Comédia, Drama, Esporte', 2020, 'Série'),
('Vikings', 'Ação, Aventura, Drama', 2013, 'Série'),
('Succession', 'Drama', 2018, 'Série'),
('Arcane', 'Animação, Ação, Aventura', 2021, 'Série'),
('Severance', 'Drama, Mistério, Ficção Científica', 2022, 'Série'),
('The Last of Us', 'Ação, Aventura, Drama', 2023, 'Série'),
('Squid Game (Round 6)', 'Ação, Drama, Mistério', 2021, 'Série'),
('House of the Dragon', 'Ação, Aventura, Drama', 2022, 'Série');

SELECT titulo, ano_lancamento FROM midias ORDER BY ano_lancamento DESC;

SELECT * FROM midias WHERE ano_lancamento = 1994;

SELECT * FROM midias WHERE tipo = 'Filme' AND genero LIKE 'Ficção Científica%';

SELECT * FROM midias WHERE tipo = 'Série' AND genero LIKE '%Crime, Drama%';

SELECT * FROM midias WHERE titulo LIKE 'O Senhor dos%';

SELECT * FROM midias WHERE tipo = 'Filme' AND ano_lancamento < 1990 ORDER BY ano_lancamento;

SET sql_safe_updates = 0;

UPDATE midias SET genero = 'Comédia, Sitcom' WHERE titulo = 'Friends';

UPDATE midias SET genero = 'Animação, Musical' WHERE titulo = 'Rei Leão';

DELETE FROM midias WHERE titulo = 'Titanic';

DELETE FROM midias WHERE ano_lancamento < 1985;

SELECT * FROM midias ORDER BY ano_lancamento;