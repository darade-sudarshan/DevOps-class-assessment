#!/bin/bash

# Initialize script with necessary variables and configurations
LOGFILE="/var/log/system_monitor.log"
THRESHOLD_CPU=80
THRESHOLD_MEM=80
THRESHOLD_DISK=90
EMAIL_TO="sysadmin@example.com"
EMAIL_SUBJECT="Critical System Alert"
EMAIL_FROM="monitor@example.com"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Validate required commands and utilities availability
REQUIRED_CMDS=("vmstat" "iostat" "mpstat" "top" "mail")
for cmd in "${REQUIRED_CMDS[@]}"; do
  if ! command -v $cmd &> /dev/null; then
    echo "$cmd could not be found, please install it."
    exit 1
  fi
done

# System Metrics Collection
collect_system_metrics() {
  echo "Collecting system metrics..."
  echo "System Metrics Report - $DATE" >> $LOGFILE
  echo "---------------------------------" >> $LOGFILE
  echo "CPU Usage:" >> $LOGFILE
  mpstat >> $LOGFILE
  echo "Memory Usage:" >> $LOGFILE
  free -m >> $LOGFILE
  echo "Disk Usage:" >> $LOGFILE
  df -h >> $LOGFILE
  echo "Network Statistics:" >> $LOGFILE
  ifconfig >> $LOGFILE
  echo "Top Processes:" >> $LOGFILE
  top -b -o +%CPU | head -n 20 >> $LOGFILE
  echo "---------------------------------" >> $LOGFILE
}

# Log Analysis
analyze_logs() {
  echo "Analyzing logs..."
  echo "Log Analysis Report - $DATE" >> $LOGFILE
  echo "---------------------------------" >> $LOGFILE
  tail -n 100 /var/log/syslog >> $LOGFILE
  echo "---------------------------------" >> $LOGFILE
}

# Health Checks
check_services() {
  echo "Checking essential services..."
  SERVICES=("apache2" "mysql")
  for service in "${SERVICES[@]}"; do
    if systemctl is-active --quiet $service; then
      echo "$service is running" >> $LOGFILE
    else
      echo "$service is not running" >> $LOGFILE
    fi
  done
}

# Alerting Mechanism
send_alert() {
  local metric=$1
  local value=$2
  local message="Alert: $metric usage is critical at $value%"

  echo "$message" | mail -s "$EMAIL_SUBJECT" "$EMAIL_TO" -r "$EMAIL_FROM"
}

check_thresholds() {
  echo "Checking thresholds..."
  CPU_USAGE=$(mpstat | grep -A 5 "%idle" | tail -n 1 | awk '{print 100 - $ 12}')
  MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
  DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

  if (( $(echo "$CPU_USAGE > $THRESHOLD_CPU" |bc -l) )); then
    send_alert "CPU" "$CPU_USAGE"
  fi

  if (( $(echo "$MEM_USAGE > $THRESHOLD_MEM" |bc -l) )); then
    send_alert "Memory" "$MEM_USAGE"
  fi

  if (( $(echo "$DISK_USAGE > $THRESHOLD_DISK" |bc -l) )); then
    send_alert "Disk" "$DISK_USAGE"
  fi
}

# Report Generation
generate_report() {
  echo "Generating report..."
  REPORT="/var/log/system_report_$DATE.txt"
  cp $LOGFILE $REPORT
  echo "Report generated at $REPORT"
}

# Automation and Scheduling
schedule_script() {
  echo "Scheduling script..."
  (crontab -l 2>/dev/null; echo "*/5 * * * * /path/to/this_script.sh") | crontab -
}

# User Interaction
interactive_mode() {
  PS3="Select an option: "
  options=("Collect Metrics" "Analyze Logs" "Check Services" "Generate Report" "Quit")
  select opt in "${options[@]}"; do
    case $opt in
      "Collect Metrics")
        collect_system_metrics
        ;;
      "Analyze Logs")
        analyze_logs
        ;;
      "Check Services")
        check_services
        ;;
      "Generate Report")
        generate_report
        ;;
      "Quit")
        break
        ;;
      *)
        echo "Invalid option $REPLY"
        ;;
    esac
  done
}

# Main script execution
if [[ $1 == "--interactive" ]]; then
  interactive_mode
else
  collect_system_metrics
  analyze_logs
  check_services
  check_thresholds
  generate_report
fi
