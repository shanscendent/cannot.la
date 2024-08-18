#!/bin/bash

# Check if SERVER and LOCATION environment variables are set
if [ -z "$SERVER" ]; then
    echo "ERROR: SERVER environment variable is not set."
    exit 1
fi

if [ -z "$LOCATION" ]; then
    echo "ERROR: LOCATION environment variable is not set."
    exit 1
fi

# Build static site
hugo --minify

# Copy the contents of public/ to the specified location on the remote server
rsync -avz --delete public/ "$SERVER":"$LOCATION"

# Check if the rsync command was successful
if [ $? -eq 0 ]; then
    echo "Successfully copied contents to $SERVER:$LOCATION"
else
    echo "ERROR: Failed to copy contents to $SERVER:$LOCATION"
    exit 1
fi
