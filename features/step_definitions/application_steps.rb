Then /^I should see the "([^\"]*)" link$/ do |text|
  css("a").detect { |a| a.text == text }.should_not(be_nil,
    "Expected to see the #{text.inspect} link, but did not.")
end

Then /^I should not see the "([^\"]*)" link$/ do |text|
  css("a").detect { |a| a.text == text }.should(be_nil,
    "Expected to not see the #{text.inspect} link, but did.")
end

def css(selector)
  Nokogiri::HTML(body).css(selector)
end
