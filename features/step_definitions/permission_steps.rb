Given /^"([^"]*)" can ([^"]*) (on)?\s?the "([^"]*)" project$/ do |user, permission, project|
  create_permission(user, find_project(project), permission)
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
