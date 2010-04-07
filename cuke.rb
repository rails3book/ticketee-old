#!/usr/bin/env ruby
params = ARGV[0].split("").join("*")
features = Dir["features/*#{params}*.feature"]
if features.size == 1
  puts "Running #{features.first}"
  system("bundle exec cucumber #{features.first}")
else
  puts "Found multiple features:"
  for feature in features
    puts "  #{feature}"
  end
  puts "Please be more precise."
end
