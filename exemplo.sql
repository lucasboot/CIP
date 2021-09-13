SHOW DATABASES;
CREATE DATABASE UNIVERSIDADE;
USE UNIVERSIDADE;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS FUNCIONARIO(
	cpf INT PRIMARY KEY,
	p_nome VARCHAR(50) NOT NULL,
	m_inicial CHAR,
	u_nome VARCHAR(50) NOT NULL,
	dt_nasc DATE NOT NULL,
	endereco VARCHAR(100),
	sexo CHAR NOT NULL CHECK(sexo='M' OR sexo='F'),
	salario FLOAT,
	cpf_sup INT, 
    d_numero SMALLINT NOT NULL, 
	FOREIGN KEY (cpf_sup) REFERENCES FUNCIONARIO(cpf) 
);

CREATE TABLE IF NOT EXISTS DEPARTAMENTO(
    d_numero SMALLINT PRIMARY KEY,
    d_nome VARCHAR(100) NOT NULL,
    dt_inicio_gerente DATE,
    f_cpf_gerente INT,
    FOREIGN KEY (f_cpf_gerente) REFERENCES FUNCIONARIO(cpf)
);

ALTER TABLE FUNCIONARIO ADD CONSTRAINT FOREIGN KEY (d_numero) REFERENCES DEPARTAMENTO(d_numero);

CREATE TABLE IF NOT EXISTS LOCALIZACAO_DEP(
    d_numero SMALLINT,
    FOREIGN KEY (d_numero) REFERENCES DEPARTAMENTO(d_numero),
    d_local VARCHAR(100),
    PRIMARY KEY(d_numero, d_local)
);

CREATE TABLE IF NOT EXISTS PROJETO(
    p_numero INT PRIMARY KEY,
    p_nome VARCHAR(100),
    p_local  VARCHAR(100),
    d_numero SMALLINT,
    FOREIGN KEY (d_numero) REFERENCES DEPARTAMENTO(d_numero)
);

CREATE TABLE IF NOT EXISTS TRABALHA_EM(
    f_cpf INT,
    FOREIGN KEY (f_cpf) REFERENCES FUNCIONARIO(cpf), 
    p_numero INT,
    FOREIGN KEY (p_numero) REFERENCES PROJETO(p_numero),
    horas SMALLINT,
    PRIMARY KEY(f_cpf,p_numero)
);

CREATE TABLE IF NOT EXISTS DEPENDENTE(
    f_cpf INT,
    FOREIGN KEY (f_cpf) REFERENCES FUNCIONARIO(cpf), 
    nome VARCHAR(100),
    sexo CHAR NOT NULL CHECK(sexo='M' OR sexo="F"),
    dt_nasc DATE NOT NULL,
    parentesco VARCHAR(100),
    PRIMARY KEY(f_cpf,nome)
);


INSERT INTO DEPARTAMENTO(d_numero,d_nome) 
    VALUES(1,'Departamento de Engenharia de Computação e Automação');
INSERT INTO DEPARTAMENTO(d_numero,d_nome) 
    VALUES(2,'Departamento de Informática e Matemática Aplicada');


INSERT INTO FUNCIONARIO(cpf,p_nome,m_inicial,u_nome,dt_nasc,endereco,sexo,d_numero) 
    VALUES(1,'Eduardo','L','Falcão','1989-08-04','Rua X, Num Y, Bairro Z, João Pessoa','M',1);
INSERT INTO  FUNCIONARIO(cpf,p_nome,u_nome,dt_nasc,sexo,d_numero)
    VALUES(2,'Maria','Alice','1990-12-24','F',1);
INSERT INTO FUNCIONARIO(cpf,p_nome,u_nome,dt_nasc,sexo,d_numero) 
    VALUES(3,'Alex','Soares','2000-11-14','M',2);


/* como as colunas não foram especificadas, é preciso passar a mesma quantidade de 
 * valores que a tabela tem, e na mesma ordem que as colunas aparecem na tabela
 */    
INSERT INTO FUNCIONARIO
    VALUES(4,'Jose',NULL,'Mario','1970-12-24',NULL,'M',NULL,NULL,2);
/* falha devido a restrição de chave primária */
INSERT INTO FUNCIONARIO(cpf,p_nome,u_nome,dt_nasc,sexo,d_numero) 
    VALUES(4,'Alex','Soares','2000-11-14','M',3);


UPDATE FUNCIONARIO
    SET p_nome='Bartolomeu', u_nome='Silva' 
    WHERE cpf=4;


SELECT * FROM FUNCIONARIO;
SELECT * FROM FUNCIONARIO WHERE sexo='M';
SELECT p_nome, u_nome FROM FUNCIONARIO WHERE sexo='M';
SELECT p_nome, u_nome FROM FUNCIONARIO WHERE sexo='M' AND d_numero=1;


SELECT FUNCIONARIO.p_nome, FUNCIONARIO.u_nome, DEPARTAMENTO.d_nome 
    FROM FUNCIONARIO, DEPARTAMENTO 
    WHERE sexo='M';
SELECT FUNCIONARIO.p_nome, FUNCIONARIO.u_nome, DEPARTAMENTO.d_nome 
    FROM FUNCIONARIO, DEPARTAMENTO 
    WHERE sexo='M' AND FUNCIONARIO.d_numero=DEPARTAMENTO.d_numero;
SELECT FUNCIONARIO.p_nome, FUNCIONARIO.u_nome, DEPARTAMENTO.d_nome 
    FROM FUNCIONARIO, DEPARTAMENTO 
    WHERE sexo='M' AND FUNCIONARIO.d_numero=DEPARTAMENTO.d_numero AND DEPARTAMENTO.d_numero=1;


INSERT INTO PROJETO(p_numero,p_nome,p_local,d_numero) 
    VALUES(1,'Segurança em IoT','Natal',1);
INSERT INTO PROJETO(p_numero,p_nome,p_local,d_numero) 
    VALUES(2,'Robótica Educacional','Natal',1);
INSERT INTO PROJETO(p_numero,p_nome,p_local,d_numero) 
    VALUES(3,'Blockchain','Natal',2);


/*
    Para cada projeto localizado em ‘Natal’, liste o nome do projeto, 
    o nome do departamento que o controla, e o nome, endereço e data de
    nascimento do gerente desse departamento.
*/

UPDATE DEPARTAMENTO
    SET f_cpf_gerente=1
    WHERE d_numero=1;
UPDATE DEPARTAMENTO
    SET f_cpf_gerente=2
    WHERE d_numero=2;

SELECT PROJETO.p_nome, PROJETO.p_local, DEPARTAMENTO.d_nome, FUNCIONARIO.p_nome, 
       FUNCIONARIO.u_nome, FUNCIONARIO.endereco, FUNCIONARIO.dt_nasc 
       FROM PROJETO, DEPARTAMENTO, FUNCIONARIO 
       WHERE PROJETO.p_local='Natal' AND PROJETO.d_numero=DEPARTAMENTO.d_numero AND 
             DEPARTAMENTO.f_cpf_gerente=FUNCIONARIO.cpf;


/* Para cada funcionário, recupere seu nome e o nome do seu supervisor */

UPDATE FUNCIONARIO
    SET cpf_sup=1
    WHERE cpf=2;
UPDATE FUNCIONARIO
    SET cpf_sup=2
    WHERE cpf=3;
UPDATE FUNCIONARIO
    SET cpf_sup=2
    WHERE cpf=4;

SELECT F.p_nome, F.u_nome, F.cpf, F.cpf_sup, 
       S.p_nome, S.u_nome, S.cpf, S.cpf_sup
    FROM FUNCIONARIO as F, FUNCIONARIO as S;

SELECT F.p_nome, F.u_nome, S.p_nome, S.u_nome 
    FROM FUNCIONARIO as F, FUNCIONARIO as S
    WHERE F.cpf_sup=S.cpf;


/* Recupere o salário de todos os funcionários */

UPDATE FUNCIONARIO
    SET salario=5000
    WHERE cpf=1;
UPDATE FUNCIONARIO
    SET salario=8000
    WHERE cpf=2;
UPDATE FUNCIONARIO
    SET salario=3000
    WHERE cpf=3;
UPDATE FUNCIONARIO
    SET salario=5000
    WHERE cpf=4;

SELECT ALL salario FROM FUNCIONARIO;
SELECT DISTINCT salario FROM FUNCIONARIO;

/* Faça uma lista de números de projetos que envolvem um funcionário
 * cujo sobrenome é 'Silva'. O envolvimento do funcionário pode ser
 * como trabalhador ou como gerente do departamento que controla o 
 * projeto. 
 */

/* alocando Bartolomeu Silva (cpf: 4) para Projeto 1*/
INSERT INTO TRABALHA_EM(f_cpf,p_numero,horas) 
    VALUES(4,1,20);
/* alocando Maria Silva (cpf: 5) para Projeto 1*/
INSERT INTO FUNCIONARIO(cpf,p_nome,u_nome,dt_nasc,sexo,d_numero,salario) 
    VALUES(5,'Maria','Silva','1980-12-10','F',2,9000);
INSERT INTO TRABALHA_EM(f_cpf,p_numero,horas) 
    VALUES(5,1,40);

/* Faça uma lista de números de projetos que envolvem um funcionário
 * cujo sobrenome é 'Silva'. 
 */
SELECT PROJETO.p_nome
    FROM FUNCIONARIO, TRABALHA_EM, PROJETO 
    WHERE PROJETO.p_numero=TRABALHA_EM.p_numero AND 
          TRABALHA_EM.f_cpf=FUNCIONARIO.cpf;

SELECT DISTINCT PROJETO.p_nome
    FROM FUNCIONARIO, TRABALHA_EM, PROJETO 
    WHERE PROJETO.p_numero=TRABALHA_EM.p_numero AND 
          TRABALHA_EM.f_cpf=FUNCIONARIO.cpf;

/* alocando Joana Silva (cpf: 6) para Projeto 2 como gerente do departamento*/
INSERT INTO FUNCIONARIO(cpf,p_nome,u_nome,dt_nasc,sexo,d_numero,salario) 
    VALUES(6,'Joana','Silva','1985-02-10','F',2,13000);
INSERT INTO TRABALHA_EM(f_cpf,p_numero,horas) 
    VALUES(6,3,40);
UPDATE DEPARTAMENTO
    SET f_cpf_gerente=6
    WHERE D_NUMERO=2;
/* O envolvimento do funcionário pode ser como trabalhador ou 
 * como gerente do departamento que controla o projeto. 
 */
SELECT DISTINCT PROJETO.p_nome
    FROM FUNCIONARIO, TRABALHA_EM, PROJETO, DEPARTAMENTO 
    WHERE PROJETO.p_numero=TRABALHA_EM.p_numero AND 
          TRABALHA_EM.f_cpf=FUNCIONARIO.cpf AND
          DEPARTAMENTO.f_cpf_gerente=FUNCIONARIO.cpf;

SELECT DISTINCT *
    FROM FUNCIONARIO, TRABALHA_EM, PROJETO, DEPARTAMENTO 
    WHERE PROJETO.p_numero=TRABALHA_EM.p_numero AND 
          TRABALHA_EM.f_cpf=FUNCIONARIO.cpf AND
          DEPARTAMENTO.f_cpf_gerente=FUNCIONARIO.cpf;

/* Faça uma lista de números de projetos que envolvem um funcionário
 * cujo sobrenome é 'Silva'. O envolvimento do funcionário pode ser
 * como trabalhador ou como gerente do departamento que controla o 
 * projeto. 
 */

/* Para fazer UNION precisamos da mesma quantidade de colunas e 
 * mesma sequência de tipos.
 */
(SELECT DISTINCT PROJETO.p_nome
    FROM FUNCIONARIO, TRABALHA_EM, PROJETO 
    WHERE PROJETO.p_numero=TRABALHA_EM.p_numero AND 
          TRABALHA_EM.f_cpf=FUNCIONARIO.cpf)
UNION 
(SELECT DISTINCT PROJETO.p_nome
    FROM FUNCIONARIO, TRABALHA_EM, PROJETO, DEPARTAMENTO 
    WHERE PROJETO.p_numero=TRABALHA_EM.p_numero AND 
          TRABALHA_EM.f_cpf=FUNCIONARIO.cpf AND
          DEPARTAMENTO.f_cpf_gerente=FUNCIONARIO.cpf);

/* Recupere todos os funcionários cujos endereços são em JP */

UPDATE FUNCIONARIO
    SET endereco='Rua X, Num Y, Bairro Z, JP'
    WHERE cpf=1;
UPDATE FUNCIONARIO
    SET endereco='Rua X, Num Y, Bairro Z, Natal'
    WHERE cpf=2;
UPDATE FUNCIONARIO
    SET endereco='Rua X, Num Y, Bairro Z, CG'
    WHERE cpf=3;
UPDATE FUNCIONARIO
    SET endereco='Rua X, Num Y, Bairro Z, JP'
    WHERE cpf=4;
UPDATE FUNCIONARIO
    SET endereco='Rua X, Num Y, Bairro Z, Natal'
    WHERE cpf=5;
UPDATE FUNCIONARIO
    SET endereco='Rua X, Num Y, Bairro Z, CG'
    WHERE cpf=6;

SELECT p_nome, u_nome
    FROM FUNCIONARIO
    WHERE endereco LIKE '%JP%';

/* Recupere todos os funcionários que nasceram na década de 80 */

SELECT p_nome, u_nome
    FROM FUNCIONARIO
    WHERE dt_nasc LIKE '198_-__-__';


/* Recupere a lista de funcionários e de projetos nos quais eles
 * trabalham, ordenada por departamento. Dentro de departamento,
 * ordene por nome do funcionário.
 */

SELECT D.d_nome, F.p_nome, P.p_nome
   FROM DEPARTAMENTO AS D, 
        FUNCIONARIO AS F, 
        PROJETO AS P, 
        TRABALHA_EM AS T 
   WHERE P.p_numero=T.p_numero AND 
         T.f_cpf=F.cpf AND
         F.d_numero = D.d_numero
   ORDER BY D.d_nome ASC, F.p_nome ASC;

/* Recupere o nome dos funcionários que não possuem supervisores */
SELECT p_nome, m_inicial, u_nome
    FROM FUNCIONARIO
    WHERE cpf_sup IS NULL;

/* Recupere o cpf, primeiro nome, e último nome, e nome do departamento 
 * que os funcionários trabalham 
 */
SELECT F.cpf, F.p_nome, F.u_nome, D.d_nome 
    FROM FUNCIONARIO AS F, DEPARTAMENTO AS D 
    WHERE F.d_numero=D.d_numero;

SELECT F.cpf, F.p_nome, F.u_nome, D.d_nome 
    FROM FUNCIONARIO AS F 
    JOIN DEPARTAMENTO AS D 
    ON F.d_numero=D.d_numero;

SELECT F.cpf, F.p_nome, F.u_nome, D.d_nome 
    FROM FUNCIONARIO AS F 
    RIGHT JOIN DEPARTAMENTO AS D 
    ON F.d_numero=D.d_numero;

/* Para cada funcionário, recupere seu nome e o nome do seu supervisor */

SELECT F.p_nome, F.u_nome, S.p_nome, S.u_nome 
    FROM FUNCIONARIO as F, FUNCIONARIO as S
    WHERE F.cpf_sup=S.cpf;

SELECT F.p_nome, F.u_nome, S.p_nome, S.u_nome 
    FROM FUNCIONARIO AS F 
    JOIN FUNCIONARIO AS s 
    ON F.cpf_sup=S.cpf;

SELECT F.p_nome, F.u_nome, S.p_nome, S.u_nome 
    FROM FUNCIONARIO AS F 
    RIGHT JOIN FUNCIONARIO AS s 
    ON F.cpf_sup=S.cpf;

/* Exemplo com funções agregadas */
SELECT SUM(salario), MAX(salario), MIN(salario), AVG(salario)
    FROM FUNCIONARIO;

INSERT INTO DEPENDENTE(f_cpf,nome,sexo,dt_nasc,parentesco) 
    VALUES(1,'Aline','F','2015-12-12','filha');
INSERT INTO DEPENDENTE(f_cpf,nome,sexo,dt_nasc,parentesco) 
    VALUES(1,'Marcos','M','2018-10-18','filho');
INSERT INTO DEPENDENTE(f_cpf,nome,sexo,dt_nasc,parentesco) 
    VALUES(1,'José','M','2010-09-08','sobrinho');
INSERT INTO DEPENDENTE(f_cpf,nome,sexo,dt_nasc,parentesco) 
    VALUES(2,'Mariane','F','2019-09-23','filha');

SELECT p_nome
    FROM FUNCIONARIO
    WHERE(
        SELECT COUNT(*)
        FROM DEPENDENTE
        WHERE cpf=f_cpf) >= 2;

/* Exemplo com GROUP BY e HAVING */

SELECT F.cpf, F.p_nome, F.u_nome, F.salario, D.d_nome 
    FROM FUNCIONARIO AS F, DEPARTAMENTO AS D 
    WHERE F.d_numero=D.d_numero;

SELECT D.d_nome, COUNT(*)
    FROM DEPARTAMENTO AS D,
         FUNCIONARIO AS F
    WHERE D.d_numero=F.d_numero AND
          F.salario >= 5000
    GROUP BY D.d_nome;

SELECT D.d_nome, COUNT(*)
    FROM DEPARTAMENTO AS D,
         FUNCIONARIO AS F
    WHERE D.d_numero=F.d_numero AND
          F.salario >= 5000
    GROUP BY D.d_nome
    HAVING COUNT(*) > 2; 
    
