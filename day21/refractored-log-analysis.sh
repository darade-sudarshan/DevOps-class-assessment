#!/bin/bash

# Configurable parameters
LOG_DIR="var/lib/backup"
ARCHIVE_DIR="var/lib/backup/archive"
MAX_LOG_SIZE=10485760  # 10 MB in bytes
MAX_LOG_AGE=2  # 2 days
ROTATED_LOG_DIR="/var/log/backup/old_logs"

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

# Function to check and rotate logs by size
rotate_by_size() {
    local log_file="$1"
    local log_size
    log_size=$(stat -c%s "$log_file")
    if [ $log_size -ge $MAX_LOG_SIZE ]; then
        local timestamp
        timestamp=$(date +"%Y%m%d%H%M%S")
        mv "$log_file" "$ROTATED_LOG_DIR/$(basename "$log_file").$timestamp"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to rotate log file $log_file" >&2
            exit 1
        fi
        touch "$log_file"
        echo "Rotated $log_file due to size."
    fi
}

# Function to check and rotate logs by age
rotate_by_age() {
    find "$LOG_DIR" -name "*.log" -type f -mtime +$MAX_LOG_AGE -print0 | while IFS= read -r -d '' log_file; do
        local timestamp
        timestamp=$(date +"%Y%m%d%H%M%S")
        mv "$log_file" "$ROTATED_LOG_DIR/$(basename "$log_file").$timestamp"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to rotate log file $log_file" >&2
            exit 1
        fi
        echo "Rotated $log_file due to age."
    done
}

# Main function to perform log rotation
perform_log_rotation() {
    create_directory "$ROTATED_LOG_DIR"

    # Rotate by size
    for log_file in "$LOG_DIR"/*.log; do
        if [ -f "$log_file" ]; then
            rotate_by_size "$log_file"
        else
            echo "Warning: No log files found in $LOG_DIR" >&2
        fi
    done

    # Rotate by age
    rotate_by_age
}

# Execute the main function
perform_log_rotation
echo "Log rotation completed."
#!/bin/bash

# Configurable parameters
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
MAX_LOG_SIZE=10485760  # 10 MB in bytes
MAX_LOG_AGE=7  # Delete logs older than 7 days
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

# Function to handle errors
handle_error() {
    local exit_code=$1
    local msg="$2"
    if [ $exit_code -ne 0 ]; then
        echo "Error: $msg" >&2
        exit 1
    fi
}

# Function to rotate and compress logs by size
rotate_and_compress_logs() {
    for log_file in "$LOG_DIR"/*.log; do
        if [ -f "$log_file" ]; then
            rotate_log_file "$log_file"
        else
            echo "No log files found in $LOG_DIR" >&2
        fi
    done
}

# Function to rotate a single log file
rotate_log_file() {
    local log_file="$1"
    local log_size
    log_size=$(stat -c%s "$log_file")
    handle_error $? "Failed to get size for $log_file"

    if [ $log_size -ge $MAX_LOG_SIZE ]; then
        local timestamp
        timestamp=$(date +"%Y%m%d%H%M%S")
        local rotated_file="$ARCHIVE_DIR/$(basename "$log_file").$timestamp"
        mv "$log_file" "$rotated_file"
        handle_error $? "Failed to rotate log file $log_file"

        compress_log "$rotated_file"
        touch "$log_file"  # Create a new empty log file
        echo "Rotated and compressed $log_file due to size."
    fi
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
    handle_error $? "Failed to compress $file"
    echo "Compressed $file to ${file}.${COMPRESSION_TYPE}"
}

# Function to delete logs older than a specified number of days
delete_old_logs() {
    find "$ARCHIVE_DIR" -name "*.log.*" -type f -mtime +$MAX_LOG_AGE -exec rm -f {} \;
    handle_error $? "Failed to delete old logs from $ARCHIVE_DIR"
    echo "Deleted logs older than $MAX_LOG_AGE days from $ARCHIVE_DIR"
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
