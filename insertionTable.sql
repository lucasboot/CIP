
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
INSERT INTO Vacina VALUES('V8', 'Cinomose, Hepatite,...');
INSERT INTO Vacina VALUES('Gripe Canina', 'Adenovirus Canino Tipo 2, Parainfluenza Canina, ...');
INSERT INTO Vacina VALUES('Anti-rabica', 'Raiva');
INSERT INTO Vacina VALUES('Giardiase', 'Indicada para animais de canis');
INSERT INTO Vacina VALUES('Quadrupla Felina', 'Auxiliar na prevenção das doenças causadas por vírus da Rinotraqueite, ...');




/* INSERÇÕES APLICAÇÕES DE VACINA */
INSERT INTO Aplicar VALUES(1, 'V8', '2019-03-30', '2020-04-21');
INSERT INTO Aplicar VALUES(1, 'Anti-rabica', '2019-02-18', '2020-02-15');
INSERT INTO Aplicar VALUES(2, 'Gripe Canina', '2020-01-28', NULL);
INSERT INTO Aplicar VALUES(3, 'Gripe Canina', '2018-07-22', '2020-05-17');
INSERT INTO Aplicar VALUES(3, 'Quadrupla Felina', '2019-06-06', NULL);
INSERT INTO Aplicar VALUES(4, 'Giardiase', '2020-06-11', NULL);
INSERT INTO Aplicar VALUES(5, 'Anti-rabica', '2018-02-21', '2019-02-16', '2020-02-19');
INSERT INTO Aplicar VALUES(5, 'V8', '2020-07-15', NULL);
INSERT INTO Aplicar VALUES(6, 'Giardiase', '2020-08-20', NULL);
INSERT INTO Aplicar VALUES(6, 'Anti-rabica', '2018-07-14', '2019-07-19', '2020-07-15');
INSERT INTO Aplicar VALUES(7, 'Anti-rabica', '2020-09-21', NULL);
INSERT INTO Aplicar VALUES(7, 'Gripe Canina', '2020-10-06', NULL);
INSERT INTO Aplicar VALUES(8, 'Anti-rabica', '2020-02-19', NULL);
INSERT INTO Aplicar VALUES(8, 'Quadrupla Felina', '2020-06-11', NULL);


/* INSERÇÕES DE CONSULTAS*/
INSERT INTO Consulta VALUES ('2020-02-21', 'Coceira e vermelhidão', 'Alergia alimentar', 'substitua a ração de sempre por fórmulas especiais. Se o animal é muito alérgico, opte por refeições caseiras, mas aí sempre bem orientadas pelo veterinário', 1, 1);
INSERT INTO Consulta VALUES ('2019-02-15', 'Coceira e vermelhidão', 'Alergia alimentar', 'substitua a ração de sempre por fórmulas especiais. Se o animal é muito alérgico, opte por refeições caseiras, mas aí sempre bem orientadas pelo veterinário', 2, 1);
INSERT INTO Consulta VALUES ('2021-05-15', 'Coceira e lesões pelas unhas', 'Alergia alimentar', 'substitua a ração de sempre por fórmulas especiais. Se o animal é muito alérgico, opte por refeições caseiras, mas aí sempre bem orientadas pelo veterinário', 3, 1);
INSERT INTO Consulta VALUES ('2020-05-15', 'Coceira e descamação na pele', 'Alergia alimentar', 'substitua a ração de sempre por fórmulas especiais. Se o animal é muito alérgico, opte por refeições caseiras, mas aí sempre bem orientadas pelo veterinário', 4, 1);
INSERT INTO Consulta VALUES ('2021-05-15', 'Febre, tosse', 'Erlichiose', 'remédios', 1, 1);
INSERT INTO Consulta VALUES ('2020-02-05', 'Febre, tosse', 'Erlichiose', 'remédios', 2, 2);
INSERT INTO Consulta VALUES ('2019-03-05', 'Febre, tosse', 'Erlichiose', 'remédios', 6, 3);
INSERT INTO Consulta VALUES ('2020-02-20', 'Coceira e descamação na pele', 'Alergia alimentar', 'substitua a ração de sempre por fórmulas especiais. Se o animal é muito alérgico, opte por refeições caseiras, mas aí sempre bem orientadas pelo veterinário', 6, 3);
INSERT INTO Consulta VALUES ('2018-05-12', 'Coceira e descamação na pele', 'Alergia alimentar', 'substitua a ração de sempre por fórmulas especiais. Se o animal é muito alérgico, opte por refeições caseiras, mas aí sempre bem orientadas pelo veterinário', 8, 2);
INSERT INTO Consulta VALUES ('2020-07-10', 'Febre, tosse', 'Erlichiose', 'remédios', 5, 3);
INSERT INTO Consulta VALUES ('2020-07-10', 'Febre, tosse', 'Erlichiose', 'remédios', 4, 2);
INSERT INTO Consulta VALUES ('2015-07-10', 'Febre, tosse', 'Erlichiose', 'remédios', 7, 1);
INSERT INTO Consulta VALUES ('2018-07-10', 'Perda de apetite', 'Insuficiência Renal', 'o objetivo é restabelecer o equilíbrio orgânico com uma dieta apropriada, isto é, pouco proteica, suplementos vitamínicos e terapia com fluidos e eletrólitos. ', 7, 3);









