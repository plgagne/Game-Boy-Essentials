#!/bin/zsh

# MobyGames API Key
key=vC7/9vmj7RGEMdT14uf3Aw==

gbfetch() {
    curl -k --location --request GET "https://api.mobygames.com/v1/platforms?api_key=$key" | jq '.' > "platforms.json"
    curl -k --location --request GET "https://api.mobygames.com/v1/games?platform=10&platform=11&api_key=$key" | jq '.' > "games.json"
}



curl -k --location --request GET "https://api.mobygames.com/v1/games/141/platforms/10?api_key=$key" | jq '.' > "specific.json"

