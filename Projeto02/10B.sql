--View com Check Option

CREATE VIEW cursos_com_min_alunos AS
SELECT 
    codigoEMecIES, codigoEMecCurso, quantidade
FROM 
    POSSUI
WHERE 
    quantidade >= 20
WITH CHECK OPTION;


--Atualização com sucesso

UPDATE cursos_com_min_alunos
SET quantidade = 30
WHERE codigoEMecIES = 1 AND codigoEMecCurso = 1318;


--Atualização com fracasso

UPDATE cursos_com_min_alunos
SET quantidade = 10
WHERE codigoEMecIES = 1 AND codigoEMecCurso = 1318;
