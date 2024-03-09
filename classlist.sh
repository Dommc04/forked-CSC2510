#!/bin/bash

# Check if the correct number of arguments is received
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file> <username>"
    exit 1
fi

# Assign parameters to variables
file="$1"
username="$2"

# Check if the file exists and is a regular file
if [ ! -f "$file" ]; then
    echo "Error: File '$file' does not exist or is not a regular file."
    exit 1
fi

# Check if the username already exists in the file
line_number=$(grep -n "^$username$" "$file" | cut -d: -f1)

if [ -n "$line_number" ]; then
    echo "The name '$username' exists in the file on line $line_number."
else
    # Loop until a valid answer is provided
    while true; do
        read -p "Do you want to add '$username' to $file? (Y/N): " response

        case $response in
            [Yy]|[Yy][Ee][Ss])
                read -p "Do you want $file to be alphabetized after adding '$username'? (Y/N): " alphabetize_response

                case $alphabetize_response in
                    [Yy]|[Yy][Ee][Ss])
                        # Add the username and alphabetize the file
                        echo "$username" >> "$file"
                        sort -o "$file" "$file"
                        echo "Username '$username' added and file alphabetized."
                        break
                        ;;
                    [Nn]|[Nn][Oo])
                        # Add the username without alphabetizing
                        echo "$username" >> "$file"
                        echo "Username '$username' added."
                        break
                        ;;
                    *)
                        echo "Invalid response. Please enter Y/y/Yes/yes or N/n/No/no."
                        ;;
                esac
                ;;
            [Nn]|[Nn][Oo])
                echo "Exiting script. Username '$username' not added."
                exit 0
                ;;
            *)
                echo "Invalid response. Please enter Y/y/Yes/yes or N/n/No/no."
                ;;
        esac
    done
fi