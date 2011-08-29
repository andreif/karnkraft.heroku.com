Feature: Fetch new police reports
  In order to add new police reports
  As the site admin
  I want to fetch new reports and add them to the database
  
  Scenario: Fetch police reports
    Given I have no police reports
    When I go to the fetch police reports page
    Then I should have at least 10 police reports
    #And I should see "Found 10 police reports."

  Scenario: Show police reports
    Given I have no police reports
    And I have fetched police reports
    When I go to the police reports page
    Then I should see at least 10 police reports
