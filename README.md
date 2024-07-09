<h1 align="center">doPost</h1>
<p>El método doPost en la clase HttpServlet es fundamental para manejar solicitudes HTTP POST en aplicaciones web Java. Permite recibir datos enviados desde el cliente, procesarlos adecuadamente y enviar una respuesta de vuelta al cliente, facilitando la creación de aplicaciones web interactivas y dinámicas.</p>

<h1 align="center">setAttribute</h1>
<p>El método setAttribute de la clase HttpServletRequest se utiliza para almacenar datos en la solicitud actual. Estos datos pueden ser recuperados y utilizados posteriormente en otros servlets o en páginas JSP dentro del mismo ciclo de solicitud y respuesta.</p>
<h2>Definición y Uso de setAttribute</h2>
<h3>Definición:</h3>

```java
void setAttribute(String name, Object o);
```
-  <b>name</b>: Es una cadena (`String`) que actúa como clave para el atributo. Debe ser única para identificar el valor asociado.
-  <b>o</b>: Es el valor del atributo, que puede ser cualquier objeto (`Object`).

<h3>Propósito:</h3>

- El método `setAttribute` permite pasar datos entre diferentes componentes de la aplicación web (por ejemplo, entre un servlet y una JSP) sin necesidad de incluirlos en la URL o en los campos del formulario.
- Se usa comúnmente para transferir datos desde un servlet a una JSP que presentará esos datos.

<h3>Ventajas de setAttribute:</h3>

-  <b>Encapsulamiento de Datos</b>: Permite pasar objetos complejos (no solo cadenas) entre componentes de la aplicación web.
-  <b>Separación de Responsabilidades</b>: Separa la lógica de negocio (en el servlet) de la presentación (en la JSP).
-  <b>Flexibilidad</b>: Facilita el uso compartido de datos entre múltiples servlets y JSPs durante una única solicitud.

<h1 align="center">JSP</h1>
<p>Un JSP (JavaServer Pages) es una tecnología basada en Java utilizada para crear páginas web dinámicas. Las páginas JSP permiten la incorporación de código Java en HTML, lo que facilita la generación de contenido web dinámico basado en datos y lógica de servidor.</p>
<h2>Características Principales de JSP</h2>

- <b>Integración de Java en HTML</b>:
    - Permite incrustar fragmentos de código Java directamente en el HTML utilizando etiquetas especiales (<% %>).
-  <b>Componentes Reutilizables</b>:
    -  Soporta el uso de JavaBeans, que son componentes reutilizables que encapsulan lógica de negocio.
    -  Facilita la integración con servlets, permitiendo una separación clara entre la lógica de negocio y la presentación.
-  <b>Simplicidad y Flexibilidad</b>:
    -  Simplifica la creación de contenido web dinámico al permitir el uso de expresiones y declaraciones Java dentro de una página HTML.
    -  Ofrece una estructura flexible para combinar HTML y Java, lo que facilita el desarrollo de aplicaciones web complejas.

<h2>Cómo Funciona JSP</h2>

-  <b>Solicitud del Cliente</b>:
    -  Cuando un cliente (como un navegador web) solicita una página JSP, el servidor web procesa la solicitud.
-  <b>Conversión a Servlet</b>:
    -  El servidor convierte la página JSP en un servlet. Este servlet generado contiene la lógica necesaria para producir el contenido dinámico.
-  <b>Ejecución del Servlet</b>:
    -  El servlet generado se compila y se ejecuta, generando el HTML dinámico que se enviará al cliente.
- <b>Respuesta al Clientec:
    - El servidor web envía el contenido HTML generado al cliente, que lo muestra en el navegador.

<h2>Estructura de una Página JSP</h2>
<p>Una página JSP puede contener varias secciones:</p>

-  <b>Directivas</b>:
    -  Proporcionan instrucciones al contenedor JSP (por ejemplo, importación de clases Java).
    -  Ejemplo: `<%@ page contentType="text/html;charset=UTF-8" language="java" %>`
-  <b>Scriptlets</b>:
    -  Permiten insertar código Java directamente en la página JSP.
    -  Ejemplo: `<% int count = 5; %>`
-  <b>Expresiones</b>:
    -  Permiten evaluar y mostrar expresiones Java en la página HTML.
    -  Ejemplo: `<%= new Date() %>`
-  <b>Comentarios JSP</b>:
    -  Son comentarios que no se envían al cliente.
    -  Ejemplo: `<%-- Comentario JSP --%>`
-  <b>Acciones JSP</b>:
    -  Utilizan la sintaxis XML para invocar funcionalidades predefinidas.
    -  Ejemplo: `<jsp:useBean id="user" class="com.example.User" />`
 
<h2>Ventajas de Usar JSP</h2>

-  <b>Facilidad de Uso</b>:
    -  Permite a los desarrolladores web familiarizados con HTML agregar funcionalidad dinámica fácilmente.
-  <b>Separación de Lógica y Presentación</b>:
    -  Fomenta la separación entre la lógica de negocio (servidor) y la presentación (cliente).
-  <b>Integración con Servlets</b>:
    -  Permite una integración sencilla con servlets y otros componentes de Java EE.
-  <b>Mantenimiento y Escalabilidad</b>:
    -  Facilita el mantenimiento y la escalabilidad de aplicaciones web complejas.

<h2>Desventajas de JSP</h2>

-  <b>Complejidad en Páginas Grandes</b>:
    -  La inclusión de mucho código Java puede hacer que las páginas JSP sean difíciles de leer y mantener.
-  <b>Rendimiento</b>:
    -  La primera vez que se accede a una página JSP, el tiempo de respuesta puede ser más lento debido a la conversión a servlet y la compilación.

<h1 align="center">getServletContext() y getRequestDispatcher()</h1>
<p>getServletContext() y getRequestDispatcher() son métodos utilizados en la programación de servlets en Java, dentro del contexto de aplicaciones web que se ejecutan en un servidor de aplicaciones, como Apache Tomcat.</p>

<h2>getServletContext()</h2>
<p>El método getServletContext() es un método del Servlet que devuelve una referencia al objeto ServletContext. Este objeto proporciona un contexto de ejecución para una aplicación web y permite a los servlets comunicarse entre sí, así como con el contenedor de servlets.</p>
<h3>Funcionalidades del ServletContext:</h3>

-    <b>Almacenamiento de datos compartidos</b>: Permite a los servlets almacenar y recuperar datos que son compartidos entre diferentes servlets en la misma aplicación.
-    <b>Acceso a recursos</b>: Proporciona métodos para acceder a recursos del servidor como archivos, imágenes, etc., ubicados dentro del contexto de la aplicación web.
-    <b>Registro de eventos y mensajes</b>: Permite a los servlets registrar mensajes y eventos para propósitos de depuración.
-    <b>Acceso a parámetros de inicialización global</b>: Permite acceder a parámetros de configuración definidos en el archivo `web.xml` que son comunes para toda la aplicación.

<h2>getRequestDispatcher()</h2>
<p>El método getRequestDispatcher(String path) es utilizado para obtener un objeto RequestDispatcher, el cual se usa para reenviar una solicitud a otro recurso (como otro servlet, una JSP, un HTML, etc.) en el servidor. Esto se usa típicamente para la composición de vistas y control de flujo en una aplicación web.</p>
<h3>Funcionalidades del RequestDispatcher:</h3>

-    <b>Reenvío de solicitudes</b>: Permite a un servlet reenviar la solicitud a otro recurso para que se procese adicionalmente.
-    <b>Inclusión de contenido</b>: Permite incluir el contenido de otro recurso en la respuesta.

<h3>Métodos principales de RequestDispatcher:</h3>

-    `forward(ServletRequest request, ServletResponse response)`: Reenvía la solicitud del cliente a otro recurso en el servidor.
-    `include(ServletRequest request, ServletResponse response)`: Incluye el contenido de otro recurso en la respuesta.
