SELECT ano_lancamento AS 'Ano de Lançamento', count(*) AS 'Número de Lançamentos'
FROM filmes GROUP BY ano_lancamento;

SELECT genero AS 'Gênero', round((avg(duracao)),2) AS 'Média de Duração'
FROM filmes GROUP BY genero;

SELECT nacionalidade AS 'Nacionalidade', count(*) AS 'Número de Atores'
FROM atores GROUP BY nacionalidade;

SELECT estado AS 'Estados', count(*) AS 'Número de Clientes'
FROM clientes GROUP BY estado;

SELECT genero AS 'Gênero', round((sum(preco_aluguel)),2) AS 'Receita'
FROM filmes GROUP BY genero;

SELECT id_filme AS 'ID Filme', count(*) AS 'Vezes Alugadas'
FROM alugueis GROUP BY id_filme;

SELECT filmes.titulo AS 'Títulos', count(*) AS 'Vezes Alugadas'
FROM alugueis
JOIN filmes ON alugueis.id_filme = filmes.id_filme
GROUP BY filmes.titulo ORDER BY count(*) DESC;

SELECT id_cliente, round((avg(nota)),2) AS 'Nota Média' 
FROM alugueis GROUP BY id_cliente;

SELECT clientes.nome_cliente AS 'Cliente', round((avg(nota)),2) AS 'Nota Média' 
FROM alugueis 
JOIN clientes ON alugueis.id_cliente = clientes.id_cliente
GROUP BY clientes.nome_cliente;

SELECT sexo AS 'Sexo', count(*) AS 'Número de Atores'
FROM atores GROUP BY sexo;

SELECT data_aluguel, count(*) FROM alugueis GROUP BY data_aluguel;

SELECT ano_lancamento, max(preco_aluguel) AS 'Preço Máximo'
FROM filmes GROUP BY ano_lancamento;