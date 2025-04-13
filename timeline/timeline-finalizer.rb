#!/usr/bin/ruby
require "json"
# Open JSON file
timeline_na = JSON.load_file 'temp/timeline.json'

# Modify each game object
timeline_na['games'].each do |game|
  developers = game['developers']
  next unless developers && !developers.empty? && game['releases']

  # Get the first developer's name (just the value)
  flat_developer = developers.first['developer'] rescue nil
  next unless flat_developer

  game['releases'].each do |release|
    release['developer'] = flat_developer
  end
end

File.write('results/timeline-complete.json', JSON.pretty_generate(timeline_na))

result = []

result = timeline_na["games"].find_all { |h1| h1['representative_name']}.map { |game| game['releases'] }

result = result.flatten
File.write('results/timeline-releases.json', JSON.pretty_generate(result))