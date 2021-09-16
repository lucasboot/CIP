/* SELECTS */

SELECT V. , C.data_consulta, C.motivo, C.diagnostico, C.tratamento
    FROM  Consulta as C
    JOIN  Veterinario as V  
    ON 