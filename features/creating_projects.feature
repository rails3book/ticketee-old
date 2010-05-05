Feature: Creating projects
  In order to have projects to assign tickets to
  As a user
  I want to create them easily

  Scenario: Creating a project
    Given I am on the homepage
    When I follow "New Project"
    And I fill in "Name" with "Textmate 2"
    And I press "Create"
    Then I should see "Project has been created."
    And I should be on the project page for "Textmate 2"
    And I should see "Show - Projects - Ticketee"
