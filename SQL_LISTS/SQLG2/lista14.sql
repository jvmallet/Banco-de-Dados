--Explicacoes no Obsidian


--1

SELECT estado
From Automoveis A, Revendeoras R, Garagens G
WHERE A.Codigo = G.Codigo
And G.CGC = R.CGC
And A.Modelo = 'Elba'
And A.Fabricante = 'Fiat'


--2 

SELECT R1.*
FROM Revendedoras R1, Revendedoras R2
WHERE R1.Proprietario = R2.Proprietario 
AND R1.Proprietario <> R2.Proprietario



--3 

SELECT R.CGC,R.Nome
FROM Revendedoras R, Automoveis A, Negocios N
WHERE R.CGC = N.CGC
And N.Codigo = A.Codigo
AND A.ano = N.ano
AND A.pais IN ('Japao', 'EUA')
AND A.ano = '95'
AND N.preco > A.preco_tabela
AND N.preco <= (1.3*A.preco_tabela)



--4

SELECT Depe.Nome, Parentesco, Ident, Emp.Nome
FROM DEPENDENTE as Depe, EMPREGADO as Emp
WHERE IdentEmp = Ident 



--5

SELECT E.Ident as IdentSuper, E.NOME as NomeSuper, S.NOME as NomeSub, S.SEXO as SexoSub
FROM EMPREGADO E, EMPREGADO S
WHERE E.SUPERIDENT= S.IDENT



--6 

SELECT DISTINCT Nome
FROM EMPREGADO, TRABALHANO
WHERE Ident =  IdentEmp
AND HRS < 20    




--7

SELECT CGC, Nome, Cidade, Estado
FROM Revendedoras
WHERE CGC not in
    (SELECT G.CGC
    FROM Automoveis A, Garagens G
    WHERE A.Codigo = G.Codigo
    AND A.Pais = 'Franca')





--8 

SELECT fabricante, modelo, A1.ano
FROM Automoveis A1, Garagens G1
WHERE A1.Codigo = G1.Codigo
  AND Preco_tabela <= ALL (
      SELECT Preco_tabela
      FROM Automoveis A2, Garagens G2
      WHERE A2.Codigo = G2.Codigo
  );





