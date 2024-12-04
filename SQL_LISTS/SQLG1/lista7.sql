--1 
select distinct pessoa
from gostam
where cerveja in(
select cerveja from venda where bar = 'Padoca')


--2 

SELECT distinct pessoa
FROM gostam
WHERE pessoa NOT IN (
    SELECT pessoa
    FROM gostam
    WHERE cerveja NOT IN (
        SELECT cerveja
        FROM venda
        WHERE bar = 'Padoca'
    )


--3 
select distinct pessoa
from gostam
where cerveja in
(select cerveja from venda where bar = 'Padoca') 
and cerveja not in (
select cerveja from venda where bar!= 'Padoca') 