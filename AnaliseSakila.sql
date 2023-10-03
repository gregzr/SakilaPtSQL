#Listagem da descrição dos Filmes em Ordem Alfabética 
#Ascendente
SELECT *
FROM filme
ORDER BY descricao ASC;

#Descendente
SELECT *
FROM filme
ORDER BY descricao DESC;


#Joins de Tabelas
SELECT * 
FROM aluguel;

SELECT *
FROM cliente;

SELECT b.primeiro_nome, b.ultimo_nome, b.email, count(*)
FROM aluguel a, cliente b
WHERE  a.cliente_id = b.cliente_id
GROUP BY b.primeiro_nome
ORDER BY b.primeiro_nome;


#Localize os filmes de sua loja virtual como gênero Ação
# categoria_id = 1 (Action)
SELECT *
FROM categoria;

SELECT *
FROM filme;

SELECT *
FROM filme_categoria;


SELECT a.nome, b.titulo, b.descricao, b.preco_da_locacao
FROM categoria a,filme b, filme_categoria c
WHERE a.categoria_id = c.categoria_id
AND b.filme_id = c.filme_id
AND a.categoria_id = 1
ORDER BY 4;


# Procure o último Filme alugado de sua Locadora
# A ligação com Filme está na tabela de inventario
# Ultima data_de_aluguel da tabela aluguel
SELECT * FROM aluguel;

SELECT * FROM inventario;

SELECT * FROM filme;

SELECT a.data_de_aluguel, c.titulo, c.descricao, c.filme_id, a.aluguel_id
FROM aluguel a, inventario b, filme c
WHERE a.inventario_id = b.inventario_id
AND b.filme_id = c.filme_id
AND c.filme_id = 2
AND a.aluguel_id =  13421
ORDER BY data_de_aluguel DESC;


#Somando valores com o comando SUM
SELECT sum(a.preco_da_locacao)
FROM filme a;

SELECT a.nome,sum(b.preco_da_locacao), sum(custo_de_substituicao)
FROM categoria a,filme b, filme_categoria c
WHERE a.categoria_id = c.categoria_id
AND b.filme_id = c.filme_id;

#Recuperando a Média dos valores de uma tabela usando AVG()
SELECT AVG(a.preco_da_locacao)
FROM filme a;

SELECT a.nome,AVG(b.preco_da_locacao), AVG(custo_de_substituicao)
FROM categoria a,filme b, filme_categoria c
WHERE a.categoria_id = c.categoria_id
AND b.filme_id = c.filme_id;

# Filtrando ocorrências dupliucadas com DISTINCT
SELECT DISTINCT c.titulo, c.descricao, c.filme_id
FROM aluguel a, inventario b, filme c
WHERE a.inventario_id = b.inventario_id
AND b.filme_id = c.filme_id
ORDER BY data_de_aluguel DESC;

# Traga um filme distinto em registros repetidos

SELECT a.data_de_aluguel, c.titulo, c.descricao, c.filme_id, a.aluguel_id
FROM aluguel a, inventario b, filme c
WHERE a.inventario_id = b.inventario_id
AND b.filme_id = c.filme_id
ORDER BY data_de_aluguel DESC;


