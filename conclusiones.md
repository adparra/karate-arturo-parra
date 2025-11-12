
## HALLAZGOS Y CONCLUSIONES DEL EJERCICIO 2 (API)


Este documento resume los principales hallazgos y conclusiones obtenidos durante la automatización del flujo E2E de la API de PetStore, utilizando Karate y Gradle.


### 1. Hallazgos sobre el Entorno (API PetStore)

El entorno en el cual se realizaron las pruebas API presentó ciertas complicaciones, especialmente al momento de realizar peticiones POST. Al momento de crear una nueva mascota, el servidor retorna un mensaje 200 OK y un payload idéntico al enviado. No obstante, en ocasiones esta mascota no es guardada en la base de datos (o es almacenada luego de una cantidad considerable de tiempo). Debido a esto, al momento de realizar un GET con el id de la mascota creada, el servidor retorna un 404, rompiendo el flujo de pruebas. Así mismo, cuando se consulta todas las mascotas con un estado de "sold" en ocasiones la mascota a buscar no es hallada (ya sea porque el array devuelto no contiene todos los elementos o por alguna limitación del framework).

### 2. Hallazgos sobre la Configuración (Gradle)

* **Estructura del Proyecto:** Karate (con Gradle) sigue la estructura estándar de Java, donde los archivos `.feature` deben ubicarse en `src/test/resources/` y los archivos `.java` (como el Runner) en `src/test/java/`.
* **Reportes de Cucumber:** Para generar los reportes HTML solicitados, se requiere un `Runner` (ej. `PetStoreRunner.java`) que configure `outputCucumberJson(true)` y `reportDir()`.
* **Ejecución Limpia:** Gradle almacena en caché los resultados de las tareas. Si se ejecuta `gradle test` varias veces sin cambios en los archivos, Gradle omite la ejecución (marcando la tarea como `UP-TO-DATE`), lo que resulta en que los reportes se borran (por la tarea `cleanReports`) pero no se vuelven a crear. La solución es usar el comando `gradle clean test` para forzar una ejecución completa.

### Conclusión General

El framework Karate se presta para realizar pruebas API de una forma sumamente sencilla, permitiendo que incluso una persona sin conocimientos mayores de programación pueda realizar pruebas básicas. No obstante, para poder aprovechar de manera completa el framework, es necesario tener conocimientos de programación. 