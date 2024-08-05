#!/bin/zsh

# MobyGames API Docs
# https://www.mobygames.com/info/api

# MobyGames API Key
key=

# Offset
offset=0

# Game Boy Platform ID
game_boy=10
game_boy_color=11

# MobyGames API Limit
hourly_rate_limit=360

platform_list_fetch() {
  file="temp/platforms.json"
  rm $file
  curl -k --location --request GET "https://api.mobygames.com/v1/platforms?api_key=$key" | jq '.' > $file
  sleep 2
  jsonlint -q $file
}

gb_gbc_ids_fetch() {

  # GB
  platform=$game_boy
  file="temp/game_boy_ids.json"
  rm $file
  game_ids_fetch

  # GBC
  platform=$game_boy_color
  file="temp/game_boy_color_ids.json"
  rm $file
  game_ids_fetch
}

game_ids_fetch() {
  echo "${RED}Doing platform number:$platform"
  echo "${RED}Offset:$offset"
  for i in {0..8}
    do
      curl -k --location --request GET "https://api.mobygames.com/v1/games?api_key=$key&platform=$platform&format=id&offset=$offset" | jq '.' >> $file
      let "offset+=100"
      echo "${RED}Offset:$offset"
      sleep 2
    done
  offset=0

  # Make valid JSON
  jq -s 'map(.[][])' $file > INPUT.tmp && mv INPUT.tmp $file
  jsonlint -q $file
}

detailed_games_fetch() {

  # GB
  platform=$game_boy
  list="temp/game_boy_ids.json"
  file="temp/game_boy_detailed.json"
  rm $file
  touch $file
  echo '[' > $file
  echo "${RED}Doing platform number:$platform"
  games_fetch

  # GBC
  platform=$game_boy_color
  list="temp/game_boy_color_ids.json"
  file="temp/game_boy_color_detailed.json"
  rm $file
  touch $file
  echo '[' > $file
  echo "${RED}Doing platform number:$platform"
  games_fetch
}

games_fetch() {
  jq -r '.[]' $list | while read id; do

      echo "${RED}Game id:$id"

      # Get detailed release
      fetched=$(curl -k --location --request GET "https://api.mobygames.com/v1/games?api_key=$key&format=normal&id=$id")
      echo $fetched >> $file
      sleep 2

      # Get specific platform release
      sed -i '' '$s/...$/},/' $file
      fetched=$(curl -k --location --request GET "https://api.mobygames.com/v1/games/$id/platforms/$platform?api_key=$key")
      echo $fetched >> $file
      sleep 2

      # Get specific platform cover art
      echo ',' >> $file
      fetched=$(curl -k --location --request GET "https://api.mobygames.com/v1/games/$id/platforms/$platform/covers?api_key=$key")
      echo $fetched >> $file
      sleep 2

      # End the current game
      echo ']},' >> $file

  done
  tr -d "\n" < $file > "temp/tmp.json"
  sed -i '' '$s/.$/]/' "temp/tmp.json"
  jsonlint "temp/tmp.json" > $file
  rm "temp/tmp.json"
}

gb_gbc_ids_fetch
#detailed_games_fetch