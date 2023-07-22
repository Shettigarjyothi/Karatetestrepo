Feature: To write the testcases for POST method

  Scenario: To test POST api
    Given url 'https://reqres.in/api/user'
    And request {"name": "Jyothi","job": "Test engineer", "id": "777","createdAt": "2023-05-31T14:09:30.846Z"}
    #And header Content-type = 'application/json'
    When method POST
    Then status 201
    And print response

  Scenario: to test get api01
    Given url 'https://reqres.in/api/user'
    When method GET
    Then status 200
    And print response

  Scenario: To test POST api using headers
    Given url 'https://reqres.in/api/user'
    And request {"name": "Jyothi","job": "Test engineer", "id": "777","createdAt": "2023-05-31T14:09:30.846Z"}
    And headers {Content-type : 'application/json',Accept : 'application/json'}
    When method POST
    Then status 201
    And print response
    And match response.name == "Jyothi"
    And assert response.id == 777

  Scenario: To test POST api by creating json file in src folder--> using variable
    Given url 'https://reqres.in/api/user'
    * def requestBody = read("payload.json")
    And request requestBody
    And headers {Content-type : 'application/json',Accept : 'application/json'}
    When method POST
    Then status 201
    And print response
    #And match response.name == "Jyothi"
    #And assert response.id == 777
    And match response == requestBody

  Scenario: To test POST api by creating json file in src folder--> without using variable
    Given url 'https://reqres.in/api/user'
    And request {"name": "subbu","job": "leader" }
    # request requestBody
    And headers {Content-type : 'application/json',Accept : 'application/json'}
    When method POST
    Then status 201
    And print response
    And def responsepost = read("postresponse.json")
    And print responsepost
    And match response == responsepost
