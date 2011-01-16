Given /^"([^\"]*)" has confirmed their account$/ do |email|
  User.find_by_email(email).confirm!
end

Given /^I am logged in as "([^\"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("Given I am logged in as them")
end

Given /^I am logged in as them$/ do
  steps(%Q{
    Given I am on the homepage
    When I follow "Login"
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  })
end

Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed")
    @user = User.create!(
      attributes.merge!(
        :password_confirmation => attributes[:password]
      )
    )
    @user.confirm! unless unconfirmed
  end
end
