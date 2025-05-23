#!/usr/bin/ruby
file = File.open("temp/timeline-temp.tmp", "rb")
contents = file.read

# Remove all tabs
contents = contents.gsub(/\t/, "")
# Remove every instance of two spaces
contents = contents.gsub(/  /, "")

# name and representative boxart located in the header and nav
contents = contents.gsub(/<header\ class=\"page-header\">(.*?)background-image:url\(https:\/\/gamefaqs\.gamespot\.com\/(.*?)\.jpg(.*?)page-title\">(.*?)\ &ndash;(.*?)<\/h1>/, "- representative_name: \"\\4\"\n  representative_boxart: \"\\2.jpg\"\n\\5")

# related_version located in the header and nav
contents = contents.gsub(/ Release Details(.*?)<span class="header_more">(.*?)<\/span><\/h3><div class="gs_header_buttons">/,"  related_version:\n   - \"\\2\"")
contents = contents.gsub(/ Release Details<h3 class="platform-title"><span class="header_more_wrap"><span class="header_more" style="cursor: pointer">(.*?) <i class="fa fa-caret-down"><\/i><\/span><div id="header_more_menu">/,"  related_version:\n   - \"\\1\"\n")
contents = contents.gsub(/<span class="header_more" style="cursor: pointer">(.*?)<i class="fa fa-caret-down">/, "\"\\1\"\n<i class=\"fa fa-caret-down\">")
contents = contents.gsub(/<i class="fa fa-caret-down">(.*?)<a href="https:\/\/gamefaqs.gamespot.com\/(.*?)"><span class="also_name">(.*?)<\/span><\/a>/, "   - \"\\3\"\n")
contents = contents.gsub(/<a href="https:\/\/gamefaqs.gamespot.com\/(.*?)"><span class="also_name">(.*?)<\/span><\/a>/, "   - \"\\2\"\n")
contents = contents.gsub(/<a href="\.\.\/(.*?)"><span class="also_name">(.*?)<\/span><\/a>/, "   - \"\\2\"\n")
contents = contents.gsub(/<\/div><\/span><\/h3><div class="gs_header_buttons"><span class="gs_hbtn_span"><button class="btn gs_hbtn gs_hb_notes" id="btn_gs_note" title="Your notes">(.*?)<\/nav>/, "")
contents = contents.gsub(/<span class="gs_hbtn_span"><button class="btn gs_hbtn gs_hb_notes" id="btn_gs_note" title="Your notes">(.*?)<\/nav>/, "")

# Merge lines
contents = contents.gsub(/>\n/, ">")

# Genre
contents = contents.gsub(/&gt; /, "&gt;")
contents = contents.gsub(/ &gt;/, "&gt;")
contents = contents.gsub(/<div\ class=\"pod\ pod_titledata\">(.*?)Genre:<\/dt><dd>(.*?)&gt;/, "  genre: [\"\\2&gt;")
contents = contents.gsub(/&gt;(.*?)/, "\", \"\\1")
contents = contents.gsub(/genre:(.*?)\n/, "genre:\\1\"]\n")

# Developer
contents = contents.gsub(/<\/dd><dt>Developer:<\/dt><dd>(.*?)\n/, "  developers:\n<\/dd><dt>Developer:<\/dt><dd>\\1")
contents = contents.gsub(/<\/dd><dt>Developer:<\/dt><dd><a(.*?)>(.*?)<\/a>(.*?)/, "   - developer: \"\\2\"\n\\3")

# ESRB
contents = contents.gsub(/<\/dd><dt>ESRB Descriptor\(s\):<\/dt><dd>(.*?)<\/dd>(.*?)\n/, "\\2\n  ESRB_descriptors: \"\\1\"")
contents = contents.gsub(/<\/dd><dt>ESRB Descriptor\(s\):<\/dt><dd>(.*?)\n/, "\n  ESRB_descriptors: \"\\1\"")

# wikipedia
contents = contents.gsub(/<dt>Wikipedia \(EN\):<\/dt><dd><a target="_blank" href="(.*?)"(.*?)<\/a><\/dd><\/dl><\/div><\/div>/, "  wikipedia: \"\\1\"\n")
contents = contents.gsub(/<\/dd>  wikipedia: /, "\n  wikipedia: ")

# players
contents = contents.gsub(/<\/dd><dt>Local Players:<\/dt><dd>(.*?)<\/dd>/, "  players: \"\\1\"\n")
contents = contents.gsub(/<dt>Local Players:<\/dt><dd>(.*?)\n/, "  players: \"\\1\"\n")
contents = contents.gsub(/<\/dd>  players: /, "\n  players: ")

# releases
contents = contents.gsub(/<\/dd><\/dl><\/div><\/div>\n/, "")
contents = contents.gsub(/{(.*?)}(.*?)<td class="cregion">US<\/td>(.*?)\n/, "\\2<td class=\"cregion\">US<\/td>{\\1}\\3\n")
contents = contents.gsub(/<td class="cregion">US<\/td>{(.*?)}(.*?)<td class="cregion">US<\/td>/, "<td class=\"cregion\">US<\/td>{\\1}\\2<td class=\"cregion\">US<\/td>{\\1}")
contents = contents.gsub(/<.*?>Release Data.*?<tbody>/, "\n  releases:")
contents = contents.gsub(/<tr><td class="cbox" rowspan="2">(.*?)<td class="datarating">(.*?)<\/td><\/tr>/, "\n\\1\n     rating: \"\\2\"")
contents = contents.gsub(/<.*?src=".*?com(.*?)".*?<b>(.*?)<.*?"cregion">US<.*?{(.*?)}.*?href=".*?">(.*?)<.*?"datapid">(.*?)<.*?"datapid">(.*?)<.*?"cdate">(.*?)<.*?\n/, "   - title: \"\\2\"\n      market: \"US\"\n     release_date: \"\\7\"\n     publisher: \"\\4\"\n     id: \"\\5\"\n     barcode: \"\\6\"\n     boxart: \"\\1\"\n\\3\n")
contents = contents.gsub(/<.*?src=".*?com(.*?)".*?<b>(.*?)<.*?"cregion">(.*?)<.*?href=".*?">(.*?)<.*?"datapid">(.*?)<.*?"datapid">(.*?)<.*?"cdate">(.*?)<.*?\n/, "   - title: \"\\2\"\n     market: \"\\3\"\n     release_date: \"\\7\"\n     publisher: \"\\4\"\n     id: \"\\5\"\n     barcode: \"\\6\"\n     boxart: \"\\1\"\n")
contents = contents.gsub(/   - title: "(.*?) \((.*?)\)"/, "   - title: \"\\1\"\n     release_details: \"\\2\"")
contents = contents.gsub(/release_date: "0000-00-00 2021"/, "release_date: \"2021-00-00\"")

contents = contents.gsub(/<\/tbody><\/table><\/div><\/div>/, "")
contents = contents.gsub(/     rating: "&nbsp;"/, "")
contents = contents.gsub(/     barcode: "&nbsp;"/, "")
contents = contents.gsub(/Yu Yu Hakusho "2"/, "Yu Yu Hakusho 2")

# compilation
contents = contents.gsub(/<div class="pod"><div class="head"><h2 class="title">Included in Compilation.*?<\/colgroup>/, "  compiled_in:\n")
contents = contents.gsub(/<div class="pod"><div class="head"><h2 class="title">Compilation Of.*?<\/colgroup>/, "  compilation_of:\n")
contents = contents.gsub(/<tr><td><a href=".*?">(.*?)<\/a><\/td><td>(.*?)<\/td><\/tr>/, "   - compilation_title: \"\\1\"\n     platform: \"\\2\"\n")
contents = contents.gsub(/<\/table><\/div><\/div>\n/, "")

# contributor
contents = contents.gsub(/<\/p><\/div><\/div>\n/, "\n")
contents = contents.gsub(/<div class="pod contrib"><div class="head"><h2 class="title">Contributions.*?\n/, "  contributors:\n")
contents = contents.gsub(/<a(.*?)<\/a>.*?<a/, "<a\\1<\/a>\n<a")
contents = contents.gsub(/<a(.*?)<\/a>.*?\n/, "<a\\1<\/a>\n")
contents = contents.gsub(/ <a href=(.*?)>(.*?)<\/a>/, "   - name: \"\\2\"\n     link: \\1")
contents = contents.gsub(/<a href=(.*?)>(.*?)<\/a>/, "   - name: \"\\2\"\n     link: \\1")

# description
contents = contents.gsub(/<br\ \/>\r\n/, "")
contents = contents.gsub(/<div class="pod"><div class="head"><h2 class="title">Description<\/h2><\/div><div class="body game_desc">(.*?)<\/div><\/div>/, "")

# Cleanup
# Remove blank lines
contents = contents.gsub(/^[[:space:]]*$|^#/, "")
contents = contents.gsub(/\n+|\r+/, "\n").squeeze("\n").strip
contents = contents.gsub(/<\/dl><\/div><\/div>/, "")
contents = contents.gsub(/Toys "R" Us/, "Toys R Us")
contents = contents.gsub(/Zool: Ninja of the "Nth" Dimension/, "Zool: Ninja of the Nth Dimension")

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
contents = contents.gsub(/release_date: "TBA"/, "release_date: null")
contents = contents.gsub(/release_date: "Canceled"/, "release_date: null")
contents = contents.gsub(/release_date: "0000-00-00"/, "release_date: null")

# Adjusting the market from US to NA
contents = contents.gsub(/market: "US"/, "market: \"NA\"")

# Switching barcode Nintendo Power to release_details
contents = contents.gsub(/barcode: "Nintendo Power"/, "release_details: \"Nintendo Power\"")

# Switching Disney Pixar
contents = contents.gsub(/Disney\/Pixar/, "Disney⋅Pixar")

# Switching the single quote
contents = contents.gsub(/'/, "’")

# It's Pokémon dammit
contents = contents.gsub(/Pokemon/, "Pokémon")

# It's Player's Choice
contents = contents.gsub(/Players Choice/, "Player’s Choice")
contents = contents.gsub(/GameBoy Nintendo Classics/, "Game Boy Nintendo Classics")

# Switching image location
contents = contents.gsub(/boxart: "\/a\/images\/site\/noboxshot_wide_thumb.gif"/, "boxart: \"/no_cover.png\"")
contents = contents.gsub(/_thumb.jpg/, "_front.jpg")

# Unknown release dates
contents = contents.gsub(/release_date: "(.*?)-(.*?)-00"/, "release_date: \"\\1-\\2-01\"")
contents = contents.gsub(/release_date: "(.*?)-00-(.*?)"/, "release_date: \"\\1-01-\\2\"\n     unknown_release_month: true")

contents.prepend("---\n")

# Write changes to file
File.open('temp/timeline.yml', "w") {|file| file.puts contents}