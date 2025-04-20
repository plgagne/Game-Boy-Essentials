#!/usr/bin/ruby
file = File.open("temp/intermediate-current.html", "rb")
contents = file.read

# Remove top and bottom
contents = contents.gsub(/<!DOCTYPE html>(.*?)<main class="article">/m, '')
contents = contents.gsub(/<\/main>(.*?)<\/html>/m, '')

# Remove every instance of two spaces
contents = contents.gsub(/  /, '')

# Remove all tabs
contents = contents.gsub(/\t/, '')

# Titles
contents = contents.gsub(/<h1 id="(.*?)">(.*?)<\/h1>/, '\begingroup \chapter*{\\2}\markboth{\\2}{}\addcontentsline{toc}{chapter}{\\2} \endgroup')
contents = contents.gsub(/<h2 id="(.*?)">/, '\FloatBarrier\needspace{10mm}\section*{')
contents = contents.gsub(/<h3 id="(.*?)">/, '\subsection*{')

# Links
contents = contents.gsub(/<a href="(.*?)">/, '')
contents = contents.gsub(/<audio src="(.*?)">
<\/audio>/, '')
contents = contents.gsub(/<video src="(.*?)"><\/video>/, '')
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
contents = contents.gsub(/<div class="gallery">
<div class="gallery_element"><figure class=".*?"><img class="figure_img" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><figcaption class=".*?">(.*?)<\/figcaption><\/figure><\/div>/, '\begin{center}
\vspace{8pt}\adjustbox{valign=t}{\sbox0{\includegraphics[width=.45\linewidth]{assets\\1}}\begin{minipage}[t]{\wd0}\usebox0\par\centering\pagetwodescription \\2\end{minipage}}')

# First Gallery Element without Figcaption
contents = contents.gsub(/<div class="gallery">
<div class="gallery_element"><figure class=".*?"><img class="figure_img" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure><\/div>/, '\begin{center}
\vspace{8pt}\adjustbox{valign=t}{\includegraphics[width=.45\linewidth]{assets\\1}}')

# Other Elements with Figcaption
contents = contents.gsub(/<div class="gallery_element"><figure class=".*?"><img class="figure_img" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><figcaption class=".*?">(.*?)<\/figcaption><\/figure><\/div>/, '\quad\vspace{4pt}\adjustbox{valign=t}{ \sbox0{\includegraphics[width=.45\linewidth]{assets\\1}}\begin{minipage}[t]{\wd0}\usebox0\par\centering\pagetwodescription \\2\end{minipage}}')

# Other Elements without
contents = contents.gsub(/<div class="gallery_element"><figure class=".*?"><img class="figure_img" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure><\/div>/, '\quad\vspace{4pt}\adjustbox{valign=t}{\includegraphics[width=.45\linewidth]{assets\\1}}')

# Gallery bottom
contents = contents.gsub(/<div class="gallery">/, '\begin{center}')
contents = contents.gsub(/<\/div>/, '\end{center}')

# The godforsaken figures
# GB Float Right scss
contents = contents.gsub(/<figure class="figure figure_gb float right"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure>/, '\begin{wrapfigure}{R}{0pt} \includegraphics[width=.45\linewidth]{assets\\1}\end{wrapfigure}')

# GB Float Left scss
contents = contents.gsub(/<figure class="figure figure_gb float left"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure>/, '\begin{wrapfigure}{L}{0pt} \includegraphics[width=.45\linewidth]{assets\\1}\end{wrapfigure}')

# Art Float Left scss
contents = contents.gsub(/<figure class="figure figure_art float left"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure>/, '\begin{wrapfigure}{L}{0pt} \includegraphics[width=.4\linewidth]{assets\\1}\end{wrapfigure}')

# Art Float Right scss
contents = contents.gsub(/<figure class="figure figure_art float right"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure>/, '\begin{wrapfigure}{R}{0pt} \includegraphics[width=.4\linewidth]{assets\\1}\end{wrapfigure}')

# Pixel Float Left scss
contents = contents.gsub(/<figure class="figure figure_art float left"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure>/, '\begin{wrapfigure}{L}{0pt} \includegraphics[width=.4\linewidth]{assets\\1}\end{wrapfigure}')

# Pixel Float Right scss
contents = contents.gsub(/<figure class="figure figure_pixel float right"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure>/, '\begin{wrapfigure}{R}{0pt} \includegraphics[width=.4\linewidth]{assets\\1}\end{wrapfigure}')

# GB scss
contents = contents.gsub(/<figure class="figure figure_gb"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=4.85cm]{assets\\1}
\vskip 6pt
\end{figure}')

# Art scss
contents = contents.gsub(/<figure class="figure figure_art"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.5\linewidth]{assets\\1}
\vskip 6pt
\end{figure}')

# Pixel scss
contents = contents.gsub(/<figure class="figure figure_pixel"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.6\linewidth]{assets\\1}
\vskip 6pt
\end{figure}')

# GB with Figcaption scss
contents = contents.gsub(/<figure class="figure figure_gb"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><figcaption class=".*?">(.*?)<\/figcaption><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=4.85cm]{assets\\1}\par\pagetwodescription \\2
\vskip 6pt
\end{figure}')

# Pixel with Figcaption scss
contents = contents.gsub(/<figure class="figure figure_pixel"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><figcaption class=".*?">(.*?)<\/figcaption><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.6\linewidth]{assets\\1}\par\pagetwodescription \\2
\vskip 6pt
\end{figure}')

# Art with Figcaption scss
contents = contents.gsub(/<figure class="figure figure_art"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><figcaption class=".*?">(.*?)<\/figcaption><\/figure>/, '\begin{figure}[hbt]
\vskip 10pt
\centering \includegraphics[width=.75\linewidth]{assets\\1}\par\pagetwodescription \\2
\vskip 6pt
\end{figure}')

# Boxart scss
contents = contents.gsub(/<figure class="figure figure_boxart"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/><\/figure>/, '\begin{wrapfigure}{H}{\linewidth}
\vskip 4pt
\centering \includegraphics[width=.75\linewidth]{assets\\1}\end{wrapfigure}')

# Quick and easy replacements
map = {
"&amp;"      =>  "\\\\&",
'&lt;'       =>  '',
'&gt;'       =>  '>',
'$'          =>  '\$',
'%'          =>  '\%',
'#'          =>  '\#',
'<em>'       =>  '\emph{',
'</em>'      =>  '}',
'<strong>'   =>  '\textbf{',
'</strong>'  =>  '}',
'</a>'       =>  '',
'<p>'        =>  '',
'</p>'       =>  '',
'</h3>'      =>  '}\nopagebreak[4]',
'</h2>'      =>  '}\nopagebreak[4]',
'<blockquote>'   =>  '\begin{quote}',
'</blockquote>'  =>  '\end{quote} \par',
'<ul>'       =>  '\begin{itemize} \setlength\itemsep{-0.4em}',
'</ul>'      =>  '\end{itemize}\noindent',
'<ol>'       =>  '\begin{enumerate}',
'</ol>'      =>  '\end{enumerate}\noindent',
'<li>'       =>  '\item ',
'</li>'      =>  '',
'<code>'     =>  '\noindent{\codeintextfont ',
'</code>'    =>  '}',
'<cite>'     =>  '\newline \emph{',
'</cite>'    =>  '}',
'<br />'     =>  '\newline '
}
map.each_pair {|f,t| contents.gsub! f, t}

# Write changes to file
File.open('temp/intermediate-current.tex', "w") {|file| file.puts contents}