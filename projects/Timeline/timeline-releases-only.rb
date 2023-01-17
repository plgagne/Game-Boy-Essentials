#!/usr/bin/ruby
file = File.open('results/timeline-complete-data.yml', "rb")
contents = file.read
# Remove everything not a release
contents = contents.gsub(/  compilations:.*?- game:\n/m, "- game:\n")
contents = contents.gsub(/  contributors:.*?- game:\n/m, "- game:\n")
contents = contents.gsub(/- game:\n.*?  releases:\n/m, "")
contents = contents.gsub(/  contributors:\n.*?community\/RFH\"\n/m, "")
contents = contents.gsub(/    - release:/, "- release:")
contents = contents.gsub(/      /, "  ")

# Write changes to file
File.open('results/timeline-releases-only.yml', "w") {|file| file.puts contents}