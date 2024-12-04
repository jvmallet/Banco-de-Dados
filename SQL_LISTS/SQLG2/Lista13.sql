--1A

CREATE VIEW Voitures_2020 (Codigo, Fabricante, Modelo, Ano, Pais, Preco_tabela) as
SELECT Codigo, Fabricante, Modelo, Ano, Pais, Preco_tabela
FROM Automoveis
WHERE Ano = '20'
AND Pais = 'Franca'


--1B *

CREATE VIEW Neg_ok (Comprador, Revenda, Codigo, Ano, Data, Preco) as
SELECT CPF, CGC, Codigo, Ano, Data, Preco
FROM Negocios N1
WHERE NOT EXISTS
(
SELECT *
FROM Negocios N2
WHERE N1.CGC = N2.CGC
AND N1.Codigo = N2.Codigo
AND N1.Ano = N2.Ano
AND N1.Preco < 0.9 * N2.Preco
AND N1.Preco > 1.1*N2.Preco
) 



--2

SELECT *
From Voitures_2020

DELETE FROM automoveis
WHERE ano = '20' AND codigo = 1314;
SELECT *
FROM Voitures_2020
WHERE codigo = 1314;
INSERT INTO automoveis VALUES (1315, '20', 'Renault', 'Duster' , 54337.00, 'Franca');
SELECT *
FROM Voitures_2020
WHERE codigo = 1315;



--3 


CREATE OR REPLACE VIEW Voitures_2020 (Codigo, Fabricante, Modelo, Ano, Pais, Preco_tabela)
as
(
SELECT Codigo, Fabricante, Modelo, Ano, Pais, Preco_tabela
FROM Automoveis
WHERE Ano = '20'
AND Pais = 'Franca'
)
WITH CHECK OPTION;
INSERT INTO automoveis VALUES (1306, '20', 'Suzuki', 'Jimmy', 66288.00, 'Japao');
INSERT INTO automoveis VALUES (1308, '20', 'Peugeot', '2008', 65817.00, 'Franca');
INSERT INTO Voitures_2020 VALUES (1309, 'Peugeot', '3008', '20', 'Franca', 160365.00);
SELECT * FROM Voitures_2020;
UPDATE Voitures_2020
SET modelo = '208'
WHERE modelo = '3008';
SELECT * FROM Voitures_2020;
DELETE FROM Voitures_2020
WHERE codigo = 1309;
SELECT * FROM Voitures_2020;
INSERT INTO Voitures_2020 VALUES (1307, 'Ford', 'Edge', '20', 'EUA', 270972.00);
UPDATE Voitures_2020
SET pais = 'Japao'
WHERE pais = 'Franca';
DELETE FROM Voitures_2020
WHERE pais = 'Japao';
