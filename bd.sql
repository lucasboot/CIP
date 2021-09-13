CREATE DATABASE CIP;
USE CIP;
SHOW TABLES;


CREATE TABLE IF NOT EXISTS USUARIO(
	CPF INT PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
    email VARCHAR(100),
    telefone INT,
    endereco VARCHAR(500),
    senha VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Dono_de_Pet(
    codigo_Usuario INT,
    FOREIGN KEY (codigo_Usuario) REFERENCES USUARIO(CPF)
);

CREATE TABLE IF NOT EXISTS Veterinario(
    crmv INT,
    regiao VARCHAR(3),
    codigo_Usuario INT,
    FOREIGN KEY (codigo_Usuario) REFERENCES USUARIO(CPF),
    PRIMARY KEY (crmv, regiao)
);

CREATE TABLE IF NOT EXISTS Pet(
    codigo_identificador INT PRIMARY KEY,
    nome VARCHAR(200),
    idade SMALLINT,
    altura FLOAT,
    foto_pet BLOB,
    nascimento DATE,
    falecimento DATE,
    raca VARCHAR(100),
    peso FLOAT,
    perdido Boolean,
    codigo_Dono_de_Pet INT,
    FOREIGN KEY (codigo_Dono_de_Pet) REFERENCES Dono_de_Pet(codigo_Usuario)
);

CREATE TABLE IF NOT EXISTS Vacina(
    nome VARCHAR(100) PRIMARY KEY,
    tipo VARCHAR(50),
    data_ap DATE,
    data_prox DATE
);

CREATE TABLE IF NOT EXISTS Aplicar(
    codigo_Pet INT,
    codigo_Vacina VARCHAR(100),
    FOREIGN KEY (codigo_Pet) REFERENCES Pet(codigo_identificador),
    FOREIGN KEY (codigo_Vacina) REFERENCES Vacina(nome)
);

/* INSERÇÕES */
INSERT INTO USUARIO VALUES(1, 'Lucas', 'eu@eu.com', 999, 'Rua Fonseca e Silva', '1234@');
INSERT INTO Dono_de_Pet VALUES(1);

INSERT INTO USUARIO VALUES(2, 'Mateus', 'eu2@eu2.com',666, 'Rua Fonseca ', '4321@');
INSERT INTO Veterinario VALUES(3999, '/RN', 2);

INSERT INTO Pet VALUES(123, 'Menta', 2, 0.5,LOAD_FILE('fotospet/1.jpg'),"2020-01-12", NULL, 'burgues', 2.5, 0, 1);

INSERT INTO Vacina VALUES('Nome estranho da vacina', 'Para raiva', "2021-12-25", NULL);
INSERT INTO Aplicar VALUES(123, 'Nome estranho da vacina');

UPDATE Pet 
    SET foto_pet = LOAD_FILE('C:/Users/varel\Documents/UFRN/2021.1/Banco de Dados/CIP/fotospet/1.jpg')
    WHERE codigo_identificador=123;
