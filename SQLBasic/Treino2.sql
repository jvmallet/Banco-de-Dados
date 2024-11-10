--1 

SELECT nome,pais
FROM pessoas
WHERE nome IN
    (SELECT nome from gostam
     WHERE cerveja IN
            (SELECT cerveja from Vendem
             where bar IN
                     (SELECT nome from bares
                        WHERE pais = 'Brasil')
                     INTERSECT
                     (SELECT marca from cerveja
                     WHERE pais = 'Mexico')
            )
    )


    





--2

SELECT cerveja
FROM Vendem
WHERE bar = 'Padoca'
    AND cerveja not IN
     (SELECT cerveja FROM gostam )

--3

SELECT nome
from bares
where nome not IN
    (select bar from Vendem)

UNION

SELECT nome
from pessoas
where nome not in
    (select nome from gostam)




--5

Definição de Conceitos


Super-Chave (SK):

Uma super-chave é qualquer conjunto de um ou mais atributos que podem ser usados para identificar de forma única uma tupla (linha) em uma tabela.
Em outras palavras, a super-chave contém atributos suficientes para garantir que não haverá duas linhas iguais na tabela. 
Podem existir várias super-chaves para uma tabela, algumas com atributos desnecessários.


Chave Candidata:

Uma chave candidata é uma super-chave mínima, ou seja, é uma super-chave que não tem nenhum atributo redundante. 
Em uma tabela, pode haver várias chaves candidatas, e elas são candidatas a serem escolhidas como chave primária.


Chave Primária (PK):

A chave primária é uma chave candidata escolhida para identificar de forma única cada linha de uma tabela.
Ela é única e não nula para cada tupla da relação, garantindo a integridade dos dados. 
Uma tabela pode ter várias chaves candidatas, mas apenas uma é escolhida como a chave primária.


Aplicação à Tabela "Pessoas"
Na tabela Pessoas do esquema "Bières", temos os seguintes atributos:


CPF: (Cadastro de Pessoa Física) – Número único para cada pessoa.
Nome
Cidade
País
Agora, aplicando os conceitos:

Super-Chaves (SK): Um conjunto de atributos que pode identificar de forma única uma pessoa. O CPF sozinho já é suficiente para isso, pois é único para cada pessoa no Brasil. Assim, o CPF é uma super-chave. Também poderíamos considerar combinações de atributos como (CPF, Nome), mas isso seria redundante.

Chave Candidata: O CPF é uma chave candidata, pois é o menor conjunto de atributos que garante a unicidade de cada linha na tabela "Pessoas".

Chave Primária (PK): A chave primária para a tabela Pessoas seria o CPF, já que ele identifica de forma única cada pessoa e não há necessidade de combinar outros atributos.

Portanto, a chave primária (PK) da tabela Pessoas no esquema "Bières" é o CPF.









