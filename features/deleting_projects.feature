Feature: Deleting projects
  In order to remove needless projects
  As a project manager
  I want to make them disappear

  Background:
    Given there is an admin with the email address "admin@ticketee.com" and password "password"
    And I am logged in as them


  Scenario: Deleting a project
    Given there is a project called "TextMate 2"
    And I am on the homepage
    When I follow "TextMate 2"
    And I follow "Delete"
    Then I should see "Project has been deleted."
    Then I should not see "TextMate 2"
