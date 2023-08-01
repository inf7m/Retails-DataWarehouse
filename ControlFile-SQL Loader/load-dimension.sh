#!/bin/bash

# Directory containing the .ctl files
ctl_directory="/ControlLOADER"

# Check if the directory exists
if [ ! -d "$ctl_directory" ]; then
    echo "Directory not found: $ctl_directory"
    exit 1
fi


for ctl_file in "$ctl_directory"/*.ctl; do
    if [ -f "$ctl_file" ]; then
        echo "Running $ctl_file..."
        sqlldr username/password@database control="$ctl_file" log="${ctl_file%.ctl}.log"
        echo "Finished!"
    fi
done
