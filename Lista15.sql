--1 

SELECT c.cpf, c.nome, c.sobrenome,
 COUNT(*) AS NumCarros, SUM(preco) AS TotalPago
FROM consumidores c, negocios n
WHERE c.cpf = n.cpf
GROUP BY c.cpf
HAVING COUNT(*)> 1;


--2

SELECT cgc, nome
FROM revendedoras
WHERE cgc IN
(SELECT cgc
FROM garagens
GROUP BY cgc
HAVING COUNT(DISTINCT codigo)< 4);


--3

SELECT p.num, p.nome, count(*)
FROM projeto p, trabalhano t
WHERE p.num = t.projnum
GROUP BY p.num, p.nome
HAVING count(*) > 2;


--4 

SELECT d.num, d.nome, count(*)
FROM departamento d, empregado e
WHERE e.depnum = d.num and sal > 2000
and e.depnum in
(SELECT depnum
FROM empregado
GROUP BY depnum
HAVING count(*) > 2)
GROUP BY d.num, d.nome;