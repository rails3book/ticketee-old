Then /^the title should be "([^\"]*)"$/ do |title|
  Nokogiri::HTML(body).css("title").text.should eql(title)
end
