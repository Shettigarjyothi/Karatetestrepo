Feature: Practice API tests

  Background: Background for the API calls
    Given url 'https://reqres.in'
    And print 'APiResponse'

  Scenario: Test a sample GEt api 01
    Given url 'https://reqres.in/api/users?page=2'
    And header Accept = 'application/json'
    When method GET
    Then status 200

  Scenario: Test a sample GEt api and path 02
    #Given url 'https://reqres.in'
    And path '/api/users?page=2'
    And header Accept = 'application/xml'
    When method GET
    Then status 200
    And print response 

 
  Scenario: To Print Response for Get method 03
    #Given url 'https://reqres.in'
    And path '/api/users?page=2'
    And header Accept = 'application/xml'
    When method GET
    Then status 200 
    And print response  
    And match response ==
    """
    {
  "page": 1,
  "per_page": 6,
  "total": 12,
  "total_pages": 2,
  "data": [
    {
      "id": 1,
      "name": "cerulean",
      "year": 2000,
      "color": "#98B2D1",
      "pantone_value": "15-4020"
    },
    {
      "id": 2,
      "name": "fuchsia rose",
      "year": 2001,
      "color": "#C74375",
      "pantone_value": "17-2031"
    },
    {
      "id": 3,
      "name": "true red",
      "year": 2002,
      "color": "#BF1932",
      "pantone_value": "19-1664"
    },
    {
      "id": 4,
      "name": "aqua sky",
      "year": 2003,
      "color": "#7BC4C4",
      "pantone_value": "14-4811"
    },
    {
      "id": 5,
      "name": "tigerlily",
      "year": 2004,
      "color": "#E2583E",
      "pantone_value": "17-1456"
    },
    {
      "id": 6,
      "name": "blue turquoise",
      "year": 2005,
      "color": "#53B0AE",
      "pantone_value": "15-5217"
    }
  ],
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
}
    """
    
    
    Scenario: To Print Response for Get method 04
    #Given url 'https://reqres.in'
    And path '/api/users?page=2'
    And header Accept = 'application/xml'
    When method GET
    Then status 200 
    And print response  
    And match response.total == 12
    And match response.page == 1
    And match response.per_page == 6
    
     
    Scenario: To Print Response for Get method 05
    #Given url 'https://reqres.in'
    And path '/api/users?page=2'
    And header Accept = 'application/xml'
    When method GET
    Then status 200 
    And print response  
    And match response.total == 12      
    #match is more powerfull and faster compared to assert   
    And match response.data[0].id == 1     
    #match doesnt allow any conditional logics except not equal(!=)
    And match response.data[2].color == "#BF1932"
    And assert response.data[1].year == 2001
    And assert response.data[0].id >= 1   
     #assert any allow conditional logic 
   #And match response.data[0].id >= 1  ---->yo cannot apply logic conditions to match 
    
    
    Scenario: To Print Response for Get method 06
    #Given url 'https://reqres.in'
    And path '/api/users?page=2'
    And header Accept = 'application/xml'
    When method GET
    Then status 200 
    And print response  
    And match response.total == 12      
    #match is more powerfull and faster compared to assert   
    And match response.data[0].id == 1     
    #match doesnt allow any conditional logics except not equal(!=)
    And match response.data[2].color == "#BF1932"
    