Feature: Deleting users
  In order to remove users
  As an admin
  I want to click a button and delete them

  Background:
    Given there is an admin with the email address "admin@ticketee.com" and password "password"
    And "admin@ticketee.com" has confirmed their account
    And I am logged in as them

    And there is a user with the email address "user@ticketee.com" and password "password"
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@ticketee.com"

  Scenario: Deleting a user
    When I follow "Delete"
    Then I should see "User has been deleted"
