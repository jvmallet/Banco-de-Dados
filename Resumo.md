# Resumo Geral 


## SQL DML PT1
Em sql nao se usa '==' e sim '='.

Se quiser achar uma substring dentro de uma palavra pode usar:

'%PALAVRA%'

Pode usar AND e OR

Pode usar ORDER BY para ordenar:

Example: order by loan_number desc


esc for descending order or asc for
ascending order


ascending é o padrao


Pode usar union, intersect, and except to eliminates duplicates; to retain all duplicates use the corresponding multiset versions union all, intersect all and except all.

Suppose a tuple occurs m times in r and n times in s,
then, it occurs:
– m + n times in r union all s
– min(m,n) times in r intersect all s
– max(0, m – n) times in r except all s

Find all customers with a loan, an account, or both:

(select customer_name from depositor)
union
(select customer_name from borrower)

Find all customers with both a loan and an account:

(select customer_name from depositor)
intersect
(select customer_name from borrower)

Find all customers with an account but no loan:

(select customer_name from depositor)
except
(select customer_name from borrower)


Nao usar ' = Null' e sim IS NULL
Exemplo:

WHERE superIdent IS Null

se fosse

WHERE superIdent = Null -> está errado


O GROUP BY agrupa as linhas de uma tabela que têm o mesmo valor em uma coluna específica. No nosso caso, estamos agrupando por Cerveja. Isso significa que, para cada cerveja, ele agrupa todas as ocorrências, independentemente de qual bar a vende.


O COUNT(DISTINCT Bar) conta quantos bares diferentes vendem cada cerveja. Assim, para cada cerveja, ele verifica em quantos bares distintos ela é vendida. Se o resultado for 1, isso significa que essa cerveja é vendida em apenas um bar.

O HAVING é como um WHERE, mas ele é usado após o agrupamento. No nosso caso, estamos dizendo:

HAVING COUNT(DISTINCT Bar) = 1: Após agrupar as cervejas, queremos manter apenas aquelas que são vendidas em exatamente um bar.




O operador <> é o mesmo que not
ex:
SELECT *
FROM Empregado
WHERE Nome <> 'Johnny Depp';

Essa consulta vai retornar todos os empregados cujo nome não é "Johnny Depp". O <> está verificando a desigualdade, ou seja, se o valor da coluna Nome é diferente de 'Johnny Depp'.

----



## SQL DDL

O Comando para criar tabelas 