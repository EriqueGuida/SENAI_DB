SELECT count(*) FROM filmes WHERE genero = 'Drama';

SELECT sum(preco_aluguel) FROM filmes WHERE genero = 'Comédia';

SELECT round(avg(duracao), 2) FROM filmes WHERE genero LIKE 'Ficção e Fantasia';

SELECT max(preco_aluguel) FROM filmes WHERE ano_lancamento = 2011;

SELECT min(preco_aluguel) FROM filmes WHERE genero LIKE 'Ação e Aventura';

SELECT count(*) FROM clientes WHERE regiao = 'Sudeste';

SELECT round((avg(preco_aluguel)),2) FROM filmes WHERE ano_lancamento > 2010;

SELECT min(ano_nascimento) FROM atores;

SELECT max(data_nascimento) FROM clientes WHERE sexo = 'Masculino';

SELECT count(*) FROM alugueis WHERE nota = 10;

SELECT round((avg(nota)),2) FROM alugueis WHERE id_filme = 5;

SELECT sum(duracao) FROM filmes WHERE genero LIKE '%Mistério e Suspense%';

SELECT count(*) FROM atores WHERE sexo = 'Feminino' AND nacionalidade = 'EUA';

SELECT round((avg(preco_aluguel)),2) FROM filmes WHERE duracao > 150;

SELECT count(*) FROM alugueis WHERE data_aluguel >= '2018-01-01';