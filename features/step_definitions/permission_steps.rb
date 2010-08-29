Given /^"([^"]*)" can view the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "read")
end

Given /^"([^"]*)" can create tickets on the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "create tickets")
end

Given /^"([^"]*)" can edit tickets in the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "edit tickets")
end

Given /^"([^"]*)" can delete tickets from the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "delete tickets")
end

When /^I check "([^"]*)" for "([^"]*)"$/ do |permission, name|
  project = Project.find_by_name!(name)
  steps(%Q{When I check "permissions_#{project.id}_#{permission.downcase.gsub(" ", "_")}"})
end



def create_permission(email, object, action)
  Permission.create!(:user => User.find_by_email!(email), :object => object, :action => action)
end

def find_project(name)
  Project.find_by_name!(name)
end
