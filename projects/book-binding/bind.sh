#!/bin/zsh
# This variable is the first volume to be bound
volume=1
# This variable is one above the last volume to be bound
last_volume=4
# Make temp 
mkdir "temp"
if [ -r "temp/assets" ]; then
		echo "Book-sized images exist."
else 
		echo "Book-sized images do not exist. Making them now."
		mkdir "temp/assets"
		cp -r "../../assets/" "temp/assets/"
		find "temp/assets" -type f -name '*.png' -print0 | while IFS= read -r -d '' line; do
				echo $line
				magick mogrify -interpolate nearest -filter point -resize 800% $line
		done
fi
# Copy _site-local into temp
echo "Copying all articles from tags structure ..."
cp -r "../../_site-local/tag" "temp"
# Run binding on each volume
until [ $volume -eq $last_volume ]; do
	echo "Building book:" $volume
	echo "Making HTML version of introduction ..."
	kramdown volume-$volume-intro.md >temp/volume-$volume-intro.html
	echo "Merging introduction with articles ..."
	cat temp/volume-$volume-intro.html temp/tag/book$volume/index.html > temp/intermediate-current.html
	rm temp/volume-$volume-intro.html
	echo "Running Ruby file for book binding ..."
	ruby "bind.rb"
	cp temp/intermediate-current.tex temp/intermediate-$volume.tex
	rm temp/intermediate-current.html
	rm temp/intermediate-current.tex
	echo "Adding variables to bound book ..."
	cp volume-$volume-variables.tex temp/book-$volume.tex
	cat book.tex >> temp/book-$volume.tex
	cat temp/intermediate-$volume.tex >> temp/book-$volume.tex
	rm temp/intermediate-$volume.tex
	echo "\endgroup \end{document}" >> temp/book-$volume.tex
	echo "Running XeLaTeX ..."
	xelatex temp/book-$volume.tex book-$volume.pdf
	mv book-$volume.aux temp/book-$volume.aux
	rm temp/book-$volume.aux
	mv book-$volume.log temp/book-$volume.log
	mv book-$volume.pdf temp/book-$volume.pdf
	volume=$(( $volume+1 ))
done