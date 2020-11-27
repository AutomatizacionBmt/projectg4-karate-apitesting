Feature: Karate projects redmine test script

  Background:
    * url urlApp

  Scenario: Create a new project on redmine

    Given path 'projects.json'
    And header X-Redmine-API-Key = '54d992219a4d120df54d5a72cb152e8b89d20d65'
    And request read('project.json')
    When method post
    Then status 201


  Scenario: Create a new project on redmine with identifier dynamic
    * def numberRandom = function() {return (Math.floor(Math.random() * (900000)) + 100000).toString()}
    * def identifier = 'redmineproject' + numberRandom()

    Given path 'projects.json'
    And header X-Redmine-API-Key = '54d992219a4d120df54d5a72cb152e8b89d20d65'
    And request read('project2.json')
    When method post
    Then status 201


  Scenario Outline: Create a new project with parametrized values
    * def numberRandom = function() {return (Math.floor(Math.random() * (900000)) + 100000).toString()}
    * def identifier = 'redmineproject' + numberRandom()

    Given path 'projects.json'
    And header X-Redmine-API-Key = '54d992219a4d120df54d5a72cb152e8b89d20d65'
    And request read('project3.json')
    When method post
    Then status 201

    Examples:
    |read('projects.csv')|