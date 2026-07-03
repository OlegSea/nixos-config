#!/usr/bin/env bash

INPUT_FILE="versions.txt"
OUTPUT_FILE="output.nix"

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: $INPUT_FILE not found."
    exit 1
fi

> "$OUTPUT_FILE"

VARS=({a..z} {a..z}{a..z})
INDEX=0

while IFS= read -r versionID || [[ -n "$versionID" ]]; do
    [[ -z "$versionID" ]] && continue

    var_name="${VARS[$INDEX]}"
    echo "Fetching $versionID -> $var_name..."

    output=$(nix run github:Infinidoge/nix-minecraft#nix-modrinth-prefetch -- "$versionID")

    if [[ -n "$output" ]]; then
        output="${output/fetchurl/$var_name = fetchurl}"

        output="${output};"

        echo "$output" >> "$OUTPUT_FILE"

        ((INDEX++))
    else
        echo "Warning: Command failed or returned empty for $versionID"
    fi
done < "$INPUT_FILE"

echo "Finished! Results saved to $OUTPUT_FILE."
