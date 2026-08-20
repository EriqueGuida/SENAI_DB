-- ============================================================
-- ATIVIDADE PRÁTICA - JOINS E AGREGAÇÕES
-- Banco de dados: CineCode_gabarito
-- ============================================================
--
-- OBJETIVO:
-- Praticar INNER JOIN, LEFT JOIN e RIGHT JOIN em uma sequência
-- progressiva, utilizando os relacionamentos reais do banco.
--
-- TABELAS PRINCIPAIS:
--   filmes
--   atores
--   clientes
--   atuacoes
--   alugueis
--
-- RELACIONAMENTOS:
--
--   filmes  <---- atuacoes ----> atores
--
--   clientes <---- alugueis ----> filmes
--
-- Escreva cada consulta no espaço abaixo do enunciado.
-- ============================================================

USE CineCode_gabarito;


-- ============================================================
-- PARTE 1 - INNER JOIN
-- ============================================================


-- ------------------------------------------------------------
-- ATIVIDADE 1 - CLIENTES E ALUGUÉIS
-- ------------------------------------------------------------
-- Exiba o nome de cada cliente junto com a data de cada aluguel
-- realizado por ele.
--
-- Utilize:
--   clientes
--   alugueis
--   INNER JOIN
--
-- Exiba:
--   - nome do cliente;
--   - data do aluguel.

SELECT c.nome_cliente AS 'Nome do Cliente', al.data_aluguel AS 'Data do Aluguel' FROM alugueis AS al 
JOIN clientes AS c ON c.id_cliente = al.id_cliente;



-- ------------------------------------------------------------
-- ATIVIDADE 2 - FILMES ALUGADOS
-- ------------------------------------------------------------
-- Exiba o título do filme e a data em que ele foi alugado.
--
-- Utilize:
--   filmes
--   alugueis
--   INNER JOIN
--
-- Exiba:
--   - título;
--   - data do aluguel.
SELECT f.titulo AS 'Título', al.data_aluguel AS 'Data do Aluguel' FROM alugueis AS al
JOIN filmes AS f ON f.id_filme = al.id_filme;




-- ------------------------------------------------------------
-- ATIVIDADE 3 - CLIENTE + FILME
-- ------------------------------------------------------------
-- Mostre quem alugou cada filme.
--
-- Será necessário relacionar três tabelas:
--   clientes
--   alugueis
--   filmes
--
-- Exiba:
--   - nome do cliente;
--   - título do filme;
--   - data do aluguel.
SELECT c.nome_cliente AS 'Nome do Cliente', f.titulo AS 'Titulo', al.data_aluguel AS 'Data do Aluguel' FROM alugueis AS al
JOIN clientes AS c ON c.id_cliente = al.id_cliente
JOIN filmes AS f ON f.id_filme = al.id_filme;




-- ------------------------------------------------------------
-- ATIVIDADE 4 - JOIN COM FILTRO
-- ------------------------------------------------------------
-- Liste os clientes que alugaram filmes do gênero "Drama".
--
-- Exiba:
--   - nome do cliente;
--   - título do filme;
--   - gênero;
--   - data do aluguel.
--
-- Utilize INNER JOIN e WHERE.
SELECT c.nome_cliente AS 'Nome do Cliente', f.titulo AS 'Título', f.genero AS 'Gênero', al.data_aluguel AS 'Data do Aluguel' FROM alugueis AS al
JOIN clientes AS c ON c.id_cliente = al.id_cliente 
JOIN filmes AS f ON f.id_filme = al.id_filme
WHERE genero = 'Drama';




-- ------------------------------------------------------------
-- ATIVIDADE 5 - FILMES E ATORES
-- ------------------------------------------------------------
-- Liste os filmes e os atores que atuaram neles.
--
-- Será necessário utilizar:
--   filmes
--   atuacoes
--   atores
--
-- Exiba:
--   - título do filme;
--   - nome do ator.
select f.titulo AS 'Título', at.nome_ator AS 'Nome dos Atores' FROM atuacoes AS ats
JOIN filmes AS f ON f.id_filme = ats.id_filme
JOIN atores AS at ON at.id_ator = ats.id_ator;




-- ------------------------------------------------------------
-- ATIVIDADE 6 - FILTRO POR NACIONALIDADE
-- ------------------------------------------------------------
-- Liste somente filmes que possuem atores de nacionalidade
-- "EUA".
--
-- Exiba:
--   - título do filme;
--   - nome do ator;
--   - nacionalidade.
select f.titulo AS 'Título', at.nome_ator AS 'Nome dos Atores', at.nacionalidade FROM atuacoes AS ats
JOIN filmes AS f ON f.id_filme = ats.id_filme
JOIN atores AS at ON at.id_ator = ats.id_ator
WHERE at.nacionalidade = 'EUA';




-- ------------------------------------------------------------
-- ATIVIDADE 7 - FILTRO POR ANO
-- ------------------------------------------------------------
-- Liste os atores que participaram de filmes lançados a partir
-- de 2010.
--
-- Exiba:
--   - nome do ator;
--   - título do filme;
--   - ano de lançamento.
--
-- Ordene do filme mais recente para o mais antigo.
SELECT at.nome_ator AS 'Nome do Ator', f.titulo AS 'Título', f.ano_lancamento AS 'Ano de Lançamento' FROM atuacoes AS ats
JOIN filmes AS f ON f.id_filme = ats.id_filme
JOIN atores AS at ON at.id_ator = ats.id_ator
WHERE f.ano_lancamento >= 2010;




-- ============================================================
-- PARTE 2 - LEFT JOIN
-- ============================================================


-- ------------------------------------------------------------
-- ATIVIDADE 8 - TODOS OS CLIENTES
-- ------------------------------------------------------------
-- Liste TODOS os clientes e os alugueis realizados por eles.
--
-- Clientes que nunca fizeram aluguel também devem aparecer.
--
-- Exiba:
--   - nome do cliente;
--   - id do aluguel;
--   - data do aluguel.
--
-- Utilize LEFT JOIN.
SELECT c.nome_cliente AS 'Nome do Cliente', al.id_aluguel AS 'ID do Aluguel', al.data_aluguel AS 'Data do  Aluguel' FROM clientes AS c
LEFT JOIN alugueis AS al ON c.id_cliente = al.id_cliente;




-- ------------------------------------------------------------
-- ATIVIDADE 9 - CLIENTES SEM ALUGUEL
-- ------------------------------------------------------------
-- Utilizando LEFT JOIN, mostre somente os clientes que nunca
-- realizaram um aluguel.
--
-- Exiba:
--   - id do cliente;
--   - nome do cliente.
--
-- DICA:
-- Procure os registros em que o lado da tabela alugueis ficou
-- com valor NULL.
SELECT c.nome_cliente AS 'Nome do Cliente', al.id_aluguel AS 'ID do Aluguel', al.data_aluguel AS 'Data do  Aluguel' FROM clientes AS c
LEFT JOIN alugueis AS al ON c.id_cliente = al.id_cliente
WHERE al.id_aluguel IS NULL;




-- ------------------------------------------------------------
-- ATIVIDADE 10 - TODOS OS FILMES E ATORES
-- ------------------------------------------------------------
-- Liste TODOS os filmes e os atores relacionados a eles.
--
-- Filmes que não possuem ator cadastrado em atuacoes também
-- devem aparecer.
--
-- Exiba:
--   - título do filme;
--   - nome do ator.
--
-- Utilize LEFT JOIN.

SELECT f.titulo AS 'Titulo', at.nome_ator AS 'Nome do Ator' FROM atuacoes AS ats
LEFT JOIN atores AS at ON at.id_ator = ats.id_ator
LEFT JOIN filmes AS f ON f.id_filme = ats.id_filme;



-- ------------------------------------------------------------
-- ATIVIDADE 11 - FILMES SEM ATOR CADASTRADO
-- ------------------------------------------------------------
-- Utilizando LEFT JOIN, mostre somente os filmes que não possuem
-- nenhum ator relacionado na tabela atuacoes.
--
-- Exiba:
--   - id do filme;
--   - título.





-- ============================================================
-- PARTE 3 - RIGHT JOIN
-- ============================================================


-- ------------------------------------------------------------
-- ATIVIDADE 12 - TODOS OS CLIENTES COM RIGHT JOIN
-- ------------------------------------------------------------
-- Refaça a ATIVIDADE 8 utilizando RIGHT JOIN.
--
-- Todos os clientes devem aparecer, mesmo aqueles que não
-- possuem aluguel.
--
-- Exiba:
--   - nome do cliente;
--   - id do aluguel;
--   - data do aluguel.
--
-- ATENÇÃO:
-- Para preservar todos os clientes, pense em qual tabela deve
-- ficar do lado direito do RIGHT JOIN.
SELECT c.nome_cliente AS 'Nome do Cliente', al.id_aluguel AS 'ID do Aluguel', al.data_aluguel AS 'Data do  Aluguel' FROM clientes AS c
RIGHT JOIN alugueis AS al ON c.id_cliente = al.id_cliente;




-- ------------------------------------------------------------
-- ATIVIDADE 13 - TODOS OS ATORES
-- ------------------------------------------------------------
-- Utilize RIGHT JOIN para listar TODOS os atores e os filmes
-- em que eles atuaram.
--
-- Atores sem filme relacionado também devem aparecer.
--
-- Exiba:
--   - nome do ator;
--   - título do filme.
SELECT f.titulo AS 'Titulo', at.nome_ator AS 'Nome do Ator' FROM atuacoes AS ats
RIGHT JOIN atores AS at ON at.id_ator = ats.id_ator
RIGHT JOIN filmes AS f ON f.id_filme = ats.id_filme;





-- ------------------------------------------------------------
-- ATIVIDADE 14 - LEFT JOIN X RIGHT JOIN
-- ------------------------------------------------------------
-- Faça DUAS consultas que produzam o mesmo resultado:
--
-- CONSULTA A:
--   utilize LEFT JOIN.
--
-- CONSULTA B:
--   utilize RIGHT JOIN.
--
-- O resultado deve mostrar:
--   - todos os filmes;
--   - os atores relacionados a cada filme, quando houver.
--
-- Exiba:
--   - título do filme;
--   - nome do ator.
SELECT f.titulo AS 'Título', at.nome_ator AS 'Nome do Ator' FROM filmes AS f
LEFT JOIN atuacoes AS ats ON ats.id_filme = f.id_filme
LEFT JOIN atores AS at ON at.id_ator = ats.id_ator;

SELECT f.titulo AS 'Título', at.nome_ator AS 'Nome do Ator' FROM atores AS at
RIGHT JOIN atuacoes AS ats ON ats.id_ator = at.id_ator
RIGHT JOIN filmes AS f ON f.id_filme = ats.id_filme;




-- ============================================================
-- PARTE 4 - JOINS COM AGREGAÇÕES
-- ============================================================


-- ------------------------------------------------------------
-- ATIVIDADE 15 - QUANTIDADE DE ALUGUÉIS POR CLIENTE
-- ------------------------------------------------------------
-- Conte quantos alugueis cada cliente realizou.
--
-- Exiba:
--   - nome do cliente;
--   - quantidade de alugueis.
--
-- Mostre TODOS os clientes, inclusive aqueles com zero alugueis.
--
-- Utilize:
--   LEFT JOIN
--   COUNT()
--   GROUP BY
--
-- ATENÇÃO:
-- Pense por que COUNT(id_aluguel) é mais adequado que COUNT(*)
-- neste caso.
SELECT c.nome_cliente AS 'Nome do Cliente', COUNT(al.id_aluguel) AS 'Quantidade de Aluguéis' FROM alugueis AS al
LEFT JOIN clientes AS c ON c.id_cliente = al.id_cliente
GROUP BY c.id_cliente
ORDER BY COUNT(al.id_aluguel) DESC;




-- ------------------------------------------------------------
-- ATIVIDADE 16 - QUANTIDADE DE VEZES QUE CADA FILME FOI ALUGADO
-- ------------------------------------------------------------
-- Conte quantas vezes cada filme foi alugado.
--
-- Exiba:
--   - título do filme;
--   - quantidade de alugueis.
--
-- Todos os filmes devem aparecer, mesmo os nunca alugados.
--
-- Ordene do mais alugado para o menos alugado.
SELECT f.titulo AS 'Título', COUNT(al.id_aluguel) AS 'Quantidade de Aluguéis' FROM alugueis AS al
LEFT JOIN filmes AS f ON f.id_filme = al.id_filme
GROUP BY f.id_filme;




-- ------------------------------------------------------------
-- ATIVIDADE 17 - MÉDIA DAS NOTAS POR FILME
-- ------------------------------------------------------------
-- Calcule a média das notas recebidas por cada filme nos
-- alugueis.
--
-- Exiba:
--   - título do filme;
--   - média das notas.
--
-- Utilize:
--   INNER JOIN
--   AVG()
--   GROUP BY
--
-- DICA:
-- O campo nota pode possuir valores NULL.
-- AVG() ignora valores NULL.
--
-- Utilize ROUND() para deixar a média com duas casas decimais.
SELECT f.titulo AS 'Título', ROUND(AVG(al.nota),2) AS 'Nota Média' FROM alugueis AS al
JOIN filmes AS f ON f.id_filme = al.id_filme
GROUP BY f.titulo;




-- ------------------------------------------------------------
-- ATIVIDADE 18 - QUANTIDADE DE ATORES POR FILME
-- ------------------------------------------------------------
-- Conte quantos atores estão cadastrados para cada filme.
--
-- Exiba:
--   - título do filme;
--   - quantidade de atores.
--
-- Todos os filmes devem aparecer.
--
-- Utilize:
--   LEFT JOIN
--   COUNT()
--   GROUP BY
SELECT f.titulo AS 'Título', COUNT(at.id_ator) AS 'Quantidade de Atores' FROM filmes AS f
LEFT JOIN atuacoes AS ats ON ats.id_filme = f.id_filme
LEFT JOIN atores AS at ON at.id_ator = ats.id_ator
GROUP BY f.id_filme;



-- ------------------------------------------------------------
-- ATIVIDADE 19 - ALUGUÉIS POR REGIÃO
-- ------------------------------------------------------------
-- Conte quantos alugueis foram realizados por clientes de cada
-- região do Brasil.
--
-- Exiba:
--   - região;
--   - quantidade de alugueis.
--
-- Utilize:
--   clientes
--   alugueis
--   INNER JOIN
--   COUNT()
--   GROUP BY
--
-- Ordene da região com mais alugueis para a com menos.
SELECT c.regiao AS 'Região', COUNT(al.id_aluguel) AS 'Quantidade de Aluguéis' FROM alugueis AS al
JOIN clientes AS c ON c.id_cliente = al.id_cliente
GROUP BY c.regiao
ORDER BY COUNT(al.id_aluguel) DESC;




-- ------------------------------------------------------------
-- ATIVIDADE 20 - FATURAMENTO POR FILME
-- ------------------------------------------------------------
-- Calcule quanto cada filme gerou em alugueis.
--
-- O valor de cada aluguel corresponde ao campo preco_aluguel
-- da tabela filmes.
--
-- Exiba:
--   - título do filme;
--   - quantidade de vezes alugado;
--   - valor total gerado.
--
-- Utilize:
--   JOIN
--   COUNT()
--   SUM()
--   GROUP BY
--
-- DICA:
-- Cada linha de alugueis representa uma locação do filme.
SELECT f.titulo AS 'Título', COUNT(al.id_aluguel) AS 'Quantidade de Aluguéis', ROUND(SUM(f.preco_aluguel),2) AS 'Receita Gerada' 
FROM alugueis AS al
JOIN filmes AS f ON f.id_filme = al.id_filme
GROUP BY f.id_filme;




-- ============================================================
-- PARTE 5 - HAVING E DESAFIOS
-- ============================================================


-- ------------------------------------------------------------
-- ATIVIDADE 21 - CLIENTES MAIS ATIVOS
-- ------------------------------------------------------------
-- Mostre somente os clientes que realizaram 5 ou mais alugueis.
--
-- Exiba:
--   - nome do cliente;
--   - quantidade de alugueis.
--
-- Utilize:
--   JOIN
--   COUNT()
--   GROUP BY
--   HAVING
SELECT c.nome_cliente AS 'Nome do Cliente', COUNT(al.id_aluguel) AS 'Quandidade de Aluguéis' 
FROM alugueis AS al
JOIN clientes AS c ON c.id_cliente = al.id_cliente
GROUP BY c.id_cliente
HAVING COUNT(al.id_aluguel) >= 5;




-- ------------------------------------------------------------
-- ATIVIDADE 22 - FILMES MAIS ALUGADOS
-- ------------------------------------------------------------
-- Mostre somente os filmes que foram alugados mais de 8 vezes.
--
-- Exiba:
--   - título;
--   - quantidade de alugueis.
--
-- Ordene do mais alugado para o menos alugado.
SELECT f.titulo, COUNT(al.id_aluguel) 
FROM filmes AS f
JOIN alugueis AS al ON al.id_filme = f.id_filme
GROUP BY f.id_filme
HAVING COUNT(al.id_aluguel) >= 8
ORDER BY COUNT(al.id_aluguel) DESC;


-- ------------------------------------------------------------
-- ATIVIDADE 23 - GÊNEROS E MÉDIA DE NOTAS
-- ------------------------------------------------------------
-- Calcule a média das notas dos alugueis para cada gênero.
--
-- Exiba:
--   - gênero;
--   - quantidade de avaliações;
--   - média das notas.
--
-- Considere somente notas preenchidas.
--
-- Utilize:
--   JOIN
--   COUNT()
--   AVG()
--   WHERE
--   GROUP BY
SELECT f.genero AS 'Gênero', COUNT(al.nota) AS 'Quantidade de Notas', ROUND(AVG(al.nota),2) AS 'Nota Média'
FROM alugueis al 
JOIN filmes f ON f.id_filme = al.id_filme
WHERE al.nota IS NOT NULL
GROUP BY f.genero;




-- ------------------------------------------------------------
-- ATIVIDADE 24 - GÊNEROS BEM AVALIADOS
-- ------------------------------------------------------------
-- A partir da lógica da atividade anterior, mostre somente os
-- gêneros cuja média das notas seja maior ou igual a 7.
--
-- Exiba:
--   - gênero;
--   - quantidade de avaliações;
--   - média das notas.
--
-- Utilize HAVING.
SELECT f.genero AS 'Gênero', COUNT(al.nota) AS 'Quantidade de Notas', ROUND(AVG(al.nota),2) AS 'Nota Média'
FROM alugueis al 
JOIN filmes f ON f.id_filme = al.id_filme
WHERE al.nota IS NOT NULL
GROUP BY f.genero
HAVING ROUND(AVG(al.nota),2) >= 7;




-- ------------------------------------------------------------
-- ATIVIDADE 25 - RELATÓRIO FINAL DE FILMES
-- ------------------------------------------------------------
-- Crie um relatório com:
--
--   - título do filme;
--   - gênero;
--   - quantidade de alugueis;
--   - média das notas;
--   - valor total gerado em alugueis.
--
-- Todos os filmes devem aparecer, mesmo aqueles que nunca foram
-- alugados.
--
-- Utilize:
--   LEFT JOIN
--   COUNT()
--   AVG()
--   SUM()
--   GROUP BY
--
-- DICA:
-- Para filmes nunca alugados, utilize COALESCE() se quiser
-- apresentar o faturamento como 0 em vez de NULL.
SELECT f.titulo AS 'Título', f.genero AS 'Gênero', COUNT(al.id_aluguel) AS 'Quantidade de Aluguéis', ROUND(AVG(al.nota),2) AS 'Nota Média', ROUND(SUM(f.preco_aluguel),2) AS 'Receita Total'
FROM filmes f 
LEFT JOIN alugueis al ON al.id_filme = f.id_filme
GROUP BY f.id_filme
ORDER BY ROUND(SUM(f.preco_aluguel),2) DESC, COUNT(al.id_aluguel) DESC;




-- ============================================================
-- FIM DA ATIVIDADE
-- ============================================================
