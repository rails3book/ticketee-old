Given /^there is a project called "([^\"]*)"$/ do |name|
  @project = Project.create!(:name => name)
end
