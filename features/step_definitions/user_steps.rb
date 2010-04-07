Given /^there is a user with the email address "([^\"]*)" and password "([^\"]*)"$/ do |email, password|
  @user = User.create!(:email => email, :password => password, :password_confirmation => password)
end

Given /^"([^\"]*)" has confirmed their account$/ do |email|
  User.find_by_email(email).confirm!
end
Given /^I am logged in as them$/ do
  steps(%Q{
    Given I am on the homepage
    When I follow "Login"
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "#{@user.password}"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  })
end
