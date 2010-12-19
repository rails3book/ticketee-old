Given /^I have run the seed task$/ do
  load Rails.root + "db/seeds.rb"
end

Given /^there is a project called "([^\"]*)"$/ do |name|
  @project = @account.projects.create!(:name => name)
end

Given /^there is an account:$/ do |table|
  @account = Account.create(table.hashes.first)
end
