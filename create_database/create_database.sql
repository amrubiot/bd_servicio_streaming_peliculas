CREATE DATABASE db_servicio_streaming_peliculas;
GO

USE db_servicio_streaming_peliculas;
GO

CREATE TABLE cuenta (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100),
    correo VARCHAR(150) NOT NULL,
    telefono VARCHAR(20),
    pais VARCHAR(50) NOT NULL,
	genero VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_registro DATE NOT NULL,
	cuenta_verificada BIT DEFAULT 0,
    estado_cuenta VARCHAR(50) NOT NULL
);

CREATE TABLE plan_suscripcion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_plan VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    duracion_meses INT NOT NULL,
    resolucion_max VARCHAR(50) NOT NULL,
    dispositivos_reproduccion_simul INT NOT NULL,
    dispositivos_descargas_max INT NOT NULL
);

CREATE TABLE pelicula (
    id INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    director VARCHAR(150) NOT NULL,
    reparto_principal VARCHAR(MAX) NOT NULL,
    generos VARCHAR(MAX) NOT NULL,
    clasificacion_edad VARCHAR(25),
    idioma_original VARCHAR(25) NOT NULL,
    doblajes_disp VARCHAR(MAX),
    subtitulos_disp VARCHAR(200),
    duracion_minutos INT NOT NULL,
    año_lanzamiento INT NOT NULL,
    puntuacion_critica INT
);

CREATE TABLE perfil (
    id INT IDENTITY(1,1) PRIMARY KEY,
    cuenta_id INT NOT NULL,
    nombre_perfil VARCHAR(100) NOT NULL,
    fecha_creacion DATE NOT NULL,
    perfil_principal BIT DEFAULT 0,
    control_parental BIT DEFAULT 0,
    FOREIGN KEY (cuenta_id) REFERENCES cuenta(id)
);

CREATE TABLE preferencias (
    id INT IDENTITY(1,1) PRIMARY KEY,
    perfil_id INT NOT NULL,
    idioma_aplicacion VARCHAR(50) NOT NULL,
    idioma_peliculas_preferido VARCHAR(50) NOT NULL,
    idioma_subtitulos_preferido VARCHAR(50) NOT NULL,
    visualizacion_previa BIT DEFAULT 1,
    mostrar_recomendados_algoritmo BIT DEFAULT 1,
    FOREIGN KEY (perfil_id) REFERENCES perfil(id)
);

CREATE TABLE sesion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    perfil_id INT NOT NULL,
    dispositivo VARCHAR(100) NOT NULL,
    ip_acceso VARCHAR(45) NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME,
    estado_sesion VARCHAR(50) NOT NULL,
    FOREIGN KEY (perfil_id) REFERENCES perfil(id)
);

CREATE TABLE historial_suscripcion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    cuenta_id INT NOT NULL,
    plan_id INT NOT NULL,
    metodo_pago VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    renovacion_automatica BIT DEFAULT 1,
    estado_suscripcion VARCHAR(50),
    FOREIGN KEY (cuenta_id) REFERENCES cuenta(id),
    FOREIGN KEY (plan_id) REFERENCES plan_suscripcion(id)
);

CREATE TABLE historial_visualizacion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    sesion_id INT NOT NULL,
    pelicula_id INT NOT NULL,
    idioma_audio VARCHAR(50) NOT NULL,
    idioma_subtitulos VARCHAR(50),
    minutos_vistos INT NOT NULL,
    fue_recomendado_algoritmo BIT DEFAULT 0,
    completado BIT DEFAULT 0,
    favorito BIT DEFAULT 0,
    FOREIGN KEY (sesion_id) REFERENCES sesion(id),
    FOREIGN KEY (pelicula_id) REFERENCES pelicula(id)
);

CREATE TABLE valoracion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    perfil_id INT NOT NULL,
    pelicula_id INT NOT NULL,
    fecha DATE NOT NULL,
    puntaje INT,
    comentario TEXT,
    contiene_spoiler BIT DEFAULT 0,
    reacciones_utiles INT DEFAULT 0,
    FOREIGN KEY (perfil_id) REFERENCES perfil(id),
    FOREIGN KEY (pelicula_id) REFERENCES pelicula(id)
);
