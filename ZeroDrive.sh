#!/bin/bash

# Check if root
if [ "$EUID" -ne 0 ]; then
    echo "Run as root."
    exit
fi

# Check parameter 
if [ -z "$1"]; then
    echo "Usage: $0 <drive>"
    exit
fi

drive="$1"

# You sure?
read -p "Are you sure you want to erase $drive? (y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Use dd 
    dd if=/dev/zero of="$drive" bs=4M status=progress

    echo "$drive has been erased with zeros."
else
    echo "Operation canceled."
fi