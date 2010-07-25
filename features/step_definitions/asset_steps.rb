Then /^the downloaded file should contain:$/ do |string|
  body.strip.should eql(string.strip)
end
