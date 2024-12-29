#!/bin/bash

# Get today's date in YYYY-MM-DD format
TODAY=$(date +%Y-%m-%d)

# Create file if it doesn't exist
if [ ! -f "src/${TODAY}.md" ]; then
    touch "src/${TODAY}.md"

    # Create new entry line for SUMMARY.md
    NEW_ENTRY="- [${TODAY}](./${TODAY}.md)"

    # Find the line number of [Home] entry
    HOME_LINE=$(grep -n "\[Home\]" src/SUMMARY.md | cut -d: -f1)

    # Check if entry already exists
    if grep -q "${TODAY}" src/SUMMARY.md; then
        echo "Error: Entry for ${TODAY} already exists in SUMMARY.md"
        exit 1
    fi

    # Insert new entry after [Home] line
    if [ ! -z "$HOME_LINE" ]; then
        # Use sed to insert the new entry after [Home] line
        sed -i "${HOME_LINE}a\\${NEW_ENTRY}" src/SUMMARY.md
        echo "Added new entry to SUMMARY.md"
    else
        echo "Error: Could not find [Home] entry in SUMMARY.md"
        exit 1
    fi

    echo "Created ${TODAY}.md"
else
    echo "${TODAY}.md already exists"
fi
