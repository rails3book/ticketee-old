Feature: Hidden Links
  In order to not perform certain actions
  As a user
  I want certain links hidden from me

  Background:
    Given there is an user with the email address "user@ticketee.com" and password "password"
    And "user@ticketee.com" has confirmed their account
    Given there is an admin with the email address "admin@ticketee.com" and password "password"
    And "admin@ticketee.com" has confirmed their account
    And there is a project called "TextMate 2"
    And I am on the homepage

  Scenario: New project link is hidden for non-logged-in users
    Then I should not see the "New Project" link

  Scenario: New project link is hidden for logged-in users
    Given I am logged in as "user@ticketee.com"
    Then I should not see the "New Project" link

  Scenario: New project link is shown to admins
    Given I am logged in as "admin@ticketee.com"
    Then I should see the "New Project" link

  Scenario: Edit project link is hidden for non-logged-in users
    When I follow "TextMate 2"
    Then I should not see the "Edit" link

  Scenario: Edit project link is hidden for logged-in users
    When I follow "TextMate 2"
    Then I should not see the "Edit" link

  Scenario: Edit project link is shown to admins
    Given I am logged in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see the "Edit" link

  Scenario: Delete project link is hidden for non-logged-in users
    When I follow "TextMate 2"
    Then I should not see the "Delete" link

  Scenario: Delete project link is hidden for logged-in users
    When I follow "TextMate 2"
    Then I should not see the "Delete" link

  Scenario: Delete project link is shown to admins
    Given I am logged in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see the "Delete" link
