#!/usr/bin/ruby
file = File.open("timeline2.yml", "rb")
contents = file.read
# Remove everything not a release
contents = contents.gsub(/- representative name: ".*?releases:......-/m, "&-")
contents = contents.gsub(/compilations:.*?".&-/m, "&-")
contents = contents.gsub(/contributors:.*?".&-/m, "&-")
contents = contents.gsub(/contributors:.*?\/oliist"/m, "")
# Write changes to file
File.open('timeline3.yml', "w") {|file| file.puts contents}