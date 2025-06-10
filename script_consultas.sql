USE db_servicio_streaming_peliculas
GO

/* Se desea conocer el director y el reparto principal de todas las pel�culas del 
g�nero "Thriller" o "Crimen" que hay en el cat�logo */
SELECT
	titulo,
	director,
	reparto_principal,
	generos
FROM pelicula
WHERE generos LIKE '%thriller%' OR generos LIKE '%crimen%';

---------------------------------------------------------------------------------------------------

/* Se desea conocer todas las sesiones finalizadas que comenzaron a partir del 
10 de abril del 2025, ordenadas desde la sesi�n m�s antigua hasta la m�s reciente*/
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

/*Se necesita conocer las pel�culas con un promedio de valoraci�n superior a 8,
ordenadas de mayor a menor */
SELECT 
	pel.titulo,
	AVG(v.puntaje) AS 'Promedio Valoraci�n Usuarios'
FROM valoracion v
INNER JOIN pelicula pel ON v.id = pel.id
GROUP BY pel.titulo
HAVING AVG(v.puntaje) > 8
ORDER BY AVG(v.puntaje) DESC;

---------------------------------------------------------------------------------------------------

/* Se desea conocer qu� pel�culas ha visualizado cada perfil y la fecha de visualizaci�n.
Esta informaci�n permite analizar el historial general de reproducci�n*/
SELECT 
    p.nombre_perfil AS Perfil,
    pel.titulo AS 'T�tulo Pel�cula',
	CASE 
		WHEN CAST(fecha_inicio AS DATE) = CAST(fecha_fin AS DATE) 
			THEN CAST(fecha_inicio AS DATE)
		ELSE CAST(CAST(fecha_inicio AS DATE) AS VARCHAR(10)) + ' - '
		+ CAST(CAST(fecha_fin AS DATE) AS VARCHAR(10))
	END AS 'Fecha Visualizaci�n'
FROM historial_visualizacion hv
INNER JOIN sesion s ON s.id = hv.sesion_id
INNER JOIN perfil p ON p.id = s.perfil_id
INNER JOIN pelicula pel ON hv.pelicula_id = pel.id
ORDER BY 
    p.nombre_perfil,
    s.fecha_inicio DESC;

---------------------------------------------------------------------------------------------------

/*Se desea conocer el total de ingresos generados en un mes y a�o
espec�ficos. Para ello, se crea una funci�n que reciba el mes y el a�o,
y devuelva el total de dinero cobrado en ese per�odo seg�n los precios de
los planes */
CREATE OR ALTER FUNCTION TotalIngresosMes (@a�o INT,@mes INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @ingresos DECIMAL(10,2);

    SELECT @ingresos = SUM(ps.precio)
    FROM historial_suscripcion hs
    INNER JOIN plan_suscripcion ps ON hs.plan_id = ps.id
    WHERE MONTH(hs.fecha_inicio) = @mes
      AND YEAR(hs.fecha_inicio) = @a�o;

    RETURN @ingresos;
END;

--Ejemplo: Consultar el total de ingresos obtenidos en abril del 2025
SELECT dbo.TotalIngresosMes(2025,4) AS 'Total Ingresos Abril (S/.)'

---------------------------------------------------------------------------------------------------

/*Se desea conocer qu� perfiles tienen como idioma preferido un idioma espec�fico,
ya sea de la aplicaci�n, en el idioma del audio de las pel�culas o en los subt�tulos.
Para ello, se implementa una funci�n que permite filtrar los perfiles seg�n
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
/* Ejemplo: Obtener los perfiles que tienen configurado el idioma ingl�s como
idioma preferido para el audio de las pel�culas */
SELECT * FROM dbo.PrefPerfilesPorIdioma('ingles', 'aud');

---------------------------------------------------------------------------------------------------

/*Se desea generar un reporte mensual que incluya dos indicadores clave de rendimiento:
    -Las 5 pel�culas m�s vistas durante un mes y a�o determinados, ordenadas por cantidad de visualizaciones.
	-El porcentaje de visualizaciones que se realizaron gracias al sistema de recomendaciones en ese mismo periodo.
Para ello, se crea un procedimiento almacenado que recibe el mes y el a�o como par�metros, y devuelve ambas tablas.*/
CREATE OR ALTER PROCEDURE sp_ReporteMensual @a�o INT,@mes INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Top 5 pel�culas m�s vistas
    SELECT TOP 5
        pel.titulo AS Titulo,
        COUNT(*) AS Reproducciones
    FROM historial_visualizacion hv
    INNER JOIN pelicula pel ON hv.pelicula_id = pel.id
	INNER JOIN sesion s ON hv.sesion_id = s.id
    WHERE 
        MONTH(s.fecha_inicio) = @mes 
        AND YEAR(s.fecha_inicio) = @a�o
    GROUP BY pel.titulo
    ORDER BY Reproducciones DESC;

    -- Porcentaje de visualizaciones por recomendaci�n
    SELECT
        FORMAT(COUNT(CASE WHEN hv.fue_recomendado_algoritmo = 1 THEN 1 END) * 100.0 / COUNT(hv.id),'N2')+'%'
		AS PorcentajeVisualizacionPorRecomendaci�n
    FROM historial_visualizacion hv
	INNER JOIN sesion s ON hv.sesion_id = s.id
    WHERE 
        MONTH(s.fecha_inicio) = @mes 
        AND YEAR(s.fecha_inicio) = @a�o
END;

--Ejemplo: Generar el reporte mensual de ambos indicadores para Abril del 2025
EXEC sp_ReporteMensual 2025, 4;
