Feature: Deleting users
  In order to remove users
  As an admin
  I want to click a button and delete them

  Background:
    Given there is an admin with the email address "admin@ticketee.com" and password "password"
    And I am signed in as them

    And there is a user with the email address "user@ticketee.com" and password "password"
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Users"

  Scenario: Deleting a user
    When I follow "user@ticketee.com"
    And I follow "Delete"
    Then I should see "User has been deleted"

  Scenario: A user cannot delete themselves
    When I follow "admin@ticketee.com"
    And I follow "Delete"
    Then I should see "You cannot delete yourself!"
