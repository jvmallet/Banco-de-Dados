--1 
select distinct bar
from vendem
where cerveja in(select cerveja from origem
where origem.pais = 'Alemanha') 
AND
cerveja in(select cerveja from gostam where gostam.pessoa = 'Joao')


--2 *

SELECT Cerveja
FROM Gostam
WHERE Pessoa = 'Maria'

INTERSECT

SELECT Cerveja
FROM Gostam
WHERE Pessoa = 'Joao';

--3

select pessoa
from gostam
where cerveja in(select cerveja from origem where pais = 'Belgica')
and
cerveja in (select cerveja from vendem where bar = 'Deposito'
group by cerveja having count(distinct bar) = 1)


-- Comentario sobre o final do ex 3

-- O GROUP BY agrupa as linhas de uma tabela que têm o mesmo valor em uma coluna específica. No nosso caso, estamos agrupando por Cerveja. 

-- Isso significa que, para cada cerveja, ele agrupa todas as ocorrências, independentemente de qual bar a vende.

-- O COUNT(DISTINCT Bar) conta quantos bares diferentes vendem cada cerveja. Assim, para cada cerveja, 
-- ele verifica em quantos bares distintos ela é vendida. Se o resultado for 1, isso significa que essa cerveja é vendida em apenas um bar.


-- O HAVING é como um WHERE, mas ele é usado após o agrupamento. No nosso caso, estamos dizendo:

-- HAVING COUNT(DISTINCT Bar) = 1: Após agrupar as cervejas, queremos manter apenas aquelas que são vendidas em exatamente um bar.



--4 *** -> Dificil
SELECT DISTINCT nome, ident, sexo
FROM empregado
WHERE ident IN
(SELECT identemp
FROM trabalhano
WHERE identemp IN
(SELECT identemp
FROM trabalhano
WHERE projnum IN
(SELECT projnum
FROM trabalhano
WHERE identemp IN
(SELECT ident
FROM empregado
WHERE nome = 'Johnny Depp')))
AND projnum IN
(SELECT num
FROM projeto
WHERE depnum IN
(SELECT num
FROM departamento
WHERE nome = 'Financeiro')))
AND nome <> 'Johnny Depp' -- para o próprio Depp não aparecer!



--5 

SELECT *
FROM consumidores
WHERE cpf IN
(
(SELECT cpf
FROM negocios
WHERE ano = '95')
EXCEPT
(SELECT cpf
FROM negocios
WHERE ano <> '95')
)


--6

select filho
from paifilho
where pai = 'Mario'


--7

select filho
from paifilho
where pai in( select filho from paifilho where pai = 'Mario')


--8

--Nao da pra fazer