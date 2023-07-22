Feature: To validate json Response

  Scenario: To validate json response for GET method01
    Given url 'https://gorest.co.in/public/v2/users'
    When method GET
    Then status 200
    And print response
    And match response.[0].email == 'vidhur_johar@weissnat-sanford.example'
    And match response.[0].id == 2223264
    And match response.[1].email == "ganaka_madhuri@buckridge.test"
    And match response.[3].name == "Rev. Shanti Butt"
    
    Scenario: To validate json response for GET method 02
    Given url 'https://gorest.co.in/public/v2/users'
    When method GET
    Then status 200
    And print response
   #validate size of json array
    #And match response.[0].name == '#[3]
   #validate using wild card char  --> used when you want to validate all the feilds 
    And match response.[0].name[*] == ['','','','']
    #validate using contains 
    And match response.[0].name[*] contains ['','','','']
    
    Scenario: To validate json response for GET method 02 using fuzzy matcher
    Given url 'https://gorest.co.in/public/v2/users'
    When method GET
    Then status 200
    And print response
    And match response.[2].email == '#present'
    And match response.[0].id == '#notnull'
    And match response.[1].email == '#ignore'
    And match response.[3].name == '#string'
    And match response.[2].id == '#number'