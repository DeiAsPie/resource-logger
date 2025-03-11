#!/bin/bash

# Script to monitor and log CPU and memory usage every second

# Setup output file
OUTPUT_DIR="/home/user/Downloads/work/load-balancer/logs"
OUTPUT_FILE="$OUTPUT_DIR/resource_usage_$(date +%Y%m%d_%H%M%S).log"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Write headers to the log file
echo "Timestamp,CPU_Usage(%),Memory_Used(MB),Memory_Free(MB),Memory_Total(MB)" > "$OUTPUT_FILE"

echo "Starting system resource monitoring. Press Ctrl+C to stop."
echo "Logging to: $OUTPUT_FILE"

# Trap Ctrl+C to display a message when exiting
trap 'echo -e "\nMonitoring stopped. Data saved to $OUTPUT_FILE"; exit 0' INT

# Monitoring loop
while true; do
    # Get current timestamp
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    
    # Get CPU usage (100% - idle percentage)
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    
    # Get memory information in MB
    MEM_INFO=$(free -m | grep "Mem:")
    MEM_TOTAL=$(echo "$MEM_INFO" | awk '{print $2}')
    MEM_USED=$(echo "$MEM_INFO" | awk '{print $3}')
    MEM_FREE=$(echo "$MEM_INFO" | awk '{print $4}')
    
    # Write to log file
    echo "$TIMESTAMP,$CPU_USAGE,$MEM_USED,$MEM_FREE,$MEM_TOTAL" >> "$OUTPUT_FILE"
    
    # Display current values in console
    echo -e "[$TIMESTAMP] CPU: ${CPU_USAGE}% | Memory: ${MEM_USED}MB used, ${MEM_FREE}MB free (Total: ${MEM_TOTAL}MB)"
    
    # Wait for 1 second
    sleep 1
done
