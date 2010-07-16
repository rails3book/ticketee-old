Feature: Hidden Links
  In order to not perform certain actions
  As a user
  I want certain links hidden from me

  Background:
    Given there is an user with the email address "user@ticketee.com" and password "password"
    Given there is an admin with the email address "admin@ticketee.com" and password "password"
    And there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project
    And I am on the homepage

  Scenario: New project link is hidden for signed-in users
    Given I am signed in as "user@ticketee.com"
    Then I should not see the "New Project" link

  Scenario: New project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    Then I should see the "New Project" link

  Scenario: Edit project link is hidden for signed-in users
    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should not see the "Edit" link

  Scenario: Edit project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see the "Edit" link

  Scenario: Delete project link is hidden for signed-in users
    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should not see the "Delete" link

  Scenario: Delete project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see the "Delete" link

  Scenario: Create ticket link is shown to a user with permission
    Given "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" can create tickets on the "TextMate 2" project
    And I am signed in as "user@ticketee.com" 
    When I follow "TextMate 2"
    Then I should see "New Ticket"

  Scenario: Create ticket link is hidden from a user without permission
    Given "user@ticketee.com" can view the "TextMate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should not see "New Ticket"

  Scenario: Create ticket link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see "New ticket"
