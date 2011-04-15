Feature: Twitter auth
  In order to sign in using Twitter
  As a Twitter user
  I want to click an icon and be signed in
  
  Background:
    Given I have mocked a successful Twitter response
  
  Scenario: Logging in with Twitter
    Given I am on the homepage
    And I follow "sign_in_with_twitter"
    Then I should see "Signed in with Twitter successfully."
    Then I should see "Signed in as A Twit (@twit)"
    