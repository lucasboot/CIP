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
    foto_pet VARCHAR(200),
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
    tipo VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Aplicar(
    codigo_Pet INT,
    codigo_Vacina VARCHAR(100),
    data_ap DATE,
    data_prox DATE,
    FOREIGN KEY (codigo_Pet) REFERENCES Pet(codigo_identificador),
    FOREIGN KEY (codigo_Vacina) REFERENCES Vacina(nome)
);


CREATE TABLE IF NOT EXISTS Consulta(
    data_consulta DATE,
    motivo VARCHAR(100),
    diagnostico VARCHAR(1000),
    tratamento VARCHAR(1000),
    codigo_Pet INT,
    codigo_Veterinario INT,
    FOREIGN KEY (codigo_Pet) REFERENCES Pet(codigo_identificador),
    FOREIGN KEY (codigo_Veterinario) REFERENCES Veterinario(codigo_Usuario)
);

