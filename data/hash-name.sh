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



# Step 2:  Generate unique 5-character salt for each user

rm -f salts.tmp
while read -r user; do
  salt=$(cat /dev/urandom | tr -dc 'A-Za-z0-9' | head -c5)
  echo "$user,$salt" >> salts.tmp
done < users.tmp

# Step 3: Creating the salted hashes. Hashing salt + username.

rm -f hashes.tmp
while IFS=',' read -r user salt; do
  salted_id="${salt}${user}"
  hash=$(printf "%s" "$salted_id" | sha256sum | awk '{print $1}')
  salted_hash="${salt}${hash}"
  echo "$user,$salted_hash" >> hashes.tmp
done < salts.tmp
 
