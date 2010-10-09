Feature: Ticket notifications
  In order to keep up to date with tickets
  As a user
  I want choose to receive, and actually receive notifications
  
  Background:
    Given there are the following users:
      | email              | password |
      | user@ticketee.com  | password |
      | user2@ticketee.com | password |
      
    And I am signed in as "user@ticketee.com"
    Given there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" has created a ticket for this project:
      | title        | description       |
      | Release date | TBA very shortly. |
    Given I am on the homepage
  

  Scenario: Receiving a ticket update notification
    When I follow "TextMate 2"
    And I follow "Release date"
    And I press "Watch this ticket"
    When I follow "Sign out"
    
    Given I am signed in as "user2@ticketee.com"
    And I follow "TextMate 2"
    And I follow "Release date"
    And I fill in "Text" with "Any day now!"
    And I press "Create Comment"
    
    Then "user@ticketee.com" should receive an email
  
  
  
   