Feature: Listing tickets
  In order to view the tickets for a project
  As a user
  I want to see them on that project's page

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
      | title           | description                   |
      |  Make it shiny! | Gradients! Starbursts! Oh my! |
    And there is a project called "Internet Explorer"
    And that project has a ticket:
      | title                | description   |
      | Standards compliance | Isn't a joke. |

    Given I am on the homepage

  Scenario: Viewing tickets for a given project
   When I follow "TextMate 2"
   Then I should see "Make it shiny!"
   And I should not see "Standards compliance"

   When I follow "Ticketee"
   And I follow "Internet Explorer"
   Then I should see "Standards compliance"
   And I should not see "Make it shiny!"

  Scenario: Viewing a single ticket
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
    Then I should be on the "Make it shiny!" ticket in the "TextMate 2" project
    And I should see "Gradients! Starbursts! Oh my!"

