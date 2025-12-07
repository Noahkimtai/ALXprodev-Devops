#!/bin/bash

# API URL
URL="https://pokeapi.co/api/v2/pokemon/pikachu"

# Output files
OUTPUT_FILE="data.json"
ERROR_FILE="errors.txt"

# Make GET request
response=$(curl -s -o "$OUTPUT_FILE" -w "%{http_code}" "$URL")

# Check if request was successful (HTTP 200)
if [ "$response" -ne 200 ]; then
    echo "Request failed with status code: $response" >> "$ERROR_FILE"
    echo "Failed to fetch Pokémon data. Check errors.txt."
    exit 1
fi

echo "Pikachu data saved to $OUTPUT_FILE"
