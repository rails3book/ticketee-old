Feature: Ticket notifications
  In order to keep up to date with tickets
  As a user
  I want choose to receive, and actually receive notifications
  
  Background:
    Given there are the following users:
      | email              | password |
      | user@ticketee.com  | password |
      | user2@ticketee.com | password |
      
    Given a clear email queue

    Given there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project
    And "user2@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" has created a ticket for this project:
      | title        | description       |
      | Release date | TBA very shortly. |

    Given I am signed in as "user2@ticketee.com"        
    Given I am on the homepage

  Scenario: Ticket owner is automatically subscribed to a ticket
    When I follow "TextMate 2"
    And I follow "Release date"
    And I fill in "Text" with "Is it out yet?"
    And I press "Create Comment"
    
    Then "user@ticketee.com" should receive an email
    Then I click the first link in the email
    Then I should be on the "Release date" ticket page for "TextMate 2"
  
  
  
   