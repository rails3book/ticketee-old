#!/usr/bin/env ruby
def features_for(params)
  Dir["features/*#{params}*.feature"]
end

def run(feature)
  puts "Running #{feature}"
  system("bundle exec cucumber #{feature}")
end


params = ARGV[0].split("").join("*")
features = Dir["features/#{params}*.feature"]
if features.size == 1
  run(features.first)
else
  puts "Reading your mind..."
  params = ARGV[0].split("").join("*_")
  p params
  features = features_for(params)
  if features.size == 1
    run(features.first)
  else
    puts "Found multiple features:"
    for feature in features
      puts "  #{feature}"
    end
    puts "Please be more precise."
  end
end

