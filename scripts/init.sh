#!/usr/bin/env bash

host="$1"
host_file="$2"

if [[ -z "$host" || -z "$host_file" ]]; then
    echo "usage: ./init.sh <host> <file_location>"
fi

echo "Writing '$host' to '$host_file' file"
echo "$host" > $host_file
