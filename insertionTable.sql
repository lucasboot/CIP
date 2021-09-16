
/* INSERÇÕES USUARIOs */
INSERT INTO USUARIO VALUES(1, 'Lucas', 'eu@eu.com', 111, 'Rua Fonseca e Silva', '1234@');
INSERT INTO USUARIO VALUES(2, 'Mateus', 'eu2@eu.com',222, 'Avenida Salgado Filho ', '4321@');
INSERT INTO USUARIO VALUES(3, 'Jamili', 'eu3@eu.com', 333, 'Avenida Bernardo Vieira', '3214@');
INSERT INTO USUARIO VALUES(4, 'Gustavo', 'eu4@eu2.com',444, 'Rua Presidente Bandeira', '432123@');
INSERT INTO USUARIO VALUES(5, 'Adson', 'eu5@eu.com', 555, 'Rua Fonseca e Silva', '123422@');
INSERT INTO USUARIO VALUES(6, 'Gabriel', 'eu6@eu.com',666, 'Avenida Rio Branco ', '432122@');
INSERT INTO USUARIO VALUES(7, 'William', 'eu7@eu.com', 777, 'Cidade Verde', '321422@');
INSERT INTO USUARIO VALUES(8, 'Thomas', 'eu8@eu2.com',888, 'Prudente de Morais', '432213@');

/* INSERÇÕES DONOS DE PET E VETERINÁRIOS */
INSERT INTO Veterinario VALUES(0001, '/RN', 2);
INSERT INTO Veterinario VALUES(0002, '/RN', 4);
INSERT INTO Veterinario VALUES(0003, '/RN', 6);
INSERT INTO Dono_de_Pet VALUES(1);
INSERT INTO Dono_de_Pet VALUES(3);
INSERT INTO Dono_de_Pet VALUES(5);
INSERT INTO Dono_de_Pet VALUES(7);
INSERT INTO Dono_de_Pet VALUES(8);

/* INSERÇÕES PETS */
INSERT INTO Pet VALUES(1, 'Menta', 2, 0.5,'facebook.com/image1','2020-01-12', NULL, 'Bulldog', 2.5, 0, 1);
INSERT INTO Pet VALUES(2, 'Flocos', 5, 0.4,'facebook.com/image2','2016-01-12', NULL, 'Poodle', 5.0, 0, 3);
INSERT INTO Pet VALUES(3, 'Pistache', 3, 1.1,'facebook.com/image3','2018-01-12', NULL, 'Husky Siberiano', 9.5, 0, 5);
INSERT INTO Pet VALUES(4, 'Amora', 3, 1.0,'facebook.com/image4','2018-01-12', NULL, 'Husky Siberiano', 9.0, 0, 5);
INSERT INTO Pet VALUES(5, 'Graviola', 10, 1.2,'facebook.com/image5','2011-01-12', NULL, 'Dalmata', 6.0, 0, 7);
INSERT INTO Pet VALUES(6, 'Morango', 15, 1.3,'facebook.com/image6','2006-01-12', NULL, 'Labrador', 10.1, 0, 8);
INSERT INTO Pet VALUES(7, 'Chantily', 15, 1.3,'facebook.com/image7','2006-01-12', '2021-05-21', 'Labrador', 9.5, 0, 8);
INSERT INTO Pet VALUES(8, 'Tutifruti', 3, 0.5,'facebook.com/image8','2018-01-12', NULL, 'Beagle', 9.5, 1, 8);


/* INSERÇÕES VACINAS */
INSERT INTO Vacina VALUES('Nome estranho da vacina', 'Para raiva', '2021-12-25', NULL);

/* INSERÇÕES APLICAÇÕES DE VACINA */
INSERT INTO Aplicar VALUES(1, 'Nome estranho da vacina');