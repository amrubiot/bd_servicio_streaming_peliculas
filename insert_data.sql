USE db_servicio_streaming_peliculas;
GO

INSERT INTO cuenta
VALUES
('Carlos', 'Perez', 'cperez@example.com', '987654321', 'Peru', 'masculino', '1990-05-14', '2025-04-01', 1, 'activa'),
('Lucia', NULL, 'lucia.g@example.com', NULL, 'Mexico', 'femenino', '1985-08-23', '2025-04-05', 0, 'activa'),
('Andres', 'Lopez', 'andres.lopez@gmail.com', '123456789', 'Argentina', 'masculino', '1993-02-11', '2025-04-08', 1, 'activa'),
('Sofia', 'Ramirez', 'sofiar@correo.com', '555444333', 'Chile', 'femenino', '2000-12-01', '2025-04-10', 0, 'inactiva'),
('Miguel', NULL, 'mtorres@yahoo.com', NULL, 'Colombia', 'masculino', '1988-03-30', '2025-04-15', 1, 'activa'),
('Valentina', 'Diaz', 'valentina.d@gmail.com', '222111000', 'Uruguay', 'femenino', '1995-09-19', '2025-04-20', 1, 'suspendida'),
('Jorge', NULL, 'jmendoza@live.com', '666777888', 'Ecuador', 'masculino', '1975-11-05', '2025-04-25', 0, 'activa'),
('Ana', 'Suarez', 'anasuarez@gmail.com', NULL, 'Peru', 'femenino', '1992-06-22', '2025-04-28', 1, 'inactiva'),
('Daniel', 'Ortega', 'daniel.ortega@outlook.com', '321654987', 'Mexico', 'masculino', '1980-04-01', '2025-05-01', 1, 'activa'),
('Fernanda', 'Ruiz', 'fernandaruiz@correo.com', NULL, 'Chile', 'femenino', '1998-01-18', '2025-05-03', 0, 'activa');

INSERT INTO plan_suscripcion
VALUES
('Estandar_Mes', 7.99, 1, '720p', 3, 3),
('Premium_Mes', 13.99, 1, '1080', 5, 5),
('Familiar_Mes', 19.99, 1, '4K', 7, 7),
('Estandar_Semestral', 39.99, 6, '720p', 3, 3),
('Premium_Semestral', 74.99, 6, '1080', 5, 5),
('Familiar_Semestral', 99.99, 6, '4K', 7, 7);

INSERT INTO pelicula 
VALUES
('Inception', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt', 'ciencia ficcion, accion', 'PG-13', 'ingles', 'espanol, frances', 'espanol, ingles', 148, '2010', 9),
('Parasite', 'Bong Joon-ho', 'Song Kang-ho, Lee Sun-kyun', 'drama, thriller', 'R', 'coreano', 'espanol, ingles', 'espanol, ingles', 132, '2019', 10),
('The Godfather', 'Francis Ford Coppola', 'Marlon Brando, Al Pacino', 'drama, crimen', 'R', 'ingles', 'espanol', 'espanol', 175, '1972', 10),
('Spirited Away', 'Hayao Miyazaki', 'Rumi Hiiragi, Miyu Irino', 'animacion, fantasia', 'PG', 'japones', 'espanol, ingles', 'espanol', 125, '2001', 9),
('The Dark Knight', 'Christopher Nolan', 'Christian Bale, Heath Ledger', 'accion, drama', 'PG-13', 'ingles', 'espanol, portugues', 'espanol, portugues', 152, '2008', 9),
('Amelie', 'Jean-Pierre Jeunet', 'Audrey Tautou', 'comedia, romance', 'R', 'frances', 'espanol', 'espanol', 122, '2001', 8),
('Interstellar', 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway', 'ciencia ficcion, drama', NULL, 'ingles', 'espanol', 'espanol', 169, '2014', 9),
('Roma', 'Alfonso Cuaron', 'Yalitza Aparicio, Marina de Tavira', 'drama', 'R', 'espanol', NULL, 'espanol', 135, '2018', 8),
('Coco', 'Lee Unkrich', 'Anthony Gonzalez, Gael Garcia Bernal', 'animacion, familiar', 'PG', 'ingles', 'espanol', 'espanol', 105, '2017', 9),
('Whiplash', 'Damien Chazelle', 'Miles Teller, J.K. Simmons', 'drama, musica', 'R', 'ingles', NULL, NULL, 106, '2014', 9);

INSERT INTO perfil
VALUES
(1, 'Carlos_Adulto', '2025-04-01', 1, 0),
(1, 'Carlos_Hijo', '2025-04-01', 0, 1),
(2, 'Lucia', '2025-04-03', 1, 0),
(2, 'NinaLucia', '2025-04-03', 0, 1),
(3, 'Andres', '2025-04-04', 1, 0),
(4, 'Sofia', '2025-04-05', 1, 0),
(4, 'KidsSofia', '2025-04-06', 0, 1),
(5, 'Miguel', '2025-04-06', 1, 0),
(6, 'Valentina', '2025-04-07', 1, 0),
(6, 'HermanitaV', '2025-04-07', 0, 1),
(7, 'Jorge', '2025-04-08', 1, 0),
(8, 'Ana', '2025-04-09', 1, 0),
(8, 'AnaKids', '2025-04-09', 0, 1),
(9, 'Daniel', '2025-04-10', 1, 0),
(10, 'Fernanda', '2025-04-11', 1, 0),
(10, 'HijoF', '2025-04-11', 0, 1),
(3, 'AndresJunior', '2025-04-12', 0, 1),
(5, 'MiguelKids', '2025-04-12', 0, 1),
(7, 'PadreJorge', '2025-04-13', 0, 0),
(9, 'Daniel_Hermano', '2025-04-13', 0, 0);

INSERT INTO preferencias
VALUES
(1, 'espanol', 'ingles', 'espanol', 1, 1),
(2, 'espanol', 'espanol', 'ninguno', 1, 0),
(3, 'ingles', 'ingles', 'espanol', 0, 1),
(4, 'espanol', 'frances', 'espanol', 1, 1),
(5, 'espanol', 'ingles', 'espanol', 1, 1),
(6, 'ingles', 'ingles', 'espanol', 1, 1),
(7, 'espanol', 'japones', 'espanol', 0, 0),
(8, 'espanol', 'espanol', 'espanol', 1, 1),
(9, 'espanol', 'ingles', 'espanol', 0, 1),
(10, 'espanol', 'espanol', 'espanol', 1, 0),
(11, 'ingles', 'ingles', 'ingles', 1, 1),
(12, 'espanol', 'espanol', 'espanol', 1, 1),
(13, 'espanol', 'portugues', 'espanol', 0, 1),
(14, 'ingles', 'ingles', 'espanol', 1, 1),
(15, 'espanol', 'espanol', 'espanol', 1, 0),
(16, 'espanol', 'espanol', 'espanol', 0, 0),
(17, 'espanol', 'ingles', 'espanol', 1, 1),
(18, 'ingles', 'ingles', 'ingles', 1, 1),
(19, 'espanol', 'espanol', 'espanol', 1, 0),
(20, 'espanol', 'ingles', 'espanol', 0, 1);

INSERT INTO sesion
VALUES
(1, 'Smart TV', '192.168.1.101', '2025-04-01 20:00:00', '2025-04-01 22:00:00', 'finalizada'),
(2, 'Tablet', '192.168.1.102', '2025-04-02 18:00:00', '2025-04-02 19:45:00', 'finalizada'),
(3, 'Laptop', '10.0.0.1', '2025-04-03 21:00:00', '2025-04-03 23:10:00', 'finalizada'),
(4, 'Smartphone', '10.0.0.2', '2025-04-04 14:00:00', '2025-04-04 15:30:00', 'finalizada'),
(5, 'Smart TV', '192.168.0.1', '2025-04-05 19:00:00', '2025-04-05 21:00:00', 'finalizada'),
(6, 'Tablet', '172.16.0.3', '2025-04-06 17:30:00', '2025-04-06 18:30:00', 'finalizada'),
(7, 'Laptop', '192.168.100.50', '2025-04-07 12:00:00', '2025-04-07 14:00:00', 'finalizada'),
(8, 'Smartphone', '192.168.10.5', '2025-04-08 16:00:00', '2025-04-08 17:45:00', 'finalizada'),
(9, 'Smart TV', '192.168.1.200', '2025-04-09 20:00:00', '2025-04-09 22:10:00', 'finalizada'),
(10, 'Tablet', '10.0.1.4', '2025-04-10 15:00:00', '2025-04-10 16:50:00', 'finalizada'),
(11, 'Laptop', '192.168.5.5', '2025-04-11 13:00:00', '2025-04-11 14:20:00', 'finalizada'),
(12, 'Smartphone', '10.10.10.10', '2025-04-12 21:30:00', '2025-04-12 22:40:00', 'finalizada'),
(13, 'Smart TV', '172.16.100.9', '2025-04-13 11:00:00', '2025-04-13 12:10:00', 'finalizada'),
(14, 'Tablet', '192.168.1.150', '2025-04-14 14:30:00', '2025-04-14 16:00:00', 'finalizada'),
(15, 'Laptop', '192.168.8.8', '2025-04-15 19:00:00', '2025-04-15 20:30:00', 'finalizada'),
(16, 'Smartphone', '10.0.0.9', DATEADD(HOUR, -3, GETDATE()), NULL, 'activa'),
(17, 'Smart TV', '192.168.1.180', DATEADD(HOUR, -3, GETDATE()), NULL, 'activa'),
(18, 'Laptop', '172.16.0.8', DATEADD(HOUR, -3, GETDATE()), NULL, 'activa'),
(19, 'Tablet', '192.168.2.2', DATEADD(HOUR, -3, GETDATE()), NULL, 'activa'),
(20, 'Smartphone', '192.168.0.50', DATEADD(HOUR, -3, GETDATE()), NULL, 'activa');

INSERT INTO historial_suscripcion
VALUES
(1, 1, 'Tarjeta de credito', '2025-04-01', '2025-05-01', 1, 'vencida'),
(2, 2, 'PayPal', '2025-04-02', '2025-05-02', 1, 'vencida'),
(3, 3, 'Tarjeta de debito', '2025-04-03', '2025-05-03', 0, 'vencida'),
(4, 1, 'Tarjeta de credito', '2025-04-10', '2025-05-10', 1, 'vencida'),
(5, 5, 'Transferencia bancaria', '2025-04-05', '2025-10-05', 1, 'activa'),
(6, 6, 'Tarjeta de debito', '2025-04-06', '2025-10-06', 0, 'activa'),
(7, 1, 'Tarjeta de credito', '2025-04-07', '2025-05-07', 1, 'vencida'),
(8, 2, 'PayPal', '2025-04-08', '2025-05-08', 0, 'cancelada'),
(9, 3, 'Tarjeta de debito', '2025-04-09', '2025-05-09', 1, 'vencida'),
(10, 4, 'Transferencia bancaria', '2025-04-10', '2025-10-10', 1, 'activa'),
(9, 6, 'Tarjeta de credito', '2025-05-10', '2025-11-10', 1, 'activa'),
(2, 5, 'PayPal', '2025-05-03', '2025-11-03', 0, 'activa'),
(3, 6, 'Tarjeta de debito', '2025-05-04', '2025-11-04', 1, 'activa'),
(4, 4, 'Transferencia bancaria', '2025-05-11', '2025-11-11', 0, 'activa'),
(7, 4, 'Tarjeta de credito', '2025-05-08', '2025-11-08', 1, 'activa');

INSERT INTO historial_visualizacion
VALUES
(1, 2, 'ingles', 'espanol', 132, 1, 1, 0),
(2, 1, 'espanol', 'espanol', 140, 0, 1, 1),
(3, 3, 'ingles', NULL, 172, 1, 1, 0),
(4, 5, 'ingles', 'portugues', 144, 0, 1, 0),
(5, 4, 'espanol', 'espanol', 120, 1, 1, 1),
(6, 6, 'frances', 'espanol', 115, 0, 1, 0),
(7, 7, 'espanol', NULL, 169, 1, 1, 0),
(8, 3, 'ingles', NULL, 174, 1, 1, 0),
(9, 2, 'coreano', 'ingles', 100, 0, 0, 1),
(10, 8, 'español', NULL, 135, 0, 1, 0),
(11, 9, 'ingles', 'espanol', 105, 1, 1, 0),
(12, 1, 'espanol', NULL, 145, 0, 1, 1),
(13, 5, 'ingles', NULL, 91, 1, 0, 0),
(14, 1, 'ingles', 'espanol', 147, 0, 1, 0),
(15, 4, 'japones', NULL, 111, 1, 1, 1);

INSERT INTO valoracion
VALUES
(1, 2, 8, 'Muy buena pelicula, la recomiendo.', 0, 5),
(2, 1, 7, 'Entretenida pero predecible.', 0, 3),
(3, 3, 9, 'Excelente actuacion y efectos.', 0, 7),
(4, 5, 6, 'Buena para pasar el rato.', 0, 1),
(5, 4, 5, NULL, 1, 0),
(6, 6, 8, 'Historia interesante y bien contada.', 0, 4),
(7, 7, 7, 'Buena pero esperaba mas.', 0, 2),
(8, 3, 10, 'Me encantó, de mis favoritas.', 0, 9),
(9, 2, 6, NULL, 0, 1),
(10, 8, 9, 'Muy recomendable para los fans del genero.', 0, 6),
(11, 9, 7, 'Buena trama, aunque algo lenta.', 0, 2),
(12, 1, 8, 'Gran calidad visual y buen guion.', 0, 5),
(13, 5, 4, 'No me convencio, esperaba otra cosa.', 1, 0),
(14, 1, 9, 'Muy bien dirigida, final impactante.', 0, 4),
(15, 4, 6, 'Aceptable, pero olvidable.', 0, 1);