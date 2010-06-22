Given /^"([^"]*)" has permission to view the "([^"]*)" project$/ do |email, project|
  Permission.create(:user => User.find_by_email!(email), :object => Project.find_by_name!(project), :action => "read")
end
