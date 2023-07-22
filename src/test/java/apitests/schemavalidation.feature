Feature: SChema validation tests

  Scenario: To verify the schemavalidation for GET request and  validate Response using Fuzzy matcher and JS expression
    Given url 'https://reqres.in/api/users/3'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    And match response ==
      """
      {
        "data": {
          "id": '#number',
          "email": '#string',
          "first_name": '#string',
          "last_name": '#string',
          "avatar":'#present'
        },
        "support": '#ignore'
      }
      """

  Scenario: To validate Response using Fuzzy matcher and JS expression
    Given url 'https://reqres.in/api/users?page=1&id=1'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    And match response.data.id == 1 
    And match response.data.id == '#? _ == 1'
    #_ is self variable and during runtime karate framework is going to replace self variable with response.data.id and then it will do the comparison
