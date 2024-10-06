#!/usr/bin/env bash

host_file="$1"

if [ -z "$host_file" ]; then
    echo "usage: ./test.sh <host_file>"
    exit 1
fi

host=$(head -n 1 $host_file)

if [ -z "$host" ]; then
    echo "could not find host from '$host_file'"
    exit 1
fi

echo "testing '$host'"
sudo nixos-rebuild test --flake .#$host
