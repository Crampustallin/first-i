#!/bin/bash

# Check if the input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file=$1

# Task 1: Extract the 10 most frequent IP addresses
echo "Top 10 most frequent IP addresses:"
awk -F'\t' '{print $2}' "$input_file" | sort | uniq -c | sort -nr | head -n 10

# Task 2: List all hosts with the number of requests to them
echo -e "\nHosts with the number of requests:"
awk -F'\t' '{print $1}' "$input_file" | sort | uniq -c | sort -nr

# Task 3: Count the number of unique IP addresses
echo -e "\nNumber of unique IP addresses:"
awk -F'\t' '{print $2}' "$input_file" | sort -u | wc -l
