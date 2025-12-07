#!/bin/bash

# Ensure JSON exists
if [ ! -f data.json ]; then
    echo "data.json not found. Run the fetch script first."
    exit 1
fi

# Extract fields using jq
name=$(jq -r '.name' data.json | sed 's/.*/\u&/')
height=$(jq -r '.height' data.json)
weight=$(jq -r '.weight' data.json)
type=$(jq -r '.types[0].type.name' data.json | sed 's/.*/\u&/')

# Convert Pokémon height/weight to meters/kg (PokéAPI returns decimeters and hectograms)
height_m=$(awk "BEGIN { printf \"%.1f\", $height / 10 }")
weight_kg=$(awk "BEGIN { printf \"%.1f\", $weight / 10 }")

# Output formatted sentence
echo "$name is of type $type, weighs ${weight_kg}kg, and is ${height_m}m tall."
