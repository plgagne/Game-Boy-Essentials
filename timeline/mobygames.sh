#!/bin/zsh

# MobyGames API Docs
# https://www.mobygames.com/info/api

# MobyGames API Key
key=vC7/9vmj7RGEMdT14uf3Aw==

# Offset 
offset=0

# Game Boy Platform ID
game_boy=10
game_boy_color=11

# MobyGames API Limit
hourly_rate_limit=360

# Set red for echo output
RED='\033[0;31m'

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
    echo "${RED}$offset"
    for i in {0..8}
        do
            curl -k --location --request GET "https://api.mobygames.com/v1/games?api_key=$key&platform=$platform&format=id&offset=$offset" | jq '.' >> $file
            let "offset+=100"
            echo $offset
            sleep 2
        done
    offset=0
        
    # Make valid JSON 
    jq -s 'map(.[][])' $file > INPUT.tmp && mv INPUT.tmp $file
    jsonlint -q $file
}

games_fetch() {
    file="temp/games.json"
    rm $file
    jq -r '.[]' "temp/game_ids.json" | while read id; do
        curl -k --location --request GET "https://api.mobygames.com/v1/games?api_key=$key&format=normal&id=$id" | jq '.' >> $file
        sleep 2
    done
    jsonlint -q $file
}

platform_release_fetch() {
    platform=$game_boy
    file="temp/releases.json"
    rm $file
    jq -r '.[]' "temp/game_ids.json" | while read id; do
        curl -k --location --request GET "https://api.mobygames.com/v1/games/$id/platforms/$platform?api_key=$key" | jq '.' >> $file
        sleep 2
    done
    jsonlint -q $file
}

gb_gbc_ids_fetch