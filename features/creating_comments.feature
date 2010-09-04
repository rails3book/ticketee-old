Feature: Creating comments
  In order to update a ticket's progress
  As a user
  I want to leave comments

  Background:
    Given there is a user with the email address "user@ticketee.com" and password "password"
    And I am signed in as them
    And there is a project called "Ticketee"
    And "user@ticketee.com" has created a ticket for this project:
      | title                   | description                                           |
      | Change a ticket's state | You should be able to create a comment and change it. |
    Given I am on the homepage
    And I follow "Ticketee"

  Scenario: Creating a comment
    When I follow "Change a ticket's state"
    And I fill in "Text" with "Added the ability to create a comment."
    And I press "Create Comment"
    Then I should see "Comment has been created."
    Then I should see "Added the ability to create a comment." within "#comments"

  Scenario: Creating an invalid comment
    When I follow "Change a ticket's state"
    And I press "Create Comment"
    Then I should see "Comment has not been created."
    And I should see "Text can't be blank"