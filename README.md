# Gestión de Visualización y Preferencias en el Servicio de Streaming CineStream

CineStream es una plataforma de streaming especializada en películas. La empresa busca implementar una base de datos que permita registrar la actividad de los usuarios, sus perfiles y sesiones, así como los contenidos visualizados, valoraciones, planes de suscripción y configuraciones de preferencias.

El objetivo es conocer mejor el comportamiento de los usuarios y optimizar la experiencia personalizada mediante el análisis de datos como lo que ven, cuándo lo ven, cuánto tiempo, y cómo califican el contenido.

🎯 Objetivos del sistema

    Registrar múltiples perfiles por cuenta de usuario.

    Controlar cada sesión de visualización iniciada por un perfil.

    Almacenar historiales de visualización detallados.

    Identificar si el contenido fue reproducido por recomendación.

    Registrar valoraciones y comentarios por parte del usuario.

    Gestionar planes de suscripción y cambios históricos.

    Configurar preferencias individuales de visualización.

    Permitir consultas sobre tendencias de consumo, satisfacción del usuario y rendimiento del contenido.

## 📦 Entidades clave

👤 Usuario

    Datos personales y estado de la cuenta.

🧑‍💻 Perfil

    Identificación individual dentro de una cuenta (ideal para familias o grupos).

💳 HistorialSuscripcion

    Registro de cada contratación de plan por parte del usuario.

📦 PlanSuscripcion

    Define las características del plan como precio, resolución y dispositivos.

🎥 Películas

    Información detallada de cada película disponible en la plataforma.

📈 Sesion

    Registro de inicio de sesión de un perfil desde un dispositivo específico.

🎞️ HistorialVisualizacion

    Lo que se vio en cada sesión (película, fecha, minutos vistos, si fue recomendado, etc.).

⭐ Valoracion

    Comentarios y puntuaciones del perfil sobre películas vistas.

⚙️ Preferencias

    Configuraciones personalizadas de visualización por perfil.

## 📘 Reglas de funcionamiento

    El número de perfiles permitidos por usuario depende del plan de suscripción contratado.

    Cada sesión es exclusiva de un único perfil y registra el dispositivo y la IP de acceso.

    Una visualización se considera completa si el usuario ha visto más del 80% del contenido.

    El sistema registra si una película fue reproducida porque fue recomendada, para medir el impacto del motor de recomendaciones.

    Solo es posible calificar un contenido después de haberlo visto, total o parcialmente.

## 🔍 Casos de uso para análisis de datos

    Detectar qué contenidos recomendados fueron efectivamente terminados por los usuarios.

    Identificar los géneros de películas más vistos por grupos etarios específicos (niños, jóvenes, adultos).

    Analizar patrones de uso en perfiles que inician sesión desde múltiples dispositivos o ubicaciones.

    Evaluar el rendimiento de películas según duración media visualizada, no solo cantidad de reproducciones.

    Obtener estadísticas sobre configuraciones de usuario, como idioma preferido o velocidad de reproducción.

    Examinar el uso regional del servicio para ajustar catálogos locales según demanda.

## Diagrama Entidad-Relación
![Copia de Dibujo sin título](https://github.com/user-attachments/assets/53e2b671-63eb-4a02-87ca-c57c6dc4bfc4)

