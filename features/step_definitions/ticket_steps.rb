Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |ticket|
    @project.tickets.create!(ticket)
  end
end
