#Shebang
#!/bin/bash
answer="yes"
while [ $answer = "yes" ]; do
    #Initialize the variables of the counter and the max of characters, words and lines
    var=1
    max=30
    max_words=30
    max_char=300
    max_lines=11
    # This will open vim text editor so that the user can edit the file.txt
    vim file.txt
    # After the user edited the texte next it needs to be edited.
    # First the characters if the characteres of the file are exceeding 300 characters.
    # If it is not the case it will do nothing
    if [ $(wc -c < file.txt) -gt $max_char ]; then
    truncate -s $max_char file.txt
    fi
    # Second the lines it limit them in 10 lines.
    if [ $(wc -l < file.txt) -gt $max_lines ]; then
    # I used sed here but head can be used and store the first 10 lines in temp file and rename it later.
    # cat file.txt | head -n 10 > .temp.txt
    # rm file.txt
    # mv .temp.txt file.txt
    # Just sed seemed a bit simple.
    sed -i "$max_lines,$ d" file.txt
    else
    # If the number of lines is under 10 lines it store this number in a variable that will be used in limiting the number of words.
    max_lines=$(wc -l < file.txt)
    fi
    # Last but not least the words.
    if [ $(wc -w < file.txt) -gt $max_words ]; then
        # Create a new file called `new_file.txt`
        touch new_file.txt
        # Emptying the file by in case it was already created and it has some text in it.
        truncate -s 0 new_file.txt
        # Start a while loop that will iterate 10 times or less
        while [ $var -lt $(($max_lines + 1)) ]; do
            # this enable us to limite the number of words in a single.
            cat file.txt | sed -n "$var p" | cut -d " " -f 1-$max_words >> new_file.txt
            # The maximum number of words in line needs to be changed.
            if [ $(wc -w < new_file.txt) -lt $max ]; then
                max_words=$(($max - $(wc -w < new_file.txt)))
            fi
            # if the number of words in the file reached the limit the loop while be stoped and no more words can be added to the file.
            if [ $(wc -w < new_file.txt) -eq $max ]; then
                break
            fi
            # Increment the variable `var` that indicates the line we are working on.
            ((var++))
        done
        # Here we remove the file that is not limited on words and we replace with the one that its under the limit.
        rm file.txt
        mv new_file.txt file.txt
    fi
    # Now we display the file after it has been edited.
    echo "The file has been edited to the following specifications(300 char/150 words/10 lines):"
    echo "_________________________________"
    cat file.txt
    echo "---------------------------------"
    # After displaying it we ask the usern if he wants to edit the text more or not.
    # if yes the while loop will start all over otherwise it will exit the programme.
    echo "Do you want to edit the file more? (yes/no)"
    read answer
done