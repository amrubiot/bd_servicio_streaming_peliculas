# Gestión de Visualización e Historial de Suscripciones en el Servicio de Streaming CineStream

CineStream es una plataforma de streaming especializada en películas. La empresa busca implementar una base de datos que permita registrar la actividad de los usuarios, sus perfiles y sesiones, así como los contenidos visualizados, valoraciones, planes de suscripción y configuraciones de preferencias.

El objetivo es conocer mejor el comportamiento de los usuarios y optimizar la experiencia personalizada mediante el análisis de datos como lo que ven, cuándo lo ven, cuánto tiempo, y cómo califican el contenido.

🎯 Objetivos del sistema

    Registrar múltiples perfiles por cuenta de usuario.

    Controlar cada sesión de visualización iniciada por un perfil.

    Almacenar historiales de visualización detallados.

    Identificar si el contenido fue reproducido por recomendación.

    Registrar valoraciones y comentarios por parte de un perfil.

    Gestionar planes de suscripción y cambios históricos.

    Configurar preferencias individuales de visualización.

    Permitir consultas sobre tendencias de consumo, satisfacción del usuario y rendimiento del contenido.

## 📦 Entidades clave

👤 cuenta

    Datos personales y estado de la cuenta.

🧑‍💻 perfil

    Identificación individual dentro de una cuenta (ideal para familias o grupos).

💳 historial_suscripcion

    Registro de cada contratación de plan por parte del usuario.

📦 plan_suscripcion

    Define las características del plan como precio, resolución y dispositivos.

🎥 pelicula

    Información detallada de cada película disponible en la plataforma.

📈 sesion

    Registro de inicio de sesión de un perfil desde un dispositivo específico.

🎞️ historial_visualizacion

    Lo que se vio en cada sesión (película, fecha, minutos vistos, si fue recomendado, etc.).

⭐ valoracion

    Comentarios y puntuaciones del perfil sobre películas vistas.

⚙️ preferencias

    Configuraciones personalizadas de visualización por perfil.

## 📘 Reglas de funcionamiento

    El número de perfiles permitidos por cuenta depende del plan de suscripción contratado.

    Cada sesión es exclusiva de un único perfil y registra el dispositivo y la IP de acceso.

    Una visualización se considera completa si un perfil ha visto más del 80% del contenido.

    El sistema registra si una película fue reproducida porque fue recomendada, para medir el impacto del motor de recomendaciones.

    Solo es posible calificar un contenido después de haberlo visto, total o parcialmente.

## 🔍 Casos de uso para análisis de datos

    Detectar qué contenidos recomendados fueron efectivamente terminados por los usuarios.

    Analizar patrones de uso en perfiles que inician sesión desde múltiples dispositivos o ubicaciones.

    Evaluar el rendimiento de películas según duración media visualizada, no solo cantidad de reproducciones.

    Examinar el uso regional del servicio para ajustar catálogos locales según demanda.

## Diagrama Entidad-Relación
![Copia de Dibujo sin título](https://github.com/user-attachments/assets/53e2b671-63eb-4a02-87ca-c57c6dc4bfc4)

## Diseño lógico
![Untitled](https://github.com/user-attachments/assets/491ecbb0-eeb8-41b7-9160-81d73e83ea8d)

