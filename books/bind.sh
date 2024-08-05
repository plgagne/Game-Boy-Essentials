#!/bin/zsh

# This variable is the first volume to be bound
volume=1

# This variable is the last volume to be bound
last_volume=1

# Navigate to correct folder
cd books

# Make temp
mkdir "temp"
if [ -r "temp/assets" ]; then
  echo "${RED}Book-sized images folder exists in books/temp/assets. Delete to recreate."
else
  echo "${RED}Book-sized images do not exist. Making them now:"
  mkdir "temp/assets"
  cp -r "${website_location}/assets/" "temp/assets/assets/"
  find "temp/assets" -type f -name '*.png' -print0 | while IFS= read -r -d '' line; do
    echo $line
    magick mogrify -interpolate nearest -filter point -resize 800% $line
  done
fi

# Copy _site-local into temp
echo "${RED}Copying all articles from tags structure ..."
cp -r "${website_location}/_site-local/tag" "temp"

# Run binding on each volume
mkdir "results"
until [[ "$volume" -gt "$last_volume" ]]; do
  echo "${RED}Building book:" $volume
  echo "${RED}Making HTML version of introduction ..."
  kramdown volume-$volume-intro.md >temp/volume-$volume-intro.html
  echo "${RED}Merging introduction with articles ..."
  cat temp/volume-$volume-intro.html temp/tag/book$volume/index.html > temp/intermediate-current.html
  rm temp/volume-$volume-intro.html
  echo "${RED}Running Ruby file for book binding ..."
  ruby "bind.rb"
  cp temp/intermediate-current.tex temp/intermediate-$volume.tex
  rm temp/intermediate-current.html
  rm temp/intermediate-current.tex
  echo "${RED}Adding variables to bound book ..."
  cp volume-$volume-variables.tex temp/book-$volume.tex
  cat book.tex >> temp/book-$volume.tex
  cat temp/intermediate-$volume.tex >> temp/book-$volume.tex
  rm temp/intermediate-$volume.tex
  echo "\endgroup \end{document}" >> temp/book-$volume.tex
  echo "${RED}Running XeLaTeX:"
  cd temp
  xelatex book-$volume.tex book-$volume.pdf
  cd ..
  mv temp/book-$volume.aux results/book-$volume.aux
  mv temp/book-$volume.log results/book-$volume.log
  mv temp/book-$volume.pdf results/book-$volume.pdf
  mv temp/book-$volume.tex results/book-$volume.tex
  volume=$(( $volume+1 ))
done