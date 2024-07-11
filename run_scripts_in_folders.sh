#!/bin/bash

# Function to recursively search and execute specified script
execute_collect_scripts() {
  local dir="$1"
  local script_name="$2"
  
  # Iterate over all items in the directory
  for item in "$dir"/*; do
    if [ -d "$item" ]; then
      # If the item is a directory, call the function recursively
      execute_collect_scripts "$item" "$script_name"
    elif [ -f "$item" ] && [ "$(basename "$item")" == "$script_name" ]; then
      # If the item is a file and its name matches the script name, execute it
      echo "In directory $dir"
      echo "Run $item..."
      cd $dir
      bash "./$script_name"
    fi
  done
}

# Check if script name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <script_name>"
  exit 1
fi

# Start the script from the current directory
execute_collect_scripts "." "$1"
