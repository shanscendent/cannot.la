#!/bin/zsh

# Store the original directory
original_dir=$(pwd)

# Navigate to the content directory
cd content/ || exit

# Force update all files
find . -type f -exec zsh -c '
  file="$1"
  # Get file size
  size=$(stat -f%z "$file")
  # Add a newline to the file
  echo "" >> "$file"
  # Truncate to remove the newline
  truncate -s $size "$file"
' _ {} \;

# Return to the original directory
cd "$original_dir" || exit

echo "Forced update of all files in the content/ directory to trigger Hugo reload."
