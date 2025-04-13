#!/usr/bin/ruby
require "json"
# Open json file
timeline_na = JSON.load_file 'temp/timeline.json'

# Add developer to each release (AI written code)
timeline_na['games'].each do |game|
  developers = game['developers']
  next unless developers && !developers.empty? && game['releases']

  flat_developer = developers.first['developer'] rescue nil
  next unless flat_developer

  game['releases'].each do |release|
    release['developer'] = flat_developer
  end
end

File.write('results/timeline-complete.json', JSON.pretty_generate(timeline_na))

# Extract all releases
result = []
result = timeline_na["games"].find_all { |h1| h1['representative_name']}.map { |game| game['releases'] }

# Remove all depth to the array
result = result.flatten

# Sort
sorted_result = result.sort_by { |game| game['release_date'] }

File.write('results/timeline-releases.json', JSON.pretty_generate(sorted_result))