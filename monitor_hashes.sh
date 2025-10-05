#!/bin/bash
# This script will monitor the hash files in the app directory.

echo "--- Starting Hash File Monitor ---"
echo ""

# Loop through all files in the app/ directory
for file in app/*; do
  if [ -f "$file" ]; then # Check if it is a file
    echo "========================================"
    echo "Checking file (commit hash): $(basename "$file")"
    echo "----------------------------------------"

    # Run lsof on the file.
    # If there's no output, it means no process is currently using it.
    lsof "$file"

    # lsof exits with a non-zero status if it doesn't find any open files.
    # We can check for that to provide a clearer message.
    if ! lsof "$file" >/dev/null 2>&1; then
        echo "No processes are currently interacting with this file."
    fi

    echo "========================================"
    echo ""
  fi
done

echo "--- Monitoring Complete ---"