#!/usr/bin/ruby
# encoding: utf-8
file = File.open("temp/intermediate-current.html", "r:UTF-8")
contents = file.read

# Remove top and bottom
contents = contents.gsub(/<!DOCTYPE html>(.*?)<main class="article">/m, '')
contents = contents.gsub(/<\/main>(.*?)<\/html>/m, '')

# Remove every instance of two spaces
contents = contents.gsub(/  /, '')

# Remove all tabs
contents = contents.gsub(/\t/, '')

# Remove empty lines
contents = contents.gsub(/\n+|\r+/, "\n").squeeze("\n").strip

# Titles
contents = contents.gsub(/<h1 id="(.*?)">(.*?)<\/h1>/, '\chapter*{\\2}\markboth{\\2}{}\addcontentsline{toc}{chapter}{\\2}')
contents = contents.gsub(/<h2 class="h2-article-title" id="(.*?)">/, '\newpage\FloatBarrier\section*{')
contents = contents.gsub(/<h2 id="(.*?)">/, '\FloatBarrier\section*{')
contents = contents.gsub(/<h3 id="(.*?)">/, '\FloatBarrier\subsection*{')

# Links
contents = contents.gsub(/<a href="(.*?)">/, '')
contents = contents.gsub(/<audio (.*?)"><\/audio>/, '')
contents = contents.gsub(/<video (.*?)"><\/video>/, '')
contents = contents.gsub(/<object (.*?)"><\/object>/, '')

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

# Figures
contents = contents.gsub(/<div class="gallery">/, '\FloatBarrier\vspace{\baselineskip}\centering')
contents = contents.gsub(/(.*?)<figure class="(.*?)"><img class=".*?" src="(.*?)" width=".*?" height=".*?" alt=".*?" \/>(.*?)<\/figure>(<\/div>)?/) do
  gallery_element = Regexp.last_match(1)
  class_string = Regexp.last_match(2)
  image_location = Regexp.last_match(3)
  figcaption =  Regexp.last_match(4)

  classes = class_string.split(" ")
  name = classes[1]
  float = classes[2]
  float_side = classes[3]

  figcaption = figcaption&.gsub(/<figcaption class=".*?">(.*?)<\/figcaption>/, "\\1")
  if gallery_element && !gallery_element.strip.empty?
    start = '\begin{minipage}{0.45\linewidth}\adjustbox{valign=t}'
    sizing = '\linewidth'
    fin = '\end{minipage}\vspace{2pt}'
    if figcaption && !figcaption.strip.empty?
      figcaption_start = '\captionof{figure}{'
      figcaption_end = '}'
    end
  else
    if float && !float.strip.empty?
      case float_side
        when 'left'
          start = '\begin{wrapfigure}{L}{0pt}'
          fin = '\end{wrapfigure}\noindent'
        when 'right'
          start = '\begin{wrapfigure}{R}{0pt}'
          fin = '\end{wrapfigure}'
      end
      case name
        when 'figure_gb'
          start2 = ''
        else
          start2 = ''
      end
      sizing = '.45\linewidth'
    else
      case name
      when 'figure_boxart'
        start = '\vspace{\baselineskip}\begin{figure}[H]'
        sizing = '.75\linewidth'
        fin = '\end{figure}\vspace{\baselineskip}'
      else
        start = '\FloatBarrier\vspace{\baselineskip}\begin{figure}[H]\centering'
        fin = '\end{figure}'
        if figcaption && !figcaption.strip.empty?
          figcaption_start = '\caption*{'
          figcaption_end = '}'
          sizing = case name
          when 'figure_gb'
            '4.85cm'
          when 'figure_art'
            '.75\linewidth'
          when 'figure_pixel'
            '.6\linewidth'
          end
        else
          sizing = case name
          when 'figure_gb'
            '4.85cm'
          when 'figure_art'
            '.5\linewidth'
          when 'figure_pixel'
            '.6\linewidth'
          end
        end
      end
    end
  end
"#{start}#{start2}{\\includegraphics[width=#{sizing}]{assets#{image_location}}}#{figcaption_start}#{figcaption}#{figcaption_end}#{fin}"
end
contents = contents.gsub(/(.*?)\\vspace{2pt}\n<\/div>/, "\\1\n\\par\\justifying")

# Quick and easy replacements
map = {
"&amp;"                         =>  "\\\\&",
'&lt;'                          =>  '',
'&gt;'                          =>  '>',
'$'                             =>  '\$',
'%'                             =>  '\%',
'#'                             =>  '\#',
'~'                             =>  '\~',
'<em>'                          =>  '\emph{',
'</em>'                         =>  '}',
'<strong>'                      =>  '\textbf{',
'</strong>'                     =>  '}',
'</a>'                          =>  '',
'<p>'                           =>  "",
'</p>'                          =>  '\par',
'</h3>'                         =>  '}',
'</h2>'                         =>  '}',
'<blockquote>'                  =>  '\begin{quote}',
'</blockquote>'                 =>  '\end{quote} \par',
'<ul>'                          =>  "\\begin{itemize}\n",
'<ul class="article-gamedata">' =>  '\begin{itemize}[left=0pt, nosep]',
'</ul>'                         =>  "\n\\end{itemize}",
'<ol>'                          =>  '\begin{enumerate}',
'</ol>'                         =>  '\end{enumerate}',
'<li>'                          =>  '\item ',
'</li>'                         =>  '',
'<code>'                        =>  '\noindent{\codeintextfont ',
'</code>'                       =>  '}',
'<cite>'                        =>  '\newline \emph{',
'</cite>'                       =>  '}',
'<br />'                        =>  '\newline ',
' '                             =>  '~'
}
map.each_pair {|f,t| contents.gsub! f, t}

# Write changes to file
File.open('temp/intermediate-current.tex', "w") {|file| file.puts contents}