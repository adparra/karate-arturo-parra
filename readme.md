# Proyecto de Pruebas API (Karate + Gradle)

Este proyecto contiene una prueba funcional automatizada (E2E) para la API de "PetStore" (`https://petstore.swagger.io/`).

El flujo de prueba incluye:
1.  Añadir una mascota (POST).
2.  Consultar la mascota (GET por ID).
3.  Actualizar el nombre y estatus a "sold" (PUT).
4.  Consultar la mascota por estatus "sold" (GET por Status).

---

## 1. Prerrequisitos

Para ejecutar este proyecto, se necesita el siguiente software configurado localmente:

* **Java Development Kit (JDK):** Versión 17 (o superior).
* **Gradle:** Versión 7.6.1 (la versión exacta con la que se desarrolló el proyecto).
* **Sistema Operativo:** Linux, macOS o Windows.
* Un IDE como IntelliJ IDEA o VSCode.

---

## 2. Comandos de instalación

Este proyecto utiliza el *wrapper* de Gradle, el cual maneja la descarga de dependencias automáticamente.

No se requiere un comando de instalación explícito. La primera vez que se ejecute el comando de prueba, Gradle descargará todas las dependencias listadas en el archivo `build.gradle`.

---

## 3. Instrucciones para ejecutar los test

Este proyecto utiliza el wrapper de Gradle, que asegura que se use la versión correcta (7.6.1) sin necesidad de instalarla manualmente.

1.  Abre una terminal en el directorio raíz del proyecto.
2.  Ejecuta el comando correspondiente a tu sistema operativo:

    **En Linux/macOS:**

    ```bash
    ./gradlew clean test
    ```

    **En Windows (CMD o PowerShell):**

    ```bash
    gradlew.bat clean test
    ```
    
    *(**Nota:** Se usa `clean test` en lugar de solo `test` para forzar a Gradle a borrar los reportes antiguos y ejecutar las pruebas desde cero, evitando problemas de caché `UP-TO-DATE`).*

3.  **Visualización del Reporte:**
    Una vez que la ejecución termine exitosamente, el reporte HTML de Cucumber se generará en la siguiente ruta:
    ```
    build/cucumber-html-report/cucumber-html-reports/overview-features.html
    ```
    Puedes abrir este archivo en cualquier navegador web para ver los resultados detallados.

---

## 4. Información adicional

* **Framework de Pruebas:** [Karate Framework (v1.4.0)].
* **Runner de Pruebas:** JUnit 5.
* **Reportes:** [net.masterthought:cucumber-reporting (v5.7.0)].