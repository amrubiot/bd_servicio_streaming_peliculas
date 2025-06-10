# Gestión de Base de Datos para un Servicio de Streaming de Películas

Una empresa dedicada a ofrecer servicios de streaming de películas gestiona una plataforma en línea donde los usuarios pueden acceder a contenido audiovisual bajo demanda. Esta plataforma permite a los usuarios crear múltiples perfiles por cuenta, visualizar contenido desde diversos dispositivos, valorar las películas vistas y configurar sus preferencias de visualización.

A medida que la base de usuarios crece, la administración de la información relacionada a perfiles, sesiones, historiales de visualización, valoraciones, planes de suscripción y configuraciones individuales se vuelve cada vez más compleja y difícil de mantener.

Se requiere un sistema de base de datos relacional que centralice esta información, permita registrar eficientemente la actividad de los usuarios y facilite el análisis del comportamiento de consumo. Este sistema busca mejorar la personalización del servicio y apoyar la toma de decisiones estratégicas basadas en datos reales.


## Objetivos específicos:

●	Registrar múltiples perfiles por cuenta con atributos personalizados y control parental.
●	Gestionar eficientemente las sesiones iniciadas desde distintos dispositivos y ubicaciones.
●	Almacenar y consultar historiales de visualización detallados.
●	Relacionar valoraciones y comentarios a visualizaciones previas de contenido.
●	Registrar y analizar cambios en las suscripciones, junto con sus características y pagos.
●	Permitir consultas para medir tendencias de consumo, comportamiento del usuario y rendimiento del contenido.


## 📦 Entidades clave

👤 Cuenta

    Representa a los usuarios que se registran en la plataforma. Cada cuenta puede tener múltiples perfiles asociados.

🧑‍💻 Perfil

    Define identidades personalizadas dentro de una cuenta (por ejemplo, perfiles para cada miembro de una familia). Permite activar el control parental y especificar si se trata del perfil principal creado      junto con la cuenta.

⚙️ Preferencias

    Almacena configuraciones personalizadas por perfil, como idioma de la aplicación, preferencias de audio y subtítulos, y opciones de visualización.

📦 Plan de suscripción

    Contiene los distintos tipos de planes que ofrece el servicio, con características como resolución, precio y cantidad de dispositivos permitidos.
    
💳 Historial de suscripción

    Registra las suscripciones realizadas por cada cuenta a lo largo del tiempo, incluyendo fechas, estado y método de pago.

🎥 Pelicula

    Almacena información sobre el catálogo de contenido disponible, incluyendo metadatos útiles para búsqueda y recomendaciones.

📈 Sesion

    Representa una instancia de uso de la plataforma desde un dispositivo específico por parte de un perfil.

🎞️ Historial de visualización

    Registra qué contenido ha sido visualizado por cada perfil durante una sesión.

⭐ Valoracion

    Permite a los perfiles dejar puntuaciones y comentarios sobre las películas vistas, enriqueciendo el sistema de recomendación y retroalimentación.



## Desafíos:

●	La plataforma debe manejar múltiples perfiles por cuenta sin conflictos, permitiendo configuraciones y preferencias únicas.
●	Es necesario registrar correctamente las sesiones iniciadas por distintos perfiles desde diversos dispositivos, incluyendo duración, IP y estado.
●	Se requiere un registro detallado del contenido visto, tiempo de visualización y si fue sugerido por el algoritmo, para mejorar recomendaciones.
●	Las valoraciones y comentarios aportan valor, pero deben validarse y relacionarse correctamente con las visualizaciones.
●	Se deben registrar los cambios de suscripción, renovaciones y métodos de pago de forma clara y accesible para análisis posterior.

## Beneficios esperados:

•	Optimización de la personalización: Al tener preferencias y visualizaciones bien registradas, se mejora la precisión del motor de recomendaciones.
•	Análisis profundo de uso: El sistema permitirá conocer qué contenido tiene mayor retención o aceptación entre distintos grupos de usuarios.
•	Mejora en la gestión del servicio: Información centralizada facilita la toma de decisiones sobre planes, contenidos y segmentación de mercado.
•	Aumento de la satisfacción del usuario: La plataforma podrá adaptarse mejor a los hábitos y gustos de cada perfil, mejorando la experiencia general.
•	Soporte para expansión futura: La base de datos está preparada para escalar a más usuarios, más dispositivos y nuevos planes de suscripción sin pérdida de eficiencia.

## Diagrama Entidad-Relación
![Copia de Dibujo sin título](https://github.com/user-attachments/assets/34888973-87e6-4694-8f49-6eb6390e50df)

## Diseño Lógico
![Untitled](https://github.com/user-attachments/assets/0d40dacf-52f4-4b11-accf-fbca4012d409)

## Modelo Físico
![diagrama](https://github.com/user-attachments/assets/f3b44be7-20ad-4afa-b8b3-b668abc09301)
