#!bin/bash

# Author : Sudarshan Darade.
# Description : script for sysops to automate system monitoring and generate detailed reports
# creation date : 22 July 2024


echo "Today's date is:"
date
echo "Current directory files:"
ls 


#Script Initialization:
# Define date in  yy:mm:dd hh:mm:ss format
DATE=$(date '+%Y-%m-%d %H:%M:%S')
# Define System hostname
HOST=$(hostname)
# Define the log file to parse
LOG_FILE="/var/log/syslog"

# Define the output file for summaries
OUTPUT_FILE="log_summary.txt"
#Define the output file for  error summaries
ERROR_FILE="error_summary.txt"
#Define the output file for  alert summaries
ALERT_FILE="alert_summary.txt"
#Define the output file for  critical errors summaries
CRITICAL_FILE="critical_summary.txt"
#Define the output file for  Emergency summaries
EMERG_FILE="emergency_summary.txt"
# Define the number of recent lines to parse
NUM_LINES=1000
#System Metrics Collection:

# Function to capture CPU usage
function  monitor_system {
    echo "CPU Usage:"
    mpstat | grep "all"
    echo ""
    #capture memory utilization
    echo "Memory Utilization:"
    free -h
    echo ""
    #capture disk space
    echo "Disk Space Utilization:"
    df -h
    echo ""
    #Function to capture network statistics
    echo "Network Statistics:"
    sar -n DEV 1 5
    echo ""
    # Function to capture top processes
    echo "Top Processes:"
    top -b -n1 | head -n 20
    echo ""
}
monitor_system
# Run the monitor function


# To make the script run at regular intervals, uncomment the following lines:
# while true; do
#     monitor_system
#     sleep 60 # Interval in seconds
# done


#Log Analysis:
# Function to parse logs for critical events and errors
function parse_logs {
    echo "Parsing the last $NUM_LINES lines of $LOG_FILE for critical events and errors..."
    echo "=================================" > "$OUTPUT_FILE"

    # Extract critical events and errors
    grep -E -i "crit|error|alert|emerg" "$LOG_FILE" | tail -n "$NUM_LINES" >> "$OUTPUT_FILE"

    # Generate summaries based on severity
    echo "Emergency Events:" >> "$EMERG_FILE"
    grep -i "emerg" "$OUTPUT_FILE" >> "$EMERG_FILE"
    echo "" >> "$OUTPUT_FILE"

    echo "Alert Events:" >> "$ALERT_FILE"
    grep -i "alert" "$OUTPUT_FILE" >> "$ALERT_FILE"
    echo "" >> "$OUTPUT_FILE"

    echo "Critical Events:" >> "$CRITICAL_FILE"
    grep -i "crit" "$OUTPUT_FILE" >> "$CRITICAL_FILE"
    echo "" >> "$OUTPUT_FILE"

    echo "Error Events:" >> "$ERROR_FILE"
    grep -i "error" "$OUTPUT_FILE" >> "$ERROR_FILE"
    echo "" >> "$OUTPUT_FILE"

    echo "================================="
    echo "Log summary has been saved to $OUTPUT_FILE"
}

# Run the log parsing function
parse_logs

#Health Checks:

check_service_status() {
    SERVICE=$1
    if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE is running."
    else
        echo "$SERVICE is not running."
    fi
}
check_service_status apache2
check_service_status mysql

# Function to check connectivity to external service
check_connectivity() {
    HOST=$1
    PORT=$2
    if nc -zv $HOST $PORT; then
        echo "Connection to $HOST on port $PORT is successful."
    else
        echo "Connection to $HOST on port $PORT failed."
    fi
}

# Verify connectivity to an external service or database
#EXTERNAL_HOST="example.com"
#EXTERNAL_PORT=80

#check_connectivity $EXTERNAL_HOST $EXTERNAL_PORT

# Example for checking a database (replace with your actual DB host and port)
#DB_HOST="your_db_host"
#DB_PORT=3306

#check_connectivity $DB_HOST $DB_PORT

#echo "Script completed."

#Alerting Mechanism:


#Report Generation:



#Automation and Scheduling:

#User Interaction:

#function interactive_mode() {
#  echo "Welcome to the System Monitoring Script!"
#  PS3='Please enter your choice: '
#  options=("Collect Metrics" "Analyze Logs" "Check Services" "Send Alert" "Generate Report" "Quit")
#  select opt in "${options[@]}"; do
#    case $opt in
#      "Collect Metrics")
#        collect_metrics ;;
#      "Analyze Logs")
#        analyze_logs ;;
#      "Check Services")
#        check_services ;;
#      "Send Alert")
#        send_alert;;
#      "Generate Report")
#        generate_report;;
#      "Quit")
#     break
#      ;;
#     *) echo "Invalid option $REPLY";;
#   esac
# done
#}

#interactive_mode

echo script execution completed successfully.