#!/usr/bin/ruby
require "json"
file = File.open("temp/timeline-temp.tmp", "rb")
contents = file.read

# Remove every instance of two spaces
contents = contents.gsub(/  /, "")

# Remove all tabs
contents = contents.gsub(/\t/, "")

# Remove break spaces
contents = contents.gsub(/<br\ \/>/, "")
contents = contents.gsub(/\r/, "")

# Merge lines
contents = contents.gsub(/>\n/, ">")

# name and representative boxart
contents = contents.gsub(/<header\ class=\"page-header\">(.*?)background-image:url\(https:\/\/gamefaqs\.gamespot\.com\/(.*?)\.jpg(.*?)page-title\">(.*?)\ &ndash;(.*?)\n/, " - representative_name: \"\\4\"\n   representative_boxart: \"\\2.jpg\"\n\\5")

# related_version
contents = contents.gsub(/ Release Details(.*?)<span class="header_more(.*?)">/,"   related_version:\n")
contents = contents.gsub(/<span class="header_more" style="cursor: pointer">/, "")
contents = contents.gsub(/<i class="fa fa-caret-down">(.*?)<a href="https:\/\/gamefaqs.gamespot.com\/(.*?)"><span class="also_name">(.*?)<\/span><\/a>/, "    - \"\\3\"\n")
contents = contents.gsub(/<a href="https:\/\/gamefaqs.gamespot.com\/(.*?)"><span class="also_name">(.*?)<\/span><\/a>/, "    - \"\\2\"\n")
contents = contents.gsub(/<a href="\.\.\/(.*?)"><span class="also_name">(.*?)<\/span><\/a>/, "    - \"\\2\"\n")
contents = contents.gsub(/<\/div><\/span><\/h3>(.*?)<\/nav>/, "")
contents = contents.gsub(/<\/span><\/h3>(.*?)<\/nav>/, "")

# genre
contents = contents.gsub(/&gt; /, "&gt;")
contents = contents.gsub(/ &gt;/, "&gt;")
contents = contents.gsub(/<div\ class=\"pod\ pod_titledata\">(.*?)Genre:<\/dt><dd>(.*?)&gt;/, "   genre: [\"\\2&gt;")
contents = contents.gsub(/&gt;(.*?)/, "\", \"\\1")
contents = contents.gsub(/genre:(.*?)\n/, "genre:\\1\"]\n")

# developer
contents = contents.gsub(/<\/dd><dt>Developer:<\/dt><dd>(.*?)\n/, "   developers:\n<\/dd><dt>Developer:<\/dt><dd>\\1")
contents = contents.gsub(/<\/dd><dt>Developer:<\/dt><dd><a(.*?)>(.*?)<\/a>(.*?)/, "    - developer: \"\\2\"\n\\3")

# ESRB move
contents = contents.gsub(/<\/dd><dt>ESRB Descriptor\(s\):<\/dt><dd>(.*?)<\/dd>(.*?)\n/, "\\2\n{      ESRB_descriptors: \"\\1\"}")
contents = contents.gsub(/<\/dd><dt>ESRB Descriptor\(s\):<\/dt><dd>(.*?)\n/, "\n{      ESRB_descriptors: \"\\1\"}")
contents = contents.gsub(/{(.*?)}<\/dd>(.*?)\n/, "\\2\n{\\1}")

# players
contents = contents.gsub(/<\/dd><dt>Local Players:<\/dt><dd>(.*?)<\/dd><dt>/, "   players: \"\\1\"\n")
contents = contents.gsub(/<(.*?)>Local Players:<\/dt><dd>(.*?)\n/, "   players: \"\\2\"\n")

# wikipedia
contents = contents.gsub(/Wikipedia \(EN\):<\/dt><dd><a target="_blank" href=(.*?)>(.*?)<\/a>.*?/, "   wikipedia: \\1\n")
contents = contents.gsub(/{(.*?)}<(.*?)>Wikipedia \(EN\):<\/dt><dd><a target="_blank" href=(.*?)>(.*?)<\/a>.*?/, "   wikipedia: \\3\n{\\1}")
contents = contents.gsub(/<(.*?)>Wikipedia \(EN\):<\/dt><dd><a target="_blank" href=(.*?)>(.*?)<\/a>.*?/, "   wikipedia: \\2\n")

# releases
contents = contents.gsub(/<\/dd><\/dl><\/div><\/div>\n/, "")
contents = contents.gsub(/{(.*?)}(.*?)<td class="cregion">US<\/td>(.*?)\n/, "\\2<td class=\"cregion\">US<\/td>{\\1}\\3\n")
contents = contents.gsub(/<td class="cregion">US<\/td>{(.*?)}(.*?)<td class="cregion">US<\/td>/, "<td class=\"cregion\">US<\/td>{\\1}\\2<td class=\"cregion\">US<\/td>{\\1}")
contents = contents.gsub(/<.*?>Release Data.*?<tbody>/, "   releases:")
contents = contents.gsub(/<tr><td class="cbox" rowspan="2">(.*?)<td class="datarating">(.*?)<\/td><\/tr>/, "\n\\1\n      rating: \"\\2\"")
contents = contents.gsub(/<.*?src=".*?com(.*?)".*?<b>(.*?)<.*?"cregion">US<.*?{(.*?)}.*?href=".*?">(.*?)<.*?"datapid">(.*?)<.*?"datapid">(.*?)<.*?"cdate">(.*?)<.*?\n/, "    - title: \"\\2\"\n      market: \"US\"\n      release_date: \"\\7\"\n      publisher: \"\\4\"\n      id: \"\\5\"\n      barcode: \"\\6\"\n      boxart: \"\\1\"\n\\3\n")
contents = contents.gsub(/<.*?src=".*?com(.*?)".*?<b>(.*?)<.*?"cregion">(.*?)<.*?href=".*?">(.*?)<.*?"datapid">(.*?)<.*?"datapid">(.*?)<.*?"cdate">(.*?)<.*?\n/, "    - title: \"\\2\"\n      market: \"\\3\"\n      release_date: \"\\7\"\n      publisher: \"\\4\"\n      id: \"\\5\"\n      barcode: \"\\6\"\n      boxart: \"\\1\"\n")
contents = contents.gsub(/<\/tbody><\/table><\/div><\/div>/, "")
contents = contents.gsub(/"&nbsp;"/, "")

# compilation
contents = contents.gsub(/<div class="pod">.*?ompilation.*?<\/colgroup>/, "   compilations:\n")
contents = contents.gsub(/<tr><td><a href=".*?">(.*?)<\/a><\/td><td>(.*?)<\/td><\/tr>/, "    - compilation:\n      compilation_title: \"\\1\"\n      platform: \"\\2\"\n")
contents = contents.gsub(/<\/table><\/div><\/div>\n/, "")

# contributor
contents = contents.gsub(/<\/p><\/div><\/div>\n/, "\n")
contents = contents.gsub(/<div class="pod contrib"><div class="head"><h2 class="title">Contributions.*?\n/, "   contributors:\n")
contents = contents.gsub(/<a(.*?)<\/a>.*?<a/, "<a\\1<\/a>\n<a")
contents = contents.gsub(/<a(.*?)<\/a>.*?\n/, "<a\\1<\/a>\n")
contents = contents.gsub(/<a href=(.*?)>(.*?)<\/a>/, "    - name: \"\\2\"\n      link: \\1")

# description
contents = contents.gsub(/(^[\S])(.*?)\n/, "")

# Cleanup
contents = contents.gsub(/<\/dd>/, "")
contents = contents.gsub(/_thumb.jpg/, "_front.jpg")
contents = contents.gsub(/"\.- representative_name: /, "\"\n- representative_name: \n")
contents = contents.gsub(/ - game:\n/, "")
contents = contents.gsub(/contributors: \n/, "contributors:\n")
contents = contents.gsub(/     - name:/, "    - name:")
contents = contents.gsub(/      barcode: \n/, "")
contents = contents.gsub(/      id: \n/, "")
contents = contents.gsub(/rating: \n/, "")
contents = contents.gsub(/            boxart:/, "      boxart:")
contents = contents.gsub(/          - title:/, "    - title:")
contents = contents.gsub(/  <\/dl>"/, "")
contents = contents.gsub(/ \*All 12 Major League Soccer teams with every player in home and away uniforms \n/, "")
contents = contents.gsub(/ \*Teams from 15 of the world's top leagues, including England, Italy, and Germany\n/, "")
contents = contents.gsub(/ \*45 National teams\n/, "")
contents = contents.gsub(/Toys "R" Us/, "Toys R Us")
contents = contents.gsub(/Yu Yu Hakusho "2"/, "Yu Yu Hakusho 2")
contents = contents.gsub(/Zool: Ninja of the "Nth" Dimension/, "Zool: Ninja of the Nth Dimension")
contents = contents.gsub(/ It's a breakaway bash in this wild new Kirby game of Block Ball!.*?\n/, "")
contents = contents.gsub(/- developer: "(.*?)"\n    - title: "(.*?)"/, "- developer: \"\\1\"\n   releases:\n    - title: \"\\2\"")

# Adjusting the release dates to YYYY/MM/DD
contents = contents.gsub(/release_date: "(.*?)\/(.*?)\/(.*?)"/, "release_date: \"19\\3-\\1-\\2\"")
contents = contents.gsub(/release_date: "19([0-2][0-9])-(.*?)-(.*?)"/, "release_date: \"20\\1-\\2-\\3\"")
contents = contents.gsub(/release_date: "([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-00-00\"")
contents = contents.gsub(/release_date: "January ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-01-00\"")
contents = contents.gsub(/release_date: "February ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-02-00\"")
contents = contents.gsub(/release_date: "March ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-03-00\"")
contents = contents.gsub(/release_date: "April ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-04-00\"")
contents = contents.gsub(/release_date: "May ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-05-00\"")
contents = contents.gsub(/release_date: "June ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-06-00\"")
contents = contents.gsub(/release_date: "July ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-07-00\"")
contents = contents.gsub(/release_date: "August ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-08-00\"")
contents = contents.gsub(/release_date: "September ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-09-00\"")
contents = contents.gsub(/release_date: "October ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-10-00\"")
contents = contents.gsub(/release_date: "November ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-11-00\"")
contents = contents.gsub(/release_date: "December ([1-2])([0-9])([0-9])([0-9])"/, "release_date: \"\\1\\2\\3\\4-12-00\"")
contents = contents.gsub(/release_date: \"TBA/, "release_date: \"0000-00-00")
contents = contents.gsub(/release_date: \"Canceled/, "release_date: \"0000-00-00")

# Adjusting the market from US to NA
contents = contents.gsub(/market: \"US\"/, "market: \"NA\"")

# Switching empty image location
contents = contents.gsub(/boxart: "\/a\/images\/site\/noboxshot_wide_thumb.gif"/, "boxart: \"/no_cover.png\"")

# Remove blank lines
contents = contents.gsub(/^[[:space:]]*$|^#/, "")
contents = contents.gsub(/\n+|\r+/, "\n").squeeze("\n").strip

# Canceled games
# 1
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n    - title:/, "    - title:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n    - title:/, "    - title:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n    - title:/, "    - title:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n    - title:/, "    - title:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n    - title:/, "    - title:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n    - title:/, "    - title:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n    - title:/, "    - title:")
# 2
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n +contributors:/, "   contributors:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n +contributors:/, "   contributors:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n +contributors:/, "   contributors:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n +contributors:/, "   contributors:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n +contributors:/, "   contributors:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n +contributors:/, "   contributors:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n +contributors:/, "   contributors:")
# 3
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n +- representative_name:/, " - representative_name:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n +- representative_name:/, " - representative_name:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n +- representative_name:/, " - representative_name:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n +- representative_name:/, " - representative_name:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n +- representative_name:/, " - representative_name:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n +- representative_name:/, " - representative_name:")
contents = contents.gsub(/- title: ".*?"\n.*?\n +release_date: "0000-00-00"\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n.*?\n +- representative_name:/, " - representative_name:")

contents = contents.gsub(/ +contributors:/, "   contributors:")
contents = contents.gsub(/ +- representative_name:/, " - representative_name:")

# Unknown release dates
contents = contents.gsub(/release_date: "0000-00-00 2021"/, "release_date: \"2021-01-00\"")
contents = contents.gsub(/release_date: "(.*?)-(.*?)-00"/, "release_date: \"\\1-\\2-01\"")
contents = contents.gsub(/release_date: "(.*?)-00-(.*?)"/, "release_date: \"\\1-01-\\2\"\n      unknown_release_month: true")

# Correcting errors
contents = contents.gsub(/title: "Disney's DuckTales"\n       market: "EU"\n       release_date: "1989-00-00"/, "title: \"Disney's DuckTales\"\n       market: \"EU\"\n       release_date: \"1991-00-00\"")
contents = contents.gsub(/title: "Ghostbusters II"\n       market: "EU"\n       release_date: "1989-00-00"/, "title: \"Ghostbusters II\"\n       market: \"EU\"\n       release_date: \"1991-00-00\"")
contents = contents.gsub(/publisher: "Sony Imagesoft"\n       id: "DMG-DH"/, "publisher: \"Sony Imagesoft\"\n       id: \"DMG-D4\"")
contents = contents.gsub(/publisher: "Activision"\n       id: "CGB-B2XE-USA"/, "publisher: \"Activision\"\n       id: \"CGB-BM5E-USA\"")
contents = contents.gsub(/publisher: "NewKidCo"\n       id: "CGB-BSOE-USA"/, "publisher: \"Activision\"\n       id: \"CGB-BSQE-USA\"")

contents.prepend("---\ngames:\n ")

# Write changes to file
File.open('temp/timeline.yml', "w") {|file| file.puts contents}