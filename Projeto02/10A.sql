-- VIEW p/ ver total de aluno por curso:

CREATE VIEW alunos_por_curso_teste AS
SELECT 
    ies.Nome AS instituicao,
    curso.nome AS curso,
    COUNT(discente.CPF) AS total_alunos
FROM 
    ies
JOIN 
    possui ON ies.codigoEMECIES = possui.codigoEMecIES
JOIN 
    curso ON possui.codigoEMecCurso = curso.codigoEMacCurso
JOIN 
    discente ON curso.codigoEMacCurso = discente.codigoEMecCurso
GROUP BY 
    ies.Nome, curso.nome;



-- Teste p/ VIEW 

SELECT *
FROM alunos_por_curso_teste
WHERE total_alunos > 200;



-- VIEW p/ ver docentes mais bem pagos
    
CREATE VIEW docentes_mais_bem_pagos AS
SELECT 
    t.codigoEMecIES AS ies_codigo,
    i.nome AS ies_nome,
    d.nome AS docente_nome,
    t.salário AS salario
FROM 
    trabalha t
JOIN 
    docente d ON t.cpf = d.cpf
JOIN 
    ies i ON t.codigoEMecIES = i.codigoEMECIES
WHERE 
    t.salário = (
        SELECT MAX(t2.salário)
        FROM trabalha t2
        WHERE t2.codigoEMecIES = t.codigoEMecIES
    );



--Teste p/ VIEW

SELECT * 
FROM docentes_acima_media_salarial;


