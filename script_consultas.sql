USE db_servicio_streaming_peliculas
GO

/* Se desea conocer el director y el reparto principal de todas las películas del 
género "Thriller" o "Crimen" que hay en el catálogo */
SELECT
	titulo,
	director,
	reparto_principal,
	generos
FROM pelicula
WHERE generos LIKE '%thriller%' OR generos LIKE '%crimen%';

---------------------------------------------------------------------------------------------------

/* Se desea conocer todas las sesiones finalizadas que comenzaron a partir del 
10 de abril del 2025, ordenadas desde la sesión más antigua hasta la más reciente*/
SELECT
    id,
    dispositivo,
    ip_acceso,
    fecha_inicio,
    fecha_fin,
    estado_sesion
FROM sesion
WHERE fecha_inicio >= '2025-04-10'
  AND estado_sesion = 'finalizada'
ORDER BY fecha_inicio ASC;

---------------------------------------------------------------------------------------------------

/*Se necesita conocer las películas con un promedio de valoración superior a 8,
ordenadas de mayor a menor */
SELECT 
	pel.titulo,
	AVG(v.puntaje) AS 'Promedio Valoración Usuarios'
FROM valoracion v
INNER JOIN pelicula pel ON v.id = pel.id
GROUP BY pel.titulo
HAVING AVG(v.puntaje) > 8
ORDER BY AVG(v.puntaje) DESC;

---------------------------------------------------------------------------------------------------

/* Se desea conocer qué películas ha visualizado cada perfil y la fecha de visualización.
Esta información permite analizar el historial general de reproducción*/
SELECT 
    p.nombre_perfil AS Perfil,
    pel.titulo AS 'Título Película',
	CASE 
		WHEN CAST(fecha_inicio AS DATE) = CAST(fecha_fin AS DATE) 
			THEN CAST(fecha_inicio AS DATE)
		ELSE CAST(CAST(fecha_inicio AS DATE) AS VARCHAR(10)) + ' - '
		+ CAST(CAST(fecha_fin AS DATE) AS VARCHAR(10))
	END AS 'Fecha Visualización'
FROM historial_visualizacion hv
INNER JOIN sesion s ON s.id = hv.sesion_id
INNER JOIN perfil p ON p.id = s.perfil_id
INNER JOIN pelicula pel ON hv.pelicula_id = pel.id
ORDER BY 
    p.nombre_perfil,
    s.fecha_inicio DESC;

---------------------------------------------------------------------------------------------------

/*Se desea conocer el total de ingresos generados en un mes y año
específicos. Para ello, se crea una función que reciba el mes y el año,
y devuelva el total de dinero cobrado en ese período según los precios de
los planes */
CREATE OR ALTER FUNCTION TotalIngresosMes (@año INT,@mes INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @ingresos DECIMAL(10,2);

    SELECT @ingresos = SUM(ps.precio)
    FROM historial_suscripcion hs
    INNER JOIN plan_suscripcion ps ON hs.plan_id = ps.id
    WHERE MONTH(hs.fecha_inicio) = @mes
      AND YEAR(hs.fecha_inicio) = @año;

    RETURN @ingresos;
END;

--Ejemplo: Consultar el total de ingresos obtenidos en abril del 2025
SELECT dbo.TotalIngresosMes(2025,4) AS 'Total Ingresos Abril (S/.)'

---------------------------------------------------------------------------------------------------

/*Se desea conocer qué perfiles tienen como idioma preferido un idioma específico,
ya sea de la aplicación, en el idioma del audio de las películas o en los subtítulos.
Para ello, se implementa una función que permite filtrar los perfiles según
el tipo de preferencia (app, aud o sub) y el idioma correspondiente */
CREATE OR ALTER FUNCTION PrefPerfilesPorIdioma (@idioma VARCHAR(50), @opcion VARCHAR(3))
RETURNS TABLE
AS
RETURN (
    SELECT
		p.id AS Perfil_ID,
		p.nombre_perfil AS 'Nombre Perfil',
		CASE 
            WHEN @opcion = 'app' THEN 'App: ' + pr.idioma_aplicacion
            WHEN @opcion = 'aud' THEN 'Audio: ' + pr.idioma_peliculas_preferido
            WHEN @opcion = 'sub' THEN 'Subtitulos: ' + pr.idioma_subtitulos_preferido
            ELSE NULL
        END AS 'Idioma Preferido'
    FROM preferencias pr
    INNER JOIN perfil p ON pr.id = p.id
	WHERE (@opcion = 'app' AND pr.idioma_aplicacion = @idioma) OR
        (@opcion = 'aud' AND pr.idioma_peliculas_preferido = @idioma) OR
        (@opcion = 'sub' AND pr.idioma_subtitulos_preferido = @idioma)
);
/* Ejemplo: Obtener los perfiles que tienen configurado el idioma inglés como
idioma preferido para el audio de las películas */
SELECT * FROM dbo.PrefPerfilesPorIdioma('ingles', 'aud');

---------------------------------------------------------------------------------------------------

/*Se desea generar un reporte mensual que incluya dos indicadores clave de rendimiento:
    -Las 5 películas más vistas durante un mes y año determinados, ordenadas por cantidad de visualizaciones.
	-El porcentaje de visualizaciones que se realizaron gracias al sistema de recomendaciones en ese mismo periodo.
Para ello, se crea un procedimiento almacenado que recibe el mes y el año como parámetros, y devuelve ambas tablas.*/
CREATE OR ALTER PROCEDURE sp_ReporteMensual @año INT,@mes INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Top 5 películas más vistas
    SELECT TOP 5
        pel.titulo AS Titulo,
        COUNT(*) AS Reproducciones
    FROM historial_visualizacion hv
    INNER JOIN pelicula pel ON hv.pelicula_id = pel.id
	INNER JOIN sesion s ON hv.sesion_id = s.id
    WHERE 
        MONTH(s.fecha_inicio) = @mes 
        AND YEAR(s.fecha_inicio) = @año
    GROUP BY pel.titulo
    ORDER BY Reproducciones DESC;

    -- Porcentaje de visualizaciones por recomendación
    SELECT
        FORMAT(COUNT(CASE WHEN hv.fue_recomendado_algoritmo = 1 THEN 1 END) * 100.0 / COUNT(hv.id),'N2')+'%'
		AS PorcentajeVisualizacionPorRecomendación
    FROM historial_visualizacion hv
	INNER JOIN sesion s ON hv.sesion_id = s.id
    WHERE 
        MONTH(s.fecha_inicio) = @mes 
        AND YEAR(s.fecha_inicio) = @año
END;

--Ejemplo: Generar el reporte mensual de ambos indicadores para Abril del 2025
EXEC sp_ReporteMensual 2025, 4;
