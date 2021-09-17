/* SELECTS */

/* Lista de consultas feitas pelos veterinários depois de 2019 OK*/
SELECT V.crmv, V.regiao, C.data_consulta, C.motivo, C.diagnostico
    FROM  Consulta as C
    JOIN  Veterinario as V  
    ON C.codigo_Veterinario = V.codigo_Usuario
    HAVING C.data_consulta BETWEEN '2019-01-01' AND '2021-09-16';

/*Lista de vacinas que os pets tomaram OK*/
SELECT P.nome, A.codigo_Vacina, A.data_ap, A.data_prox
    FROM Pet as P
    JOIN Aplicar as A
    ON P.codigo_identificador = A.codigo_Pet;

/*Lista de donos de pet e seus pets OK*/ 
SELECT U.nome, P.nome 
    FROM Dono_de_Pet as D,
        Pet as P,
        Usuario as U
    WHERE D.codigo_Usuario = P.codigo_Dono_de_Pet AND U.CPF = D.codigo_Usuario;


/*Lista de pets que os veterinários realizaram uma consulta e os que ainda não realizaram consulta*/
SELECT DISTINCT U.nome, P.nome 
    FROM Pet as P
    LEFT JOIN (Veterinario as V,
          Usuario as U, Consulta C)
    ON V.codigo_Usuario = U.CPF AND V.codigo_Usuario = C.codigo_Veterinario AND C.codigo_Pet = P.codigo_identificador
    ORDER BY U.nome ASC;

/*Lista de pets que nasceram depois de 2010 OK*/
SELECT P.nome, P.idade, P.raca
    FROM Pet as P
    WHERE P.nascimento BETWEEN '2010-01-01' AND '2021-09-16'
    ORDER BY P.nome ASC;
