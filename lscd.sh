#!/bin/bash

# Check if directory path is provided
if [ -z "$1" ]
  then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

# Change to directory provided as argument
cd "$1"
# List files and folders with numbers
ls -1 | cat -n

# Prompt user to choose a number
echo "Enter a number to navigate into the corresponding directory or type new to create project:"
read choice                                                                                            
                                                                                                       
# Check if user wants to make new project                                                              
if [[ "$choice" == "new" ]]                                                                            
  then                                                                                             
    read -p "Enter the name of the new folder: " folder_name                                         
    mkdir "$folder_name"                                                                                 
    cd "$folder_name"                                                                                    
# Create folders
	mkdir src
	mkdir test
	mkdir build
# Populate folders
	
# Check if choice is a number                                                                            
elif [[ $choice =~ ^[0-9]+$ ]]                                                                           
  then                                                                                                   
    # Get the directory name corresponding to the choice                                                 
    directory=$(ls -1 | sed -n "${choice}p")                                                             
                                                                                                         
    # Check if the selected item is a directory                                                          
    if [ -d "$directory" ]                                                                               
      then                                                                                               
        cd "$directory"                                                                                  
        bashIDE.sh                                                                                       
      else                                                                                               
        echo "The selected item is not a directory."                                                     
        exit 1
    fi
# Check if invalid input                                                                                
elif [[ "$choice" != "new" ]] && ! [[ $choice =~ ^[0-9]+$ ]]                                             
  then                                                                                                   
    echo "Invalid input: Not a number or 'new'."                                                         
    exit 1
fi
