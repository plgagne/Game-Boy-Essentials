#!/bin/zsh

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
    curl -k --location --request GET "https://api.mobygames.com/v1/platforms?api_key=$key" | jq '.' > "platforms.json"
}

game_list_fetch() {
    rm "games.json"
    platform=$game_boy
    for x in {0..1}
    do
        echo Doing platform number:$platform
        echo $offset
        for i in {0..8}
        do
            curl -k --location --request GET "https://api.mobygames.com/v1/games?platform=$platform&format=id&offset=$offset&api_key=$key" | jq '.' >> "games.json"
            let "offset+=100"
            echo $offset
            sleep 2
        done
        offset=0
        platform=$game_boy_color
    done   
}

specific_game_fetch() {
    curl -k --location --request GET "https://api.mobygames.com/v1/games/141/platforms/10?api_key=$key" | jq '.' > "specific.json"
}

game_list_fetch