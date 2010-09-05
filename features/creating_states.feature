Feature: Creating states
  In order to be able to specify other states for tickets
  As an admin
  I want to add them to the application

  Background: 
    Given there is an admin with the email address "admin@ticketee.com" and password "password"
    And I am signed in as them

  Scenario: Creating a state
    When I follow "Admin"
    And I follow "States"
    And I follow "New State"
    And I fill in "Name" with "Duplicate"
    And I press "Create State"
    Then I should see "State has been created."