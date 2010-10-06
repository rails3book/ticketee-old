Given /^I have run the seed task$/ do
  load Rails.root + "db/seeds.rb"
end

Given /^there is a project called "([^\"]*)"$/ do |name|
  @project = Project.create!(:name => name)
end
