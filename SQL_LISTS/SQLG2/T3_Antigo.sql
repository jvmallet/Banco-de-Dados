--1

SELECT p.local, p.ano, sum(valor) as totalValor;
FROM premios p;
GROUP BY p.local, p.ano;
HAVING sum(valor) > 500.000;


--2 

SELECT nome
FROM Jogadores j 
WHERE nome not in
(select vencedor
    from Partida P1
    where not exists
    (select *
        from Partida P2
        where P1.local = P2.local
        and P1.ano = P2.ano
        and P2.perdedor = P1.vencedor)
)


--3 

CREATE VIEW Vencedores_Torneio AS
(
    SELECT vencedor, count(*) as totalVitorias
    FROM Partidas
    WHERE ano = '2023'
    AND local = 'Wimbledon'
    GROUP BY vencedor;
)


--3b

SELECT vencedor
FROM Vencedores_Torneio
WHERE totalVitorias in
(
    SELECT max(totalVitorias)
    FROM Vencedores_Torneio
)


--4

CREATE OR REPLACE VIEW
PREMIACAO_BB (PREMIADO, LOCAL, ANO, PATROCINADOR, VALOR_PREMIO)
AS
(SELECT JOGADOR, LOCAL, ANO, PATROCINADOR, VALOR
FROM PREMIOS
WHERE PATROCINADOR = ‘Banco do Brasil’
AND VALOR BETWEEN 300000 AND 500000)
WITH CHECK OPTION;

--4A
INSERT INTO PREMIACAO_BB (PREMIADO, LOCAL, ANO, PATROCINADOR, VALOR_PREMIO)VALUES('Nadal' , 'Wimbledon' , '2023', 'Banco do Brasil' , 400.000)

--4B
INSERT INTO PREMIACAO_BB (PREMIADO, LOCAL, ANO, PATROCINADOR, VALOR_PREMIO)VALUES('Nadal' , 'Wimbledon' , '2023', 'Citibank' , 400.000)



