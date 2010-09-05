Feature: Creating comments
  In order to update a ticket's progress
  As a user
  I want to leave comments

  Background:
    Given there is a user with the email address "user@ticketee.com" and password "password"
    And I am signed in as them
    And there is a project called "Ticketee"
    And "user@ticketee.com" can view the "Ticketee" project
    And "user@ticketee.com" has created a ticket for this project:
      | title                   | description                                           |
      | Change a ticket's state | You should be able to create a comment and change it. |
    Given I am on the homepage
    And I follow "Ticketee" within "#projects"
    Given there is a state called "Open"

  Scenario: Creating a comment
    Given "user@ticketee.com" can create comments on the "Ticketee" project
    When I follow "Change a ticket's state"
    And I fill in "Text" with "Added the ability to create a comment."
    And I press "Create Comment"
    Then I should see "Comment has been created."
    Then I should see "Added the ability to create a comment." within "#comments"

  Scenario: Creating an invalid comment
    Given "user@ticketee.com" can create comments on the "Ticketee" project
    When I follow "Change a ticket's state"
    And I press "Create Comment"
    Then I should see "Comment has not been created."
    And I should see "Text can't be blank"
    
  Scenario: Users cannot create a comment without permission
    And I follow "Change a ticket's state"
    Then I should not see "New comment"
    
  Scenario: Changing a ticket's state
    Given "user@ticketee.com" can create comments on the "Ticketee" project
    When I follow "Change a ticket's state"
    When I fill in "Text" with "This is a real issue"
    And I select "Open" from "State"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    And I should see "Open" within "#ticket #state"
    Then I should see "State: → Open" within "#comments"