#!/bin/bash

# Configurable parameters
LOG_FILES=("/var/log/syslog" "/var/log/auth.log" "/var/log/myapp.log")
ERROR_PATTERNS=("OutOfMemoryError" "Failed to start" "segfault" "permission denied" "connection refused")

# Function to print troubleshooting steps
print_troubleshooting_steps() {
    local issue="$1"
    case "$issue" in
        "OutOfMemoryError")
            echo "Troubleshooting Steps for Out of Memory Error:"
            echo "1. Check memory usage with 'free -h' or 'top'."
            echo "2. Consider increasing swap space or adding more RAM."
            echo "3. Optimize application memory usage."
            echo "4. For Java applications, adjust JVM heap size parameters (e.g., -Xmx)."
            ;;
        "Failed to start")
            echo "Troubleshooting Steps for Failed Service Start:"
            echo "1. Check service status with 'systemctl status <service_name>'."
            echo "2. Review service configuration files for errors."
            echo "3. Look for dependency issues or missing services."
            echo "4. Restart the service with 'systemctl restart <service_name>'."
            ;;
        "segfault")
            echo "Troubleshooting Steps for Segmentation Fault:"
            echo "1. Check hardware for issues (e.g., RAM, disk)."
            echo "2. Ensure software is up-to-date."
            echo "3. If possible, obtain and analyze core dump with 'gdb'."
            echo "4. Report the issue to the software vendor or maintainers."
            ;;
        "permission denied")
            echo "Troubleshooting Steps for Permission Denied:"
            echo "1. Verify file/directory permissions with 'ls -l'."
            echo "2. Change ownership if necessary with 'chown <user>:<group> <file>'."
            echo "3. Modify permissions with 'chmod' as needed."
            echo "4. Ensure you have appropriate sudo privileges."
            ;;
        "connection refused")
            echo "Troubleshooting Steps for Connection Refused:"
            echo "1. Verify the service is running and listening on the correct port."
            echo "2. Check firewall settings (e.g., 'iptables', 'ufw')."
            echo "3. Confirm network connectivity between client and server."
            echo "4. Review service logs for more details."
            ;;
        *)
            echo "No specific troubleshooting steps found for issue: $issue"
            ;;
    esac
}

# Function to analyze logs and identify issues
analyze_logs() {
    for log_file in "${LOG_FILES[@]}"; do
        if [ -f "$log_file" ]; then
            echo "Analyzing $log_file..."
            while IFS= read -r line; do
                for pattern in "${ERROR_PATTERNS[@]}"; do
                    if echo "$line" | grep -qi "$pattern"; then
                        echo "Issue found in $log_file: $line"
                        print_troubleshooting_steps "$pattern"
                        echo ""
                    fi
                done
            done < "$log_file"
        else
            echo "Warning: Log file $log_file not found." >&2
        fi
    done
}

# Main function to perform log analysis
perform_log_analysis() {
    echo "Starting log analysis..."
    analyze_logs
    echo "Log analysis completed."
}

# Execute the main function
perform_log_analysis
