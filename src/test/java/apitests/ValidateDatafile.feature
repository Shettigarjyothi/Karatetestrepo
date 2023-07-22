Feature: To validate data stored in External file

  Scenario: To verify the  Data store in  external file
    Given url 'https://reqres.in/api/users/2'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    * def responseBody = read("sampleData.json")
    And request responseBody
    And match response == responseBody
    And print response
