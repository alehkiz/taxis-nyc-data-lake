#!/bin/bash

./scripts/get_datasets_links.sh
./scripts/get_yellow_trips.sh

mkdir datasets

for url in $(cat "yellow.txt")
do
    OUTPUT_FILENAME=$(echo $url | cut -f5 -d'/')
    if (($(echo $OUTPUT_FILENAME | cut -f3 -d'_' | cut -f1 -d'-') > 2012)); then
    echo "Baixando o arquivo ${OUTPUT_FILENAME}:"
    curl -k $url \
    -H 'User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/603.1.23 (KHTML, like Gecko) Version/10.0 Mobile/14E5239e Safari/602.1' \
    -o ./datasets/$OUTPUT_FILENAME
    fi
done
