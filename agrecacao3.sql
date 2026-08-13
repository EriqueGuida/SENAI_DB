SELECT id_filme AS 'ID Filme', count(*) AS 'Vezes Alugadas'
FROM alugueis GROUP BY id_filme HAVING count(id_filme) >= 5;

SELECT filmes.titulo AS 'ID Filme', count(*) AS 'Vezes Alugadas'
FROM alugueis 
JOIN filmes ON alugueis.id_filme = filmes.id_filme
GROUP BY filmes.titulo HAVING count(alugueis.id_filme) >= 5 
ORDER BY count(alugueis.id_filme) DESC;



SELECT id_cliente AS 'ID Cliente', count(*) AS 'Alugueis Feitos'
FROM alugueis GROUP BY id_cliente HAVING count(id_cliente) >= 3; 

SELECT genero AS 'Gêneros', round((avg(preco_aluguel)),2) AS 'Media de Preço'
FROM filmes GROUP BY genero HAVING count(preco_aluguel) >= 2.50;

SELECT ano_lancamento AS 'Ano de Lançamento', count(*) AS 'Filmes Lançados'
FROM filmes GROUP BY ano_lancamento HAVING count(*) > 4;

SELECT id_ator, count(*) AS 'Número de Atuações'
FROM atuacoes GROUP BY id_ator HAVING count(*) > 1;

SELECT estado, count(*) AS 'Número de Clientes'
FROM clientes GROUP BY estado HAVING count(*) > 6;

SELECT id_filme, round((avg(nota)),2) AS 'Nota Média' 
FROM alugueis GROUP BY id_filme HAVING round((avg(nota)),2) > 8;

SELECT id_cliente, count(*) AS 'Filmes Alugados'
FROM alugueis GROUP BY id_cliente HAVING count(*) >= 2;

SELECT ano_lancamento, sum(duracao) AS 'Duração'
FROM filmes GROUP BY ano_lancamento HAVING sum(duracao) > 500;

SELECT nacionalidade, count(*) AS 'Número de Atores'
FROM atores GROUP BY nacionalidade HAVING count(*) > 8;

