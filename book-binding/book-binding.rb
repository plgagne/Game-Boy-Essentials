#!/usr/bin/ruby
# Volume 1 List of Articles
# system('cat volume-1-intro.txt temp/dmg-tr.html temp/cgb-auhe.html temp/dmg-yt.html temp/dmg-ayve.html temp/dmg-rw.html temp/dmg-ml.html temp/dmg-ff.html temp/dmg-zl.html temp/cgb-buhe.html temp/dmg-ss.html temp/dmg-nm.html temp/dmg-sa.html > built/intermediate-1.html')

# Volume 2 List of Articles
# system('cat temp/volume-2-intro.html temp/dmg-ar4e/index.html temp/dmg-bb/index.html temp/dmg-se/index.html temp/dmg-w2/index.html temp/dmg-cn/index.html temp/dmg-apce/index.html temp/dmg-aw7e/index.html temp/cgb-bt5e/index.html temp/dmg-agga/index.html temp/dmg-mx/index.html temp/cgb-awxe/index.html temp/dmg-me/index.html  > built/intermediate-1.html')

# Volume 3 List of Articles
system('cat temp/volume-3-intro.html temp/dmg-mq/index.html temp/dmg-agae/index.html temp/dmg-yh/index.html temp/dmg-adde/index.html temp/cgb-bvpp/index.html temp/cgb-bwle/index.html temp/dmg-ka/index.html temp/dmg-wa/index.html temp/cgb-bd3e/index.html temp/dmg-apee/index.html temp/dmg-amoe/index.html temp/dmg-ky/index.html > built/intermediate-1.html')

# Volume 4 List of Articles
# system('cat temp/mgb-006/index.html > built/intermediate-1.html')

file = File.open("built/intermediate-1.html", "rb")
contents = file.read
contents = contents.gsub(/<!DOCTYPE html>(.*?)<main id="article">/m, '')
contents = contents.gsub(/<hr>(.*?)<\/html>/m, '')
# Remove every instance of two spaces
contents = contents.gsub(/  /, '')
# Remove all tabs
contents = contents.gsub(/\t/, '')
# Titles
contents = contents.gsub(/<h1 id="(.*?)">(.*?)<\/h1>/, '\begingroup \chapter*{\\2}\markboth{\\2}{}\addcontentsline{toc}{chapter}{\\2} \endgroup')
contents = contents.gsub(/<h2 id="(.*?)">/, '\FloatBarrier\needspace{5pt}\section*{')
contents = contents.gsub(/<h3 id="(.*?)">/, '\subsection*{')
contents = contents.gsub(/<a href="(.*?)">/, '')
contents = contents.gsub(/<audio src="(.*?)">
<\/audio>/, '')
contents = contents.gsub(/<video src="(.*?)">
<\/video>/, '')
contents = contents.gsub(/<object data="(.*?)">
<\/object>/, '')

# Tables
contents = contents.gsub(/<table>
<thead>/, '\begin{center} \footnotesize\begin{tabulary}{\textwidth}{LLLL} \hline')
contents = contents.gsub(/<tr>
<th>/, '\textbf{')
contents = contents.gsub(/<\/th>
<th>/, '} & \textbf{')
contents = contents.gsub(/<\/th>
<\/tr>
<\/thead>
<tbody>/, '} \\\\\\
\hline')
contents = contents.gsub(/<tr>
<td>/, '')
contents = contents.gsub(/<\/td>
<td>/, ' & ')
contents = contents.gsub(/<\/td>
<\/tr>
<\/tbody>/, ' \\\\\\')
contents = contents.gsub(/<\/td>
<\/tr>/, ' \\\\\\
\hline')
contents = contents.gsub(/<\/table>/, '\hline \normalsize\end{tabulary} \end{center}')

# Gallery
# First Gallery Element with Figcaption
contents = contents.gsub(/<div class="gallery-container">
<div><figure(.*?)class="(.*?)gallery"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure><\/div>/, '\begin{center}
\vspace{8pt}\adjustbox{valign=t}{\sbox0{\includegraphics[width=.45\linewidth]{/users/plgagne/temp\\3}}\begin{minipage}[t]{\wd0}\usebox0\par\centering\pagetwodescription \\7\end{minipage}}')

# First Gallery Element without
contents = contents.gsub(/<div class="gallery-container">
<div><figure(.*?)class="(.*?)gallery"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)"(.*?)<\/figure><\/div>/, '\begin{center}
\vspace{8pt}\adjustbox{valign=t}{\includegraphics[width=.45\linewidth]{/users/plgagne/temp\\3}}')

# Other Elements with Figcaption
contents = contents.gsub(/<div><figure(.*?)class="(.*?)gallery"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure><\/div>/, '\quad\vspace{4pt}\adjustbox{valign=t}{ \sbox0{\includegraphics[width=.45\linewidth]{/users/plgagne/temp\\3}}\begin{minipage}[t]{\wd0}\usebox0\par\centering\pagetwodescription \\7\end{minipage}}')

# Other Elements without
contents = contents.gsub(/<div><figure(.*?)class="(.*?)gallery"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)"(.*?)<\/figure><\/div>/, '\quad\vspace{4pt}\adjustbox{valign=t}{\includegraphics[width=.45\linewidth]{/users/plgagne/temp\\3}}')

contents = contents.gsub(/<div class="gallery-container">/, '\begin{center}')
contents = contents.gsub(/<\/div>/, '\end{center}')

# The godforsaken figures
# GB Float Right
contents = contents.gsub(/<figure class="gb float right"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{R}{0pt} \includegraphics[width=.45\linewidth]{/users/plgagne/temp\\1}\end{wrapfigure}')

# GB Float Left
contents = contents.gsub(/<figure class="gb float left"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{L}{0pt} \includegraphics[width=.45\linewidth]{/users/plgagne/temp\\1}\end{wrapfigure}')

# Art Float Left
contents = contents.gsub(/<figure class="art float left"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{L}{0pt} \includegraphics[width=.4\linewidth]{/users/plgagne/temp\\1}\end{wrapfigure}')

# Art Float Right
contents = contents.gsub(/<figure class="art float right"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{R}{0pt} \includegraphics[width=.4\linewidth]{/users/plgagne/temp\\1}\end{wrapfigure}')

# Pixel Float Left
contents = contents.gsub(/<figure class="pixel float left"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{L}{0pt} \includegraphics[width=.5\linewidth]{/users/plgagne/temp\\1}\end{wrapfigure}')

# Pixel Float Right
contents = contents.gsub(/<figure class="pixel float right"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{R}{0pt} \includegraphics[width=.5\linewidth]{/users/plgagne/temp\\1}\end{wrapfigure}')

# GB
contents = contents.gsub(/<figure class="gb"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=4.85cm]{/users/plgagne/temp\\1}
\vskip 6pt
\end{figure}')

# Art
contents = contents.gsub(/<figure class="art"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.5\linewidth]{/users/plgagne/temp\\1}
\vskip 6pt
\end{figure}')

# Pixel
contents = contents.gsub(/<figure class="pixel"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.6\linewidth]{/users/plgagne/temp\\1}
\vskip 6pt
\end{figure}')

# GB with Figcaption
contents = contents.gsub(/<figure class="gb"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=4.85cm]{/users/plgagne/temp\\1}\par\pagetwodescription \\5
\vskip 6pt
\end{figure}')

# Pixel with Figcaption
contents = contents.gsub(/<figure class="pixel"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.6\linewidth]{/users/plgagne/temp\\1}\par\pagetwodescription \\5
\vskip 6pt
\end{figure}')

# Art with Figcaption
contents = contents.gsub(/<figure class="art"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.75\linewidth]{/users/plgagne/temp\\1}\par\pagetwodescription \\5
\vskip 6pt
\end{figure}')

# Boxart
contents = contents.gsub(/<figure class="boxart"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure>/, '\begin{wrapfigure}{H}{\linewidth}
\vskip 4pt
\centering \includegraphics[width=.75\linewidth]{/users/plgagne/temp\\1}\par\pagetwodescription \\5\end{wrapfigure}
\clearpage')

map = {
"&amp;"			=>	"\\\\&",
'&lt;'			=>	'',
'&gt;'			=>	'>',
'$'				=>	'\$',
'%'				=>	'\%',
'#'				=>	'\#',
'<em>'			=>	'\emph{',
'</em>'			=>	'}',
'<strong>'		=>	'\textbf{',
'</strong>'		=>	'}',
'</a>'			=>	'',
'<p>'			=>	'',
'</p>'			=>	'',
'</h3>'			=>	'}',
'</h2>'			=>	'}',
'<blockquote>'	=>	'\begin{quote}',
'</blockquote>'	=>	'\end{quote} \par',
'<ul>'			=>	'\begin{itemize} \setlength\itemsep{-0.4em}',
'</ul>'			=>	'\end{itemize}\noindent',
'<ol>'			=>	'\begin{enumerate}',
'</ol>'			=>	'\end{enumerate}\noindent',
'<li>'			=>	'\item ',
'</li>'			=>	'',
'<code>'		=>	'\noindent{\codeintextfont ',
'</code>'		=>	'}',
'<cite>'		=>	'\newline \emph{',
'</cite>'		=>	'}',
'<br />'		=>	'\newline '
}
map.each_pair {|f,t| contents.gsub! f, t}
# To write changes to the file, use:
File.open('built/intermediate-2.tex', "w") {|file| file.puts contents }
system('cp book.tex built/book-1.tex')
system('cat built/intermediate-2.tex >> built/book-1.tex')
system('echo "\endgroup \end{document}" >> built/book-1.tex')
system('xelatex built/book-1.tex built/book-1.pdf')