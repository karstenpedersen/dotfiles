#!/usr/bin/env bash

host_file="$1"

if [ -z "$host_file" ]; then
    echo "usage: ./rebuild.sh <host_file>"
    exit 1
fi

host=$(head -n 1 $host_file)

if [ -z "$host" ]; then
    echo "could not find host from '$host_file'"
    exit 1
fi

echo "rebuilding '$host'"
sudo nixos-rebuild switch --flake .#$host
