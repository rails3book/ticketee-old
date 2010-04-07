Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |ticket|
    @project.tickets.create!(ticket)
  end
end
