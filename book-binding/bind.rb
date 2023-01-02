#!/usr/bin/ruby
Dir.glob('temp/intermediate-*.html').each do |filename|
next if File.directory?(filename)
file = File.open(filename, "rb")
contents = file.read
contents = contents.gsub(/<!DOCTYPE html>(.*?)<main id="article">/m, '')
contents = contents.gsub(/<\/main>(.*?)<\/html>/m, '')
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
\vspace{8pt}\adjustbox{valign=t}{\sbox0{\includegraphics[width=.45\linewidth]{temp\\3}}\begin{minipage}[t]{\wd0}\usebox0\par\centering\pagetwodescription \\7\end{minipage}}')

# First Gallery Element without
contents = contents.gsub(/<div class="gallery-container">
<div><figure(.*?)class="(.*?)gallery"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)"(.*?)<\/figure><\/div>/, '\begin{center}
\vspace{8pt}\adjustbox{valign=t}{\includegraphics[width=.45\linewidth]{temp\\3}}')

# Other Elements with Figcaption
contents = contents.gsub(/<div><figure(.*?)class="(.*?)gallery"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure><\/div>/, '\quad\vspace{4pt}\adjustbox{valign=t}{ \sbox0{\includegraphics[width=.45\linewidth]{temp\\3}}\begin{minipage}[t]{\wd0}\usebox0\par\centering\pagetwodescription \\7\end{minipage}}')

# Other Elements without
contents = contents.gsub(/<div><figure(.*?)class="(.*?)gallery"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)"(.*?)<\/figure><\/div>/, '\quad\vspace{4pt}\adjustbox{valign=t}{\includegraphics[width=.45\linewidth]{temp\\3}}')

contents = contents.gsub(/<div class="gallery-container">/, '\begin{center}')
contents = contents.gsub(/<\/div>/, '\end{center}')

# The godforsaken figures
# GB Float Right
contents = contents.gsub(/<figure class="gb float right"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{R}{0pt} \includegraphics[width=.45\linewidth]{temp\\1}\end{wrapfigure}')

# GB Float Left
contents = contents.gsub(/<figure class="gb float left"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{L}{0pt} \includegraphics[width=.45\linewidth]{temp\\1}\end{wrapfigure}')

# Art Float Left
contents = contents.gsub(/<figure class="art float left"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{L}{0pt} \includegraphics[width=.4\linewidth]{temp\\1}\end{wrapfigure}')

# Art Float Right
contents = contents.gsub(/<figure class="art float right"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{R}{0pt} \includegraphics[width=.4\linewidth]{temp\\1}\end{wrapfigure}')

# Pixel Float Left
contents = contents.gsub(/<figure class="pixel float left"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{L}{0pt} \includegraphics[width=.5\linewidth]{temp\\1}\end{wrapfigure}')

# Pixel Float Right
contents = contents.gsub(/<figure class="pixel float right"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{wrapfigure}{R}{0pt} \includegraphics[width=.5\linewidth]{temp\\1}\end{wrapfigure}')

# GB
contents = contents.gsub(/<figure class="gb"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=4.85cm]{temp\\1}
\vskip 6pt
\end{figure}')

# Art
contents = contents.gsub(/<figure class="art"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.5\linewidth]{temp\\1}
\vskip 6pt
\end{figure}')

# Pixel
contents = contents.gsub(/<figure class="pixel"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.6\linewidth]{temp\\1}
\vskip 6pt
\end{figure}')

# GB with Figcaption
contents = contents.gsub(/<figure class="gb"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=4.85cm]{temp\\1}\par\pagetwodescription \\5
\vskip 6pt
\end{figure}')

# Pixel with Figcaption
contents = contents.gsub(/<figure class="pixel"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.6\linewidth]{temp\\1}\par\pagetwodescription \\5
\vskip 6pt
\end{figure}')

# Art with Figcaption
contents = contents.gsub(/<figure class="art"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.75\linewidth]{temp\\1}\par\pagetwodescription \\5
\vskip 6pt
\end{figure}')

# Boxart
contents = contents.gsub(/<figure class="boxart"><img src="(.*?)" width="(.*?)" height="(.*?)" alt="(.*?)" \/><figcaption>(.*?)<\/figcaption><\/figure>/, '\begin{wrapfigure}{H}{\linewidth}
\vskip 4pt
\centering \includegraphics[width=.75\linewidth]{temp\\1}\par\pagetwodescription \\5\end{wrapfigure}
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
filename = filename.concat(".tex")
File.open(filename, "w") {|file| file.puts contents }
end