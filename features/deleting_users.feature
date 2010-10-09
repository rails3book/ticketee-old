Feature: Deleting users
  In order to remove users
  As an admin
  I want to click a button and delete them

  Background:
    Given there are the following users:
      | email              | password | admin |
      | user@ticketee.com  | password | false |
      | admin@ticketee.com | password | true  |
    And I am signed in as "admin@ticketee.com"
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
