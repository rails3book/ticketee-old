Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes

  Background:
    Given there is an admin with the email address "admin@ticketee.com" and password "password"
    And I am signed in as them
    
    And there is a user with the email address "user@ticketee.com" and password "password"
    And there is a project called "TextMate 2"
 
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@ticketee.com"
    And I follow "Permissions"

  Scenario: Viewing a project
    When I check "Read" for "TextMate 2"
    And I logout
    
    Given I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"     
