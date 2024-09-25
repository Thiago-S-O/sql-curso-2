SELECT COUNT(*) FROM TABELA_DE_CLIENTES;

SELECT COUNT(*) FROM TABELA_DE_PRODUTOS;

SELECT COUNT(*) FROM TABELA_DE_VENDEDORES;

SELECT COUNT(*) FROM ITENS_NOTAS_FISCAIS;
/*contar a quantidade de linhas da tabela*/
SELECT COUNT(*) FROM NOTAS_FISCAIS;
/*consultar tudo da tabela*/
SELECT * FROM TABELA_DE_CLIENTES;
/*consultas de algumas colunas*/
SELECT CPF, NOME, BAIRRO, CIDADE FROM TABELA_DE_CLIENTES;
/*alterar a ordem das colunas s� na hora da vizualiza��o*/
SELECT NOME, CPF, BAIRRO, CIDADE FROM TABELA_DE_CLIENTES;
/*apelidar uma ou mais colunas*/
SELECT CPF AS IDENTIFICADOR, NOME AS [NOME DE CLIENTE], BAIRRO, CIDADE FROM TABELA_DE_CLIENTES;
/*apelidar tamb�m o nome de uma tabela*/
SELECT CPF AS IDENTIFICADOR, NOME AS [NOME DE CLIENTE], BAIRRO, CIDADE FROM TABELA_DE_CLIENTES AS TDC;
/*ou apelidar o nome da tabela desta forma*/
SELECT CPF AS IDENTIFICADOR, NOME AS [NOME DE CLIENTE], BAIRRO, CIDADE FROM TABELA_DE_CLIENTES TDC;
/*poss�vel chamar alguns itens ou todos atrav�s de um apelido da tabela*/
SELECT TDC.* FROM TABELA_DE_CLIENTES TDC;
/*ou chamar dessa forma diretamente do nome da tabela, isso ajuda com v�rias tabelas que tenham os mesmos itens*/
SELECT TABELA_DE_CLIENTES.CPF, TABELA_DE_CLIENTE.NOME FROM TABELA_DE_CLIENTES;

/*______FILTROS______*/
SELECT * FROM TABELA_DE_PRODUTOS;
/*o WHERE verifica se a express�o � verdadeira o falsa, se verdade, ele exibe a infoma��o*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '290478';
/*tamb�m n�o importa se a consulta for com letras mai�scula ou min�scula*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja';

/*____FILTRO DE DATA E N�MEROS*/
SELECT * FROM TABELA_DE_CLIENTES;
/*o filtro pode ser maior, menor, igual, diferente(<>) ou concatenar igual com (< ou >)*/
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE > 20;
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE < 20;
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE >= 20;
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE <> 20;
/*a mesma l�gica � com a filtro de data*/
SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO <= '1995-11-14';

/*___FILTROS MASI COMPLEXOS COM OPERADORES L�GICOS___*/
SELECT * FROM TABELA_DE_PRODUTOS;
/*AND*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' AND TAMANHO ='470 ml';
/*OR*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR TAMANHO ='470 ml';
/*o NOT tr�s o oposto do resultado, neste caso, ele s� � aplicado ao SABOR*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT SABOR = 'Manga' AND TAMANHO = '470 ml';
/*com o par�nteses, o NOT � aplicado a tudo dentro dele*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' AND TAMANHO='470 ml');
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' OR TAMANHO='470 ml');

/*para v�rios OR seguidos , � poss�vel utilizar o IN e colocar as op��es no par�nteses*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR SABOR = 'Laranja' OR SABOR = 'Melancia';
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Manga', 'Laranja', 'Melancia');

/*podemos ter concatena��o de operadores, como nos exemplos abaixo*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR in ('Manga', 'Laranja', 'Melancia') AND TAMANHO = '1 Litro';
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE in ('Rio de Janeiro', 'Sao Paulo');
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE in ('Rio de Janeiro', 'Sao Paulo') AND IDADE >= 20;
/*pode colocar tanto AND como tamb�m BETWEEN, � a mesma coisa*/
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE in ('Rio de Janeiro', 'Sao Paulo') AND (IDADE >= 20 AND IDADE <= 25);
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE in ('Rio de Janeiro', 'Sao Paulo') AND (IDADE BETWEEN 20 AND 25);

/*___ filtro com o operador 'LIKE', 
os dois primeiros comandos abaixo filtram a mesma coisa*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Lima/Limao', 'Morango/Limao');
/*filtra o que terminar com 'Limao' por causa do '%'*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Limao';
/*filtra o que tiver 'Maca' no comen�o ou no fim do sabor*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Maca%';
/*filtra o que come�a com a palavra	'Morango'*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'Morango%';
/*assim como os outros operadores, � poss�vel fazer concatena��es tamb�m*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE (SABOR LIKE 'Morango%') AND (EMBALAGEM = 'PET');

SELECT * FROM TABELA_DE_CLIENTES WHERE NOME LIKE '%silva%';

/*comando DISTINCT*/
SELECT * FROM TABELA_DE_PRODUTOS;
SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;
/*o DISTINCT s� pega um valor da tabela sem repeti-lo, faz agrupamentos*/
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS;
/*� poss�vel concatenar com outros filtros*/
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';
SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;

/*comando TOP*/
SELECT * FROM TABELA_DE_PRODUTOS;
/*� mostrado as 5 primeiras linhas da tabela*/
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS;
/*� mostrado as 5 primeiras linhas da tabela que tenha o sabor ma��*/
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';

/*comando ORDER BY: 
tras os produtos na ordem alfabetica (se for palavras), num�rica (se for n�meros), data mais antiga at� as recentes, etc...*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA;
/*o complemento ASC � crescente, por padr�o o coamndo acima j� vem como ASC*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA ASC;
/*o complemento DESC � drecrescente, � o inverso do de cima, vai vir de Z-A, do maior n�mero para o menor, etc...*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;
/**/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO;
/*� poss�vel fazer mais de uma ordem, neste caso, 
o camndo aplica a ordem na primeira coluna e em seguida aplica na segunda*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM, NOME_DO_PRODUTO;
/*o mesmo � para a ordem decrescente*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO DESC;
/*� poss�vel concatenar com outros comando, no caso, tras o 5 primeiros do mais caro ao mais barato*/
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;

/*comando GROUP BY: faz agrupamentos dos itens na coluna selecionada, parecido com o DISTINCT*/
SELECT * FROM TABELA_DE_CLIENTES;
/*neste caso, soma (SUM) as idades da TABELA_DE_CLIENTES e separa por cidades*/
SELECT CIDADE, SUM(IDADE) AS IDADE FROM TABELA_DE_CLIENTES GROUP BY CIDADE;
/*� poss�vel fazer v�rios filtros e separar os grupos por cidade, no caso, 
� obtido a m�dia das idades (AVG) e a soma dos cr�ditos (SUM), lembrando que o AS � para apelidar o nome da coluna*/
SELECT CIDADE, AVG(IDADE) AS IDADE, SUM(LIMITE_DE_CREDITO) AS CREDITO FROM TABELA_DE_CLIENTES GROUP BY CIDADE;
/*aqui ele conta quantas clientes tem por cidade, j� que cada cliente tem uma cidade, 
criando uma nova coluna (apelidada de NUMERO_DE_CLIENTES) com a quantidade de cliente por cidade*/
SELECT CIDADE, COUNT(*) AS NUMERO_DE_CLIENTES FROM TABELA_DE_CLIENTES GROUP BY CIDADE;
/*separa as embalagens do sabor laranja pela quantidade de clientes que as compra*/
SELECT EMBALAGEM, COUNT(*) AS NUMERO_DE_CLIENTES FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja' GROUP BY EMBALAGEM;

/*comando HEVING:
o comando abaixo pega a soma do limite de cr�dito por estado e tras o que tem na soma um valor maior do que 900000
o comando HAVING funciona com o SUN, AVG, MIN e MAX*/
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS CREDITO 
FROM TABELA_DE_CLIENTES GROUP BY ESTADO 
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;
/*tras os produtos mais caros e os mais barato de cada embalagem*/
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN 
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;
/*faz a mesma coisa de cima, mas ele tem um filtro de valores maiores ou igual a 20, 
neste caso, pode usar tanto o WHERE como o HAVING como mostrado abaixo*/
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN 
FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA >= 10 
GROUP BY EMBALAGEM HAVING MAX(PRECO_DE_LISTA) >=20;

/*comando condicional CASE WHEN*/
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS;
/*no comando abaixo, ele tras duas colunas, faz uma classifica��o (se o porduto � caro, barato ou em conta) 
e apelida essa nova coluna com 'CLASSIFICACAO', faz um filtro (tr�s s� o sabor manga) e ordena essa classifica��o*/
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >12 THEN 'PRODUTO CARO' 
      WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA' 
      ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO 
FROM TABELA_DE_PRODUTOS 
WHERE SABOR = 'Manga'
ORDER BY CLASSIFICACAO;
/**/
SELECT 
(CASE WHEN PRECO_DE_LISTA >12 THEN 'PRODUTO CARO' 
      WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA' 
      ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO, COUNT(*) AS NUMERO_DE_PRODUTOS 
FROM TABELA_DE_PRODUTOS 
GROUP BY (CASE WHEN PRECO_DE_LISTA >12 THEN 'PRODUTO CARO' 
      WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA' 
      ELSE 'PRODUTO BARATO' END);
/**/

/*comando INNER JOIN*/
SELECT * FROM TABELA_DE_VENDEDORES;
SELECT * FROM NOTAS_FISCAIS;
/*usando um INNER JOIN, � possivel fazer uma consulta em duas tabelas, no caso abaixo,
� selecionada a matricula de ambas as tabelas (que � o que elas tem em comum), e � selecionado o nome tamb�m,
depois contado o n�mero de notas, � mostrado o nome do vendedor, sua matr�cula e a quantidade de vendas feitas por ele*/
SELECT NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME, COUNT(*) AS NUMERO_NOTAS 
FROM NOTAS_FISCAIS 
INNER JOIN TABELA_DE_VENDEDORES 
ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA 
GROUP BY NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME;
/*� poss�vel dar apelidos as colunas selecionadas, como no caso abaixo, assim diminui o volume de comandos.
como boa pr�tica, sempre chamar a tabela principal e fazer um INNER JOIN com a tabela que depende da principal*/
SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_NOTAS 
FROM TABELA_DE_VENDEDORES TV  
INNER JOIN NOTAS_FISCAIS NF
ON NF.MATRICULA = TV.MATRICULA 
GROUP BY NF.MATRICULA, TV.NOME;

/*al�m do INNER JOIN existe tamb�m: 
LEFT JOIN - que pega toda a tabela da esquerda (do comando, o que vem antes do FROM) e concatena com o que tiver na outra tabela que seja em comum;
RIGHT JOIN - mesma coisa do LEFT JOIN, s� que pega todos os elementos que vem depois do FROM;
FULL JOIN - concatena tudo das duas tabelas e mostra as combina��es e o que n�o combina, � o LEFT JOIN + RIGHT JOIN;
CROSS JOIN - ele faz uma an�lise combinat�ria, todas as poss�veis combina��es poss�veis
*/
/*o comando LEFT JOIN*/
/*buscando os clientes que est�o cadastrados*/
SELECT DISTINCT 
TC.CPF AS CPF_DO_CADASTRO, 
TC.NOME AS NOME_DO_CLIENTE, 
NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC 
INNER JOIN NOTAS_FISCAIS NF 
ON TC.CPF = NF.CPF;
/**/
/*inserirndo um novo cadastro de cliente, mas esse cliente ainda n�o fez compras na empresa*/
INSERT INTO TABELA_DE_CLIENTES 
(CPF, NOME, ENDERECO_1, ENDERECO_2,
BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO,
LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA)
VALUES ('23412632331', 'Juliana Silva', 'Rua Tramanda�', ' ', 'Bangu', 'Rio de
Janeiro', 'RJ', '23400000', '1989-02-04', 33, 'F', '180000', '24500', 0);
/**/
/*realizando a mesma consulta, � visto que h� mais um cliente, 
por�m como ela nunca comprou da empresa, aparecer� null em CPF_DA_NOTA*/
SELECT DISTINCT 
TC.CPF AS CPF_DO_CADASTRO, 
TC.NOME AS NOME_DO_CLIENTE, 
NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC 
LEFT JOIN NOTAS_FISCAIS NF 
ON TC.CPF = NF.CPF;
/**/
/*podemos filtrar esse cliente que est� no cadastro, mas nunca comprou produtos da empresa*/
SELECT DISTINCT 
TC.CPF AS CPF_DO_CADASTRO, 
TC.NOME AS NOME_DO_CLIENTE, 
NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC 
LEFT JOIN NOTAS_FISCAIS NF 
ON TC.CPF = NF.CPF 
WHERE NF.CPF IS NULL;
/**/

/*comando UNION*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES;

SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
/*o UNION junta as duas consultas e ainda aplica o DISTINCT por padr�o*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES 
UNION 
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
/*com o ALL junta as duas consultas sem aplicar o DISTINCT*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES 
UNION ALL 
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
/*neste caso, com ou sem o ALL ainda ser� trago todas as 16 linhas (12 clientes e 4 vendedores)
por conta da nova coluna ORIGEM	que separa clientes de vendedores*/
SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES 
UNION ALL 
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;
/**/

/*subconsultas: comandos com subQuery ultizando o IN*/
/*as duas consultas s�o feitas para trazer os bairros dos vendedores*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
/*e depois trazer os clientes que tem escrit�rios nos mesmo bairros dos vendedores*/
SELECT * FROM TABELA_DE_CLIENTES 
WHERE BAIRRO IN ('Cobacabana', 'Jardins', 'Santo Amaro', 'Tijuca');
/*h� duas consultas feitas acima podem ser feitas em uma �nica consulta conforme abaixo*/
SELECT * FROM TABELA_DE_CLIENTES 
WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES);

/*exerc�cio*/
SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, TP.SABOR,
SUM(INF.QUANTIDADE) AS QUANTIDADE 
FROM ITENS_NOTAS_FISCAIS INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, TP.SABOR 
HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;

/*mais sobre subconsultas (subQuery): as duas consultas abaixo � a mesma coisa*/
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO 
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM 
HAVING AVG(PRECO_DE_LISTA) <= 10;
/*a difer�n�a � que uma utilizar o HAVING, e a outra usa uma subQuery dentro da query*/
SELECT MEDIA_EMBALAGENS.EMBALAGEM, MEDIA_EMBALAGENS.PRECO_MEDIO FROM (
    SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO 
    FROM TABELA_DE_PRODUTOS 
    GROUP BY EMBALAGEM
) MEDIA_EMBALAGENS 
WHERE MEDIA_EMBALAGENS.PRECO_MEDIO <= 10;

/*sobre Views (vis�s ou exibi��es), � poss�vel ver as Views embaixo de Tables no menu esquerdo (ao lado)*/
/*criando tabelas 'virtuais' atrav�s das tav=belas existentes e armazendo ela em 'Views'.
De prefer�ncia, executar esse comando na primeira linha da query (por isso o erro em vermelho), 
mas fiz aqui pra seguir a ordem das aulas*/
CREATE VIEW MEDIA_EMBALAGENS AS 
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO 
FROM TABELA_DE_PRODUTOS 
GROUP BY EMBALAGEM;
/*e assim, � poss�vel executar os mesmo comandos nesta nova tabelas igual nas tabelas j� existente*/
SELECT EMBALAGEM, PRECO_MEDIO FROM MEDIA_EMBALAGENS 
WHERE PRECO_MEDIO <= 10;
/**/

/*
FUN��ES
olhar na documenta��o da microsoft SQL para ver os tipos de fun��es e o que elas fazem,
para convers�o de data para texto, buscar pelas 'mascaras' para fazer essa convers�o no formato adequado.
ver tabela de convers�o CAST E CONVERT na documenta��o
*/

/*EXERC�CIO
o usu�rio pede um relat�rio, que ele quer ver as vendas anuais, ou seja, 
as vendas dentro do ano, dos meus sucos de frutas por sabor (por exemplo, ano 2015),
organizar do mais vendido pro mesno vendido, e deixar em porcentagem as venda de cada 
cliente naquele ano*/
SELECT VS.SABOR, VS.ANO, VS.VENDA_ANO, 
    ROUND((CONVERT(FLOAT, VS.VENDA_ANO) / CONVERT(FLOAT, VA.VENDA_TOTAL_ANO)) * 100, 2) AS PERCENTUAL 
FROM (
    SELECT TP.SABOR, 
    YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_ANO 
    FROM TABELA_DE_PRODUTOS TP 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
    INNER JOIN NOTAS_FISCAIS NF 
    ON INF.NUMERO = NF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA) 
) VS 
INNER JOIN (
    SELECT YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO 
    FROM NOTAS_FISCAIS NF 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON NF.NUMERO = INF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY YEAR(NF.DATA_VENDA)
) VA 
ON VS.ANO = VA.ANO 
ORDER BY VS.VENDA_ANO DESC;