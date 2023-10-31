#!/bin/bash
# Initialize the variable `var`
answer=1
while [ $answer -eq 1 ]; do
    var=1
    max=30
    max_words=30
    max_char=300
    max_lines=11
    vim file.txt
    if [ $(wc -c < file.txt) -gt $max_char ]; then
    truncate -s $max_char file.txt
    fi
    if [ $(wc -l < file.txt) -gt $max_lines ]; then
    sed -i "$max_lines,$ d" file.txt
    else 
    max_lines=$(wc -l < file.txt)
    fi
    if [ $(wc -w < file.txt) -gt $max_words ]; then
        # Create a new file called `new_file.txt`
        touch new_file.txt
        # Start a while loop that will iterate 10 times
        truncate -s 0 new_file.txt
        while [ $var -lt $(($max_lines + 1)) ]; do
            # Print the first word from each line of the file `file.txt`
            cat file.txt | sed -n "$var p" | cut -d " " -f 1-$max_words >> new_file.txt
            if [ $(wc -w < new_file.txt) -lt $max ]; then
                max_words=$(($max - $(wc -w < new_file.txt)))
            fi
            if [ $(wc -w < new_file.txt) -eq $max ]; then
                break
            fi
            # Increment the variable `var`
            ((var++))
        done
        rm file.txt
        mv new_file.txt file.txt
    fi
    cat file.txt
    echo "Do you want to edit the file more? (1/0)"
    read answer
    if [ $answer -eq 0 ]; then
        break
    fi
done