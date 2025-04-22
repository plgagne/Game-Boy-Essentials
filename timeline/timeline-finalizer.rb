#!/usr/bin/ruby
require "json"
require "yaml"

# Open json file
timeline_na = JSON.load_file 'temp/timeline.json'
corrections = YAML.load_file 'corrections.yml'

# Add developer to each release (AI written code)
timeline_na.each do |game|
  developers = game['developers']
  next unless developers && !developers.empty? && game['releases']

  flat_developer = developers.first['developer'] rescue nil
  next unless flat_developer

  game['releases'].each do |release|
    release['developer'] = flat_developer
  end
end

# Sort
timeline_na = timeline_na.sort_by { |entry| entry["representative_name"] }

# Corrections (AI written code)
corrections.each do |rule|
  key = rule['key']
  value = rule['value']

  timeline_na.each do |game|
    next unless game['releases']

    # SAFELY modify releases array
    if rule.key?('updates')
      game['releases'].each do |release|
        if release[key] == value
          rule['updates'].each do |update_key, new_value|
            release[update_key] = new_value
          end
        end
      end
    elsif rule['action'] == 'delete'
      game['releases'].reject! { |release| release[key] == value }
    end
  end
end

# Finish timeline-complete
File.write('results/timeline-complete.json', JSON.pretty_generate(timeline_na))

# Extract all releases
result = []
result = timeline_na.find_all { |h1| h1['representative_name']}.map { |game| game['releases'] }

# Remove all depth to the array
result = result.flatten

# Remove empty objects
result.compact!

# Sort by release date
sorted_result = result.sort_by { |game| game['release_date'] || '' }

# Working sort
sorted_result_nocoverontop = sorted_result.sort_by do |entry|
  [
    entry['boxart'] == '/no_cover.png' ? 0 : 1,
    entry['market']
  ]
end

File.write('results/timeline-releases.json', JSON.pretty_generate(sorted_result))
File.write('results/timeline-releases-nocoverontop.json', JSON.pretty_generate(sorted_result_nocoverontop))