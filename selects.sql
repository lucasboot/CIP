/* SELECTS */

/* Lista de consultas feitas pelos veterinários OK*/
SELECT V.crmv, V.regiao, C.data_consulta, C.motivo, C.diagnostico
    FROM  Consulta as C
    JOIN  Veterinario as V  
    ON C.codigo_Veterinario = V.codigo_Usuario;

/*Lista de vacinas que os pets tomaram OK*/
SELECT P.nome, A.codigo_Vacina, A.data_ap, A.data_prox
    FROM Pet as P
    JOIN Aplicar as A
    ON P.codigo_identificador = A.codigo_Pet;

/*Lista de donos de pet e seus pets OK*/ 
SELECT U.nome, P.nome 
    FROM Dono_de_Pet as D,
        Pet as P,
        USUARIO as U
    WHERE D.codigo_Usuario = P.codigo_Dono_de_Pet AND U.CPF = D.codigo_Usuario;



/*Lista de pets que um veterinário realizou uma consulta e as vacinas do pet*/
SELECT 
    FROM
    

/*Lista de pets que nasceram depois de 2010 OK*/
SELECT P.nome, P.idade, P.raca
    FROM Pet as P
    WHERE P.nascimento BETWEEN '2010-01-01' AND '2021-09-16'
    ORDER BY P.nome ASC;
