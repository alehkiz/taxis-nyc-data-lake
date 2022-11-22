#!/bin/bash
#Get all datasets in parquet from nyc

curl -k https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page | grep ".parquet" | cut -f2 -d"\"" > "datasets.txt"