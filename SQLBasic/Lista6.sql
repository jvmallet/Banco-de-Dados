-- 1

SELECT Distinct fabricante,pais
FROM automoveis




--2
SELECT Distinct num,depnum
FROM projeto


--3

SELECT Distinct sal
FROM empregado


--4

SELECT Nome,Sobrenome
FROM consumidores
WHERE cpf not in (SELECT cpf FROM negocios)



--5 

SELECT Nome
FROM empregado
WHERE Ident not in(SELECT IdentEmp from dependente)


--6
SELECT nome
FROM empregado
WHERE endereco = 'São Paulo' OR endereco like '%São%'


--7 
SELECT Ident, Nome
FROM EMPREGADO
WHERE SuperIdent IS NULL


--8
SELECT Local
FROM DEPLOC

UNION

SELECT Local
FROM PROJETO; 

-- Comentario sobre a questao 8: 

-- Quando você usa o UNION, ele faz o seguinte:

-- Seleciona todos os locais da tabela DEPLOC.
-- Seleciona todos os locais da tabela PROJETO.

-- Combina os resultados, removendo duplicatas automaticamente. 

-- Ou seja, se um local aparecer tanto na tabela DEPLOC quanto na tabela PROJETO,
-- ele só vai aparecer uma vez no resultado final.

-- Portanto, o UNION serve para garantir que você não tenha duplicatas e que todos os locais,
-- sejam eles de departamentos ou de projetos, sejam listados sem repetições.



