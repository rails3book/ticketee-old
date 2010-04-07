Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |ticket|
    @project.tickets.create!(ticket.merge!(:user => User.find_by_email!(email)))
  end
end
