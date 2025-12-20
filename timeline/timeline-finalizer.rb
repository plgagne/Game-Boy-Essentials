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

# Corrections (AI written code)
corrections.each do |rule|
  key   = rule['key']
  value = rule['value']

  timeline_na.each do |game|
    # ---------- GAME-LEVEL MATCH ----------
    if game[key] == value
      case rule['action']
      when 'add_release'
        game['releases'] ||= []

        rule['releases'].each do |new_release|
          if rule['unique_by']
            next if game['releases'].any? do |r|
              r[rule['unique_by']] == new_release[rule['unique_by']]
            end
          end

          game['releases'] << new_release
        end

        next

      when 'delete'
        timeline_na.delete(game)
        next
      end

      if rule['updates']
        rule['updates'].each do |update_key, new_value|
          game[update_key] = new_value
        end
      end
    end

    next unless game['releases']

    # ---------- RELEASE-LEVEL MATCH ----------
    if rule['updates']
      game['releases'].each do |release|
        next unless release[key] == value

        rule['updates'].each do |update_key, new_value|
          release[update_key] = new_value
        end
      end
    elsif rule['action'] == 'delete'
      game['releases'].reject! { |release| release[key] == value }
    end
  end
end

# Sort representative name alphabetically
timeline_na = timeline_na.sort_by { |entry| entry["representative_name"] }

timeline_na.each do |game|
  next unless game['releases']

  game['releases'].sort! do |a, b|
    # Treat nil release_date as far in the future
    date_a = a['release_date'] || '9999-12-31'
    date_b = b['release_date'] || '9999-12-31'

    # Adjust unknown_release_month to end-of-year if set
    date_a = "#{date_a[0,4]}-12-31" if a['unknown_release_month']
    date_b = "#{date_b[0,4]}-12-31" if b['unknown_release_month']

    # Adjust unknown_release_day to end-of-month (string-only)
    date_a = "#{date_a[0,7]}-31" if a['unknown_release_day']
    date_b = "#{date_b[0,7]}-31" if b['unknown_release_day']

    # Compare by date first
    cmp = date_a <=> date_b

    # If dates are equal, reverse alphabetical market
    if cmp.zero?
      market_a = a['market'] || ''
      market_b = b['market'] || ''
      cmp = market_b <=> market_a
    end

    cmp
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