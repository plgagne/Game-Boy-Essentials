# Introduction
This book is the second volume of Game Boy Essentials, an attempt to understand the Game Boy library through its essential titles, good or bad. I have always looked forward to self-publishing this second book more than the first one, even before I started the project.

You see, I think anybody can write one book. I honestly believe that anyone who sets their mind to it can write something and use the tools available for free to self-publish. What is tough is publishing a second book; the novelty of saying you’re writing a book is gone. It took me much longer than I planned to write the twelve articles you see in this book. I had fully expected my excitement to recede. I knew, even before I started writing the first volume, that the second one would be the difficult achievement.

Do not mistake me; I am ultimately very happy with the written words in this book. I believe the twelve articles you hold in your hands are my best articles so far. I just had a harder time finding the motivation to write them. One thing was still exciting and required little motivation, however: typesetting.

When you typeset a book, you end up discovering if you like doing it. And most people don’t like paying attention to what needs to happen to create a book. I discovered I loved it. Not necessarily that I was any good at it, but that I had a lot of fun stressing all the little minutiae that goes into making the physical thing that is a book. What book size do you feel works best with your content? What font do you use? What about line height? Etc.

Typesetting my first book was also a mess. Because I wanted the process to be straightforward, my first book was made using Apple’s Pages. It speaks to the power of this application that I was able to make it using its limited tool set. Unfortunately, the amount of time and effort it took to manually place every image and arrange every paragraph was simply too time-consuming to joyfully repeat for my second book. Pages also has some severe functionality gaps with page layout. My improved skills in programming came to my rescue. Last year, I had switched the management of my website to Jekyll. Gameboyessentials.com was previously hand-crafted, with more and more automated shell scripts written by me over time to automate tasks until it became unwieldy. Jekyll changed that for the better. It’s a wonderful static site generator that I was able to mould into making my idiosyncratic website. It’s extremely popular and well documented, so I was quickly able to find solutions to all my problems. I didn’t need any strange hack, I simply used its Collections feature to code all the details I wanted. Once that project was completed, and I could manage my site with ease, I was itching for more coding challenges. That’s when I looked at my book.

Before I even dabbled in Jekyll, I had tried automating the typesetting of my book with ConTeXt, a variant of TeX focused on separating your styling from your text. Unfortunately, ConTeXt failed me. I am not a professional programmer. Stack Overflow taught me everything I know. ConTeXt had so little documentation that I had to abandon my endeavour; I simply could not find answers to very basic questions. That’s when I turned to Pages and ended up with the first edition of my first book. I luckily decided to give the TeX family a second chance once my website was updated, a couple of months later. Using Jekyll made me realize that my problem with ConTeXt was with its anemic documentation. So I tried building my book with LaTeX, the most popular flavour of TeX. If you’re an academic outside the humanities, you’re bound to know what LaTeX is. If not, it’s a typesetting system that works using plain text with markup to style your finished document. It’s code. Most research papers who need to show mathematical equations are built using LaTeX because of its foolproof nature. Look at this example of my book’s legal notice page.

<code>
\noindent{\codeintextfont
\textbackslash thispagestyle{empty}
\newline \textbackslash mbox{}
\newline \textbackslash vfill
\newline \textbackslash begin{center}
\newline \textbackslash setstretch{1}
\newline \textbackslash fontsize{10pt}{12pt}\textbackslash selectfont
}
</code>

This short example allows the page to be bottom-aligned. Using a system based on such markup, I was able to convert my website’s HTML into LaTeX using a mixture of Ruby and Bash scripts. I would look for specific HTML tags for my images, my chapter titles and so forth and convert them into the corresponding LaTeX markup. I quickly learned that you’re not supposed to do that in a professional setting with other people’s HTML. But since every line was written by me, I had no qualm about parsing my own HTML. The final LaTeX code might be messy and weird, but it didn’t matter; the final PDF looked like what I wanted. It took a while to code for every possible permutation on my website, but it was worth it. I finally switched to XeLaTeX since it allowed me to use modern font files. This book is actually the second book I’ve made using my Jekyll, Bash, Ruby and XeLaTeX workflow: my initial project involved redoing the first volume, which features my first twelve articles. I stealthily republished it in a fancy second edition. The text is lightly edited, and if you don’t pay too much attention you won’t see the typesetting differences. But I do.

I seem to be forgetting, dear reader, that you’re not here for bookmaking nerdery, but rather for Game Boy analysis. Fortunately, the rest of this book is all about that. The twelve following articles cover a fascinating tranche of video games, representing a large swath of what the Game Boy represented.

Enjoy.
