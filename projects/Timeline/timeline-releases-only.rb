#!/usr/bin/ruby
file = File.open('results/timeline-complete-data.yml', "rb")
contents = file.read

# Remove everything not a hard release
contents = contents.gsub(/  compilations:.*?- game:\n/m, "- game:\n")
contents = contents.gsub(/  contributors:.*?- game:\n/m, "- game:\n")
contents = contents.gsub(/- game:\n.*?  releases:\n/m, "")
contents = contents.gsub(/  contributors:\n.*?community\/RFH\"\n/m, "")
contents = contents.gsub(/    - release:/, "- release:")
contents = contents.gsub(/      /, "  ")
contents = contents.gsub(/  rating: ".*?"\n/, "")
contents = contents.gsub(/  ESRB descriptors: ".*?"\n/, "")

# Fucking canceled games
contents = contents.gsub(/- release:\n  title: ".*?"\n  market: ".*?"\n  release_date: "0000-00-00"\n  publisher: ".*?"\n  barcode: ".*?"\n  boxart: ".*?"\n/, "")
contents = contents.gsub(/- release:\n  title: ".*?"\n  market: ".*?"\n  release_date: "0000-00-00"\n  publisher: ".*?"\n  boxart: ".*?"\n/, "")
contents = contents.gsub(/- release:\n  title: ".*?"\n  market: ".*?"\n  release_date: "0000-00-00"\n  publisher: ".*?"\n  id: ".*?"\n  boxart: ".*?"\n/, "")
contents = contents.gsub(/- release:\n  title: ".*?"\n  market: ".*?"\n  release_date: "0000-00-00 2021"\n  publisher: ".*?"\n  id: ".*?"\n  boxart: ".*?"\n/, "")
contents = contents.gsub(/- release:\n  title: ".*?"\n  market: ".*?"\n  release_date: "0000-00-00"\n  publisher: ".*?"\n  id: ".*?"\n  barcode: ".*?"\n  boxart: ".*?"\n/, "")

# Write changes to file
File.open('results/timeline-releases-only.yml', "w") {|file| file.puts contents}