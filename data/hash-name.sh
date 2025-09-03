#!/bin/bash

INPUT_FILE="quiz_data.csv"
OUTPUT_FILE="salted-data.csv"

# Check input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Error: $INPUT_FILE not found!"
  exit 1
fi

