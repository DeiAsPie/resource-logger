# Resource Logger

A simple bash script for monitoring and logging system resource usage (CPU and memory) at regular intervals.

## Overview

This project provides a lightweight solution for tracking system resource utilization over time. It's particularly useful for:
- Benchmarking applications
- Analyzing system performance
- Identifying resource bottlenecks
- Monitoring server loads

## Features

- Real-time monitoring of CPU usage percentage
- Memory usage tracking (used, free, and total)
- CSV-formatted logs with timestamps
- Console output with current readings
- Configurable output directory

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/DeiAsPie/resource-logger.git
   cd resource-logger
   ```

2. Make the script executable:
   ```
   chmod +x monitor_resources.sh
   ```

## Usage

Run the script:

```
./monitor_resources.sh
```

By default, logs are saved to `/home/user/Downloads/work/load-balancer/logs/`. To modify this, edit the `OUTPUT_DIR` variable in the script.

To stop monitoring, press `Ctrl+C`. The script will display the path to the saved log file.

## Output Format

The script generates CSV files with the following columns:

| Column | Description |
|--------|-------------|
| Timestamp | Date and time (YYYY-MM-DD HH:MM:SS) |
| CPU_Usage(%) | CPU utilization percentage |
| Memory_Used(MB) | Used memory in megabytes |  
| Memory_Free(MB) | Free memory in megabytes |
| Memory_Total(MB) | Total system memory in megabytes |

## Example Output

```
2023-10-15 14:25:30,23.5,1540,2252,3792
2023-10-15 14:25:31,15.7,1542,2250,3792
2023-10-15 14:25:32,18.3,1545,2247,3792
```

## License

[MIT License](LICENSE)
