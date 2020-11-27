Feature: Issues redmine test script

  Background:
    * url urlApp

    Scenario: Get issues list by JSON
      Given path 'issues.json'
      When method get
      Then status 200

    Scenario:  Get issue by id - JSON
      * def idIssue = 2

      Given path 'issues/'+idIssue+'.json'
      When method get
      Then status 200
      And match response.issue.id == 2
      And match response.issue.status.name == 'New'
      And match response.issue.priority.name == 'Low'
      And match response.issue.author.name == 'Redmine Admin'
      And match response.issue.author.name contains 'Admin'
      And match response.issue.subject == 'I cannot create a user xml.'
      And match response.issue.is_private == false
      And match response.issue.created_on == '2020-01-16T11:17:25Z'

    #Shema validation: https://github.com/intuit/karate#schema-validation
    Scenario: Get issue by id - Validate JSON SCHEMA
      * def idIssue = 2

      Given path 'issues/'+idIssue+'.json'
      When method get
      Then status 200
      And match response.issue.id == 2
      And match response.issue.subject == '#string'
      And match response.issue ==
      """
      {
              id: '#number',
              project: '#ignore',
              tracker: '#ignore',
              status: {
                id: '#number? _ >= 0',
                name: '#string',
              },
              priority: '#ignore',
              author: '#ignore',
              assigned_to: {
                id: '#number',
                name: '#string'
              },
              subject: '#string',
              description: '#string',
              start_date: '#string',
              due_date: '## #string',
              done_ratio: '#notnull',
              is_private: '#boolean',
              estimated_hours: '#ignore',
              total_estimated_hours: '#ignore',
              spent_hours: '#ignore',
              total_spent_hours: '#number? _ == 0',
              created_on: '#ignore',
              updated_on: '#ignore',
              closed_on: '##'
          }
      """
  Scenario: Crear un nuevo Issue y eliminarlo

  * def bodyIssue =
      """
      {
        "issue": {
          "project_id": 1,
          "subject": "Issue creado desde Karate DSL",
          "priority_id": 4
        }
      }
      """
      Given path 'issues.json'
      And header X-Redmine-API-Key = '54d992219a4d120df54d5a72cb152e8b89d20d65'
      And request bodyIssue
      When method post
      Then status 201

      * def idIssue = response.issue.id
      * print 'Issue created id is: ', idIssue

      Given path 'issues/' +idIssue+ '.json'
      And header X-Redmine-API-Key = '54d992219a4d120df54d5a72cb152e8b89d20d65'
      When method delete
      Then status 204


   Scenario: Crear un nuevo Issue y actualizarlo

     * def bodyIssue =
      """
      {
        "issue": {
          "project_id": 1,
          "subject": "Issue creado desde Karate DSL",
          "priority_id": 4
        }
      }
      """
     Given path 'issues.json'
     And header X-Redmine-API-Key = '54d992219a4d120df54d5a72cb152e8b89d20d65'
     And request bodyIssue
     When method post
     Then status 201

     * def idIssue = response.issue.id
     * print 'Issue created id is: ', idIssue
     
     Given path 'issues/' +idIssue+ '.json'
     And header X-Redmine-API-Key = '54d992219a4d120df54d5a72cb152e8b89d20d65'
     And request
     """
     {
      "issue": {
        "subject": "Issue modificado por JHHA desde Karate DSL",
        "priority_id" : 5,
        "notes": "The subject was changed"
      }
     }
     """
     When method put
     Then status 204
