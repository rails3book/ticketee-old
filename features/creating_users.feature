Feature: Creating Users
  In order to add new users to the system
  As an admin
  I want to be able to add them through the backend

  Background:
    Given there is an admin with the email address "admin@ticketee.com" and password "password"
    And "admin@ticketee.com" has confirmed their account
    And I am logged in as them
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Users"

  Scenario: Creating a new user
    When I follow "New User"
    And I fill in "Email" with "newbie@ticketee.com"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "password"
    And I press "Create User"
    Then I should see "User has been created."

