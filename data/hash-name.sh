#!/bin/bash

INPUT_FILE="quiz_data.csv"
OUTPUT_FILE="salted-data.csv"

# Check if input file exists



if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Error: $INPUT_FILE not found!"
  exit 1
fi

# Make temp files

TMP_SALTS="salts.tmp"
TMP_HASHES="hashes.tmp"


# Step 1: Extract unique user names from the first column


awk -F, 'NR > 1 {print $1}' "$INPUT_FILE" | sort | uniq > users.tmp


