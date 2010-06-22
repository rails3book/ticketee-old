Feature: Listing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

  Background:
    Given there is a user with the email address "user@ticketee.com" and password "password"
    And there is a project called "TextMate 2"
    And "user@ticketee.com" has permission to view the "TextMate 2" project

  Scenario: Listing all projects
    Given there is a project called "TextMate 2"
    And I am on the homepage
    When I follow "TextMate 2"
    Then I should be on the project page for "TextMate 2"
