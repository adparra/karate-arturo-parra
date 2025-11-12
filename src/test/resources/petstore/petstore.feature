Feature: Prueba E2E de PetStore API

  Background:
    * url 'https://petstore.swagger.io/v2'
    
    # 1. Se define un template para usar como base al momento de hacer POST 
    * def petTemplate =
      """
{
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
      """
      
    # 2. Se genera un ID único
    * def petId = java.lang.System.currentTimeMillis()
    # 3. Se inserta el ID único en el id del template. Se hace lo mismo con el nombre
    * set petTemplate.id = petId
    * set petTemplate.name = "Kimbo"

  Scenario: Crear, consultar, actualizar y verificar una mascota

    # 1. Añadir una mascota a la tienda (POST /pet)
    Given path 'pet'
    And request petTemplate
    When method post
    Then status 200
    And match response == petTemplate

    * karate.pause(600)

    # 2. Consultar la mascota ingresada (GET /pet/{petId})
    Given path 'pet', petId
    When method get
    Then status 200
    And match response == petTemplate

    # 3. Actualizar el nombre y estatus (PUT /pet) 
    # Se modifica una copia del template original con los valores deseados.
    * def petSold = petTemplate
    * set petSold.name = "Kimbo Sold"
    * set petSold.status = "sold"

    Given path 'pet'
    And request petSold
    When method put
    Then status 200
    And match response.name == "Kimbo Sold"
    And match response.status == "sold"

    # 4. Consultar la mascota por estatus (GET /pet/findByStatus)
    Given path 'pet/findByStatus'
    And param status = 'sold'
    When method get
    Then status 200
    And match response contains petSold