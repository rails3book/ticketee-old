Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    ticket = @project.tickets.create!(attributes.merge!(:user => User.find_by_email!(email)))
    ticket.tag!(tags) if tags
  end
end
