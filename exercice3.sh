#!/bin/bash
# This script will ask the user to enter a name of a file or directory
# If the file is a directory the ouput is to list the elements of the directory
# If the file is a file not executable the output is to display the content of the file
# If the file is a file executable the output is to execute the file
# If the file is not a file or a directory the output is to display an error 

if [ -z "$1" ]; then
    echo "No argument provided."
elif [ $# -gt 1 ]; then
    echo "Too many arguments provided."
elif [ -f "$1" ]; then
    echo "File found: $1"
elif [ -d "$1" ]; then
    ls "$1"
elif [ -x "$1" ]; then
    "$1"
elif [ -r "$1" ]; then
    cat "$1"
else
    echo "Invalid argument or file not found: $1"
fi
