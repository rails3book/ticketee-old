Then /^I should see (\d+) pages of pagination$/ do |number|
  pages = css(".pagination .page")
  pages.count.should eql(number.to_i)
end

Then /^I see page (\d+) of tickets for this project$/ do |number|
  current_page = css(".pagination .current").text
  current_page.should eql(number)
end
