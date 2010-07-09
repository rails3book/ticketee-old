Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes

  Background:
    Given there is an admin with the email address "admin@ticketee.com" and password "password"
    And I am signed in as them
    
    And there is a user with the email address "user@ticketee.com" and password "password"
    And there is a project called "TextMate 2"
    And there is a project called "Internet Explorer"
 
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@ticketee.com"
    And I follow "Permissions"

  Scenario: Viewing a project
    When I check "Read" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    
    Given I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"     
    And I should not see "Internet Explorer"

  Scenario: Creating tickets for a project
    When I check "Read" for "TextMate 2"
    When I check "Create tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "New Ticket"
    And I fill in "Title" with "Shiny!"
    And I fill in "Description" with "Make it so!"
    And I press "Create"
    Then I should see "Ticket has been created."


