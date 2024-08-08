#!/bin/bash


CURRENT_DATE=$(date +'%Y%m%d_%H%M%S')

LOGFILE="Logfile_$CURRENT_DATE.log"

echo "Running System Performance Metrics Check at $(date)" >> $LOGFILE

{

echo  'disk usage for all mounted filesystems'
df -h | tail -n 30
echo
echo 'memory usage'
echo
free -h
echo
echo "System Uptime:"
uptime -p 
echo
echo "Network Status:"
    ifconfig -a | grep inet
echo
echo "Top Running Processes:"
    top -b -n 1 | head -n 15
echo

} 2>&1 | tee -a $LOGFILE

echo "" >> $LOGFILE

echo "System Performance Metrics check complete. Check log file at $LOGFILE for details."