#!/bin/bash

DICTIONARY="/usr/share/dict/american-english"

echo "Mining KFC coins"

OUTPUT="coins.txt"
> "$OUTPUT"


count_leading_zeros() {
  local str=$1
  echo "$str" | grep -o '^0*' | head -1 | wc -c
}

for nonce in $(seq 10 9999); do
  while read -r word; do
    combo="${nonce}${word}"
    hash=$(printf "%s" "$combo" | sha256sum | awk '{print $1}')
    zeros=$(count_leading_zeros "$hash")
    zeros=$((zeros - 1))  

    if [[ $zeros -ge 3 ]]; then
      echo "$combo" >> "$OUTPUT"
      echo "$combo: $hash"
    fi

    if [[ $zeros -ge 4 ]]; then
      echo  "Mining complete."
      exit 0
    fi

  done < "$DICTIONARY"
done

