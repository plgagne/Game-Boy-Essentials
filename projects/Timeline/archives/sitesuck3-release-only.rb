#!/usr/bin/ruby
file = File.open("/Users/plgagne/sitesuck/gbe-timeline.yaml", "rb")
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
# title and representative boxart

contents = contents.gsub(/<header\ class=\"page-header\">(.*?)background-image:url\(https:\/\/gamefaqs\.gamespot\.com\/(.*?)\.jpg(.*?)page-title\">(.*?)\ &ndash;(.*?)\n/, "")

# related version

contents = contents.gsub(/ Release Details(.*?)<span class="header_more(.*?)">/,"")
contents = contents.gsub(/<span class="header_more" style="cursor: pointer">/, "")
contents = contents.gsub(/<i class="fa fa-caret-down">(.*?)<a href="https:\/\/gamefaqs.gamespot.com\/(.*?)"><span class="also_name">(.*?)<\/span><\/a>/, "")
contents = contents.gsub(/<a href="https:\/\/gamefaqs.gamespot.com\/(.*?)"><span class="also_name">(.*?)<\/span><\/a>/, "")
contents = contents.gsub(/<a href="\.\.\/(.*?)"><span class="also_name">(.*?)<\/span><\/a>/, "")
contents = contents.gsub(/<\/div><\/span><\/h3>(.*?)<\/nav>/, "")
contents = contents.gsub(/<\/span><\/h3>(.*?)<\/nav>/, "")

# genre

contents = contents.gsub(/&gt; /, "")
contents = contents.gsub(/ &gt;/, "")
contents = contents.gsub(/<div\ class=\"pod\ pod_titledata\">(.*?)Genre:<\/dt><dd>(.*?)&gt;/, "")
contents = contents.gsub(/&gt;(.*?)/, "")
contents = contents.gsub(/genre:(.*?)\n/, "")

# developer

contents = contents.gsub(/<\/dd><dt>Developer:<\/dt><dd>(.*?)\n/, "proutproutdevelopers: \n<\/dd><dt>Developer:<\/dt><dd>\\1")
contents = contents.gsub(/<\/dd><dt>Developer:<\/dt><dd><a(.*?)>(.*?)<\/a>(.*?)/, "    - developer: \"\\2\"\n\\3proutprout")

# ESRB move

contents = contents.gsub(/<\/dd><dt>ESRB Descriptor\(s\):<\/dt><dd>(.*?)<\/dd>(.*?)\n/, "\\2\n{ESRB descriptors: \"\\1\"}")
contents = contents.gsub(/<\/dd><dt>ESRB Descriptor\(s\):<\/dt><dd>(.*?)\n/, "\n{ESRB descriptors: \"\\1\"}")
contents = contents.gsub(/{(.*?)}<\/dd>(.*?)\n/, "\\2\n{\\1}")

# players

contents = contents.gsub(/<\/dd><dt>Local Players:<\/dt><dd>(.*?)<\/dd><dt>/, "  players: \"\\1\"\n")
contents = contents.gsub(/<(.*?)>Local Players:<\/dt><dd>(.*?)\n/, "  players: \"\\2\"\n")

# wikipedia

contents = contents.gsub(/Wikipedia \(EN\):<\/dt><dd><a target="_blank" href=(.*?)>(.*?)<\/a>.*?/, "")
contents = contents.gsub(/{(.*?)}<(.*?)>Wikipedia \(EN\):<\/dt><dd><a target="_blank" href=(.*?)>(.*?)<\/a>.*?/, "")
contents = contents.gsub(/<(.*?)>Wikipedia \(EN\):<\/dt><dd><a target="_blank" href=(.*?)>(.*?)<\/a>.*?/, "")

# releases

contents = contents.gsub(/<\/dd><\/dl><\/div><\/div>\n/, "")
contents = contents.gsub(/{(.*?)}(.*?)<td class="cregion">US<\/td>(.*?)\n/, "\\2<td class=\"cregion\">US<\/td>{\\1}\\3\n")
contents = contents.gsub(/<td class="cregion">US<\/td>{(.*?)}(.*?)<td class="cregion">US<\/td>/, "<td class=\"cregion\">US<\/td>{\\1}\\2<td class=\"cregion\">US<\/td>{\\1}")
contents = contents.gsub(/<.*?>Release Data.*?<tbody>/, "  releases: ")
contents = contents.gsub(/<tr><td class="cbox" rowspan="2">(.*?)<td class="datarating">(.*?)<\/td><\/tr>/, "\n\\1\n      - rating: \"\\2\"")
contents = contents.gsub(/<.*?src=".*?com(.*?)".*?<b>(.*?)<.*?"cregion">US<.*?{(.*?)}.*?href=".*?">(.*?)<.*?"datapid">(.*?)<.*?"datapid">(.*?)<.*?"cdate">(.*?)<.*?\n/, "    - release: \n      - title: \"\\2\"\n      - market: \"US\"\n      - release date: \"\\7\"\n      - publisher: \"\\4\"\n      - id: \"\\5\"\n      - barcode: \"\\6\"\n      - boxart: \"\\1\"\n      - \\3\n")
contents = contents.gsub(/<.*?src=".*?com(.*?)".*?<b>(.*?)<.*?"cregion">(.*?)<.*?href=".*?">(.*?)<.*?"datapid">(.*?)<.*?"datapid">(.*?)<.*?"cdate">(.*?)<.*?\n/, "    - release: \n      - title: \"\\2\"\n      - market: \"\\3\"\n      - release date: \"\\7\"\n      - publisher: \"\\4\"\n      - id: \"\\5\"\n      - barcode: \"\\6\"\n      - boxart: \"\\1\"\n")
contents = contents.gsub(/<\/tbody><\/table><\/div><\/div>/, "")
contents = contents.gsub(/"&nbsp;"/, "")

# compilation

contents = contents.gsub(/<div class="pod">.*?ompilation.*?<\/colgroup>/, "")
contents = contents.gsub(/<tr><td><a href=".*?">(.*?)<\/a><\/td><td>(.*?)<\/td><\/tr>/, "")
contents = contents.gsub(/<\/table><\/div><\/div>\n/, "")

# contributor

contents = contents.gsub(/<\/p><\/div><\/div>\n/, "")
contents = contents.gsub(/<div class="pod contrib"><div class="head"><h2 class="title">Contributions.*?\n/, "")
contents = contents.gsub(/<a(.*?)<\/a>.*?<a/, "")
contents = contents.gsub(/<a(.*?)<\/a>.*?\n/, "")
contents = contents.gsub(/<a href=(.*?)>(.*?)<\/a>/, "")

# description

contents = contents.gsub(/(^[\S])(.*?)\n/, "")

# Cleanup

contents = contents.gsub(/<\/dd>/, "")
contents = contents.gsub(/_thumb.jpg/, "_front.jpg")
contents = contents.gsub(/"\.- title: /, "\"\n- title: \n")
contents = contents.gsub(/ - title: \n/, "- title: \n")
contents = contents.gsub(/  <\/dl>"/, "")
contents = contents.gsub(/ \*All 12 Major League Soccer teams with every player in home and away uniforms \n/, "")
contents = contents.gsub(/ \*Teams from 15 of the world's top leagues, including England, Italy, and Germany\n/, "")
contents = contents.gsub(/ \*45 National teams\n/, "")
contents = contents.gsub(/Toys "R" Us/, "Toys R Us")
contents = contents.gsub(/Yu Yu Hakusho "2"/, "Yu Yu Hakusho 2")
contents = contents.gsub(/Zool: Ninja of the "Nth" Dimension/, "Zool: Ninja of the Nth Dimension")
contents = contents.gsub(/ It's a breakaway bash in this wild new Kirby game of Block Ball!.*?\n/, "")

# Write changes to file
File.open('/Users/plgagne/sitesuck/gbe-timeline-result.yaml', "w") {|file| file.puts contents}
system("sed -i '' '/^$/d' '/Users/plgagne/sitesuck/gbe-timeline-result.yaml'")
file = File.open("/Users/plgagne/sitesuck/gbe-timeline-result.yaml", "rb")
contents = file.read
contents = contents.gsub(/  /, "")