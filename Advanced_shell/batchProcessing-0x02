#!/bin/bash

# List of Pokémon to fetch
POKEMONS=("bulbasaur" "ivysaur" "venusaur" "charmander" "charmeleon")

API_URL="https://pokeapi.co/api/v2/pokemon"

for pokemon in "${POKEMONS[@]}"; do
    echo "Fetching data for $pokemon..."

    # Make API request
    response=$(curl -s -w "%{http_code}" "$API_URL/$pokemon")

    # Extract HTTP status code
    http_code="${response: -3}"

    # Extract JSON body (everything except last 3 characters)
    json="${response::-3}"

    # Check if request was successful
    if [[ "$http_code" == "200" ]]; then
        echo "$json" > "${pokemon}.json"
        echo "Saved ${pokemon}.json"
    else
        echo "Error fetching $pokemon (HTTP $http_code)" >> errors.txt
    fi

    # Delay to avoid rate limiting
    sleep 1
done
