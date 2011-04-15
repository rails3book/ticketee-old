Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed")
    @user = User.create!(
      attributes.merge!(
        :password_confirmation => attributes[:password]
      )
    )
    @user.admin = true if attributes["admin"] == "true"
    @user.confirm! unless unconfirmed
  end
end

Given /^"([^\"]*)" has not yet confirmed their account$/ do |email|
  User.find_by_email(email).update_attribute(:confirmed_at, nil)
end

Given /^I am signed in as "([^\"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("Given I am signed in as them")
end

Given /^I am signed in as them$/ do
  steps(%Q{
    Given I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  })
end

When /^this user confirms their account$/ do
  User.all.map(&:confirm!)
end