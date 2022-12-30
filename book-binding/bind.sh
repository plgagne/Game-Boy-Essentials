#!/bin/zsh
# Reset temp 
rm -rf "/temp"
mkdir "/temp"
bundle exec jekyll build --source ../ --destination ../ --config ../_config.yml,../_local.yml
cp -r "../_site-local/articles/" "/temp"
kramdown volume-3-intro.md >temp/volume-3-intro.html