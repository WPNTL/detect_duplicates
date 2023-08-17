#!/bin/bash

declare -A file_sizes     # Associative array for file sizes
declare -A file_hashes    # Associative array for MD5 hashes

directory_to_check="/path/to/your/directory"

# Function to calculate the MD5 hash of a file
calculate_hash() {
    echo $(md5sum "$1" | awk '{print $1}')
}

# Iterate through all files in the directory
for file in "$directory_to_check"/*; do
    size=$(stat -c %s "$file")
    hash=$(calculate_hash "$file")

    # Check for duplicate sizes
    if [[ -n "${file_sizes[$size]}" ]]; then
        file_sizes[$size]+=" $file"
    else
        file_sizes[$size]=$file
    fi

    # Check for duplicate content (MD5 hash)
    if [[ -n "${file_hashes[$hash]}" ]]; then
        file_hashes[$hash]+=" $file"
    else
        file_hashes[$hash]=$file
    fi
done

# Display duplicates by size
echo "Duplicates by size:"
for size in "${!file_sizes[@]}"; do
    files="${file_sizes[$size]}"
    if [[ $(echo "$files" | wc -w) -gt 1 ]]; then
        echo "Size: $size bytes"
        echo "Files: $files"
        echo
    fi
done

# Display duplicates by content (MD5 hash)
echo "Duplicates by content (MD5 hash):"
for hash in "${!file_hashes[@]}"; do
    files="${file_hashes[$hash]}"
    if [[ $(echo "$files" | wc -w) -gt 1 ]]; then
        echo "Hash: $hash"
        echo "Files: $files"
        echo
    fi
done
