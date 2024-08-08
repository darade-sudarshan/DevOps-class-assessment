#!/bin/bash

# Configurable parameters
LOG_DIR="var/lib/backup"
ARCHIVE_DIR="var/lib/backup/archive"
MAX_LOG_SIZE=10485760  # 10 MB in bytes
MAX_LOG_AGE=2  # Delete logs older than 2 days
COMPRESSION_TYPE="gz"  # Compression type: gz, bz2, or xz

# Function to create directories if they don't exist
create_directory() {
    local dir_path="$1"
    if [ ! -d "$dir_path" ]; then
        mkdir -p "$dir_path"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to create directory $dir_path" >&2
            exit 1
        fi
    fi
}

# Function to rotate and compress logs by size
rotate_and_compress_logs() {
    for log_file in "$LOG_DIR"/*.log; do
        if [ -f "$log_file" ]; then
            local log_size
            log_size=$(stat -c%s "$log_file")
            if [ $log_size -ge $MAX_LOG_SIZE ]; then
                local timestamp
                timestamp=$(date +"%Y%m%d%H%M%S")
                local rotated_file="$ARCHIVE_DIR/$(basename "$log_file").$timestamp"
                mv "$log_file" "$rotated_file"
                if [ $? -ne 0 ]; then
                    echo "Error: Failed to rotate log file $log_file" >&2
                    exit 1
                fi
                compress_log "$rotated_file"
                touch "$log_file"  # Create a new empty log file
                echo "Rotated and compressed $log_file due to size."
            fi
        fi
    done
}

# Function to compress a log file
compress_log() {
    local file="$1"
    case "$COMPRESSION_TYPE" in
        "gz")
            gzip "$file"
            ;;
        "bz2")
            bzip2 "$file"
            ;;
        "xz")
            xz "$file"
            ;;
        *)
            echo "Error: Unsupported compression type $COMPRESSION_TYPE" >&2
            exit 1
            ;;
    esac
    echo "Compressed $file to ${file}.${COMPRESSION_TYPE}"
}

# Function to delete logs older than a specified number of days
delete_old_logs() {
    find "$ARCHIVE_DIR" -name "*.log.*" -type f -mtime +$MAX_LOG_AGE -exec rm -f {} \;
    if [ $? -eq 0 ]; then
        echo "Deleted logs older than $MAX_LOG_AGE days from $ARCHIVE_DIR"
    else
        echo "Error: Failed to delete old logs from $ARCHIVE_DIR" >&2
        exit 1
    fi
}

# Main function to manage logs
manage_logs() {
    create_directory "$ARCHIVE_DIR"
    rotate_and_compress_logs
    delete_old_logs
    echo "Log management tasks completed."
}

# Execute the main function
manage_logs
