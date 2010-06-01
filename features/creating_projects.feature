Feature: Creating projects
  In order to have projects to assign tickets to
  As a user
  I want to create them easily

  Background:
    Given there is an admin with the email address "user@ticketee.com" and password "password"
    And "user@ticketee.com" has confirmed their account
    And I am logged in as them
    Given I am on the homepage
    When I follow "New Project"

  Scenario: Creating a project
    And I fill in "Name" with "Textmate 2"
    And I press "Create"
    Then I should see "Project has been created."
    And I should be on the project page for "Textmate 2"
    And I should see "Show - Projects - Ticketee"

  Scenario: Creating a project without a name
    And I press "Create"
    Then I should see "Project has not been created."
    Then I should see "Name can't be blank"
