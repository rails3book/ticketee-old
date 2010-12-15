Feature: Creating an account
  In order to sign up for ticketee
  As a prospective user
  I want to be able to fill in my details on the sign up page
  
  Background:
    Given I am on the homepage
    And I follow "Sign up"

  Scenario: Signing up for an account
    And I fill in "Account Name" with "ticketee"
    And I fill in "Account Path" with "ticketee"
    And I fill in "Email" with "user@ticketee.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Create my account"
    Then I should see "Thanks for creating an account!"
    Then "user@ticketee.com" should receive 1 email
    When "user@ticketee.com" opens the email
    And I click the first link in the email
    Then I should see "There are no projects for this account yet!"
    
  Scenario: Accounts must be valid
    And I press "Create my account"
    Then I should see "Your account could not be created."
    Then I should see "Name can't be blank"
    And I should see "Path can't be blank"
    Then I should see "Owner email can't be blank"
    
  Scenario Outline: Accounts cannot use reserved names
    When I fill in "Account Name" with "<name>"
    And I fill in "Account Path" with "<name>"
    And I press "Create my account"
    Then I should see "Your account could not be created."
    Then I should see "Path is not allowed, please choose another."
  
    Examples:
      | name   |
      | admin  |
      | signup |