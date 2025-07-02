# System Monitoring and Report Tool

A comprehensive bash script for monitoring system resources and generating detailed system reports on Linux systems.

## Overview

This tool provides real-time monitoring of system resources including CPU usage, memory consumption, disk space, and running processes. It generates a comprehensive report that can be used for system administration, performance analysis, and troubleshooting.

## Features

- **System Information**: Display hostname, kernel version, CPU model, and basic system specs
- **CPU Monitoring**: Real-time CPU usage statistics using `mpstat`
- **Memory Tracking**: Current memory usage and availability
- **Disk Usage**: Storage space utilization across all mounted filesystems
- **Process Monitoring**: Top CPU and memory consuming processes
- **Error Handling**: Built-in error checking and user feedback

## Prerequisites

- Linux operating system
- Bash shell
- `sysstat` package (for `mpstat` command)

### Installing Prerequisites

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install sysstat
```

**CentOS/RHEL/Fedora:**
```bash
sudo yum install sysstat
# or for newer versions
sudo dnf install sysstat
```

## Usage

1. Make the script executable:
```bash
chmod +x system_monitor.sh
```

2. Run the script:
```bash
./system_monitor.sh
```

## Output

The script generates a comprehensive report with the following sections:

1. **System Information**
   - Hostname
   - Kernel version
   - CPU model information
   - Memory overview
   - Disk storage summary

2. **CPU Usage**
   - Real-time CPU statistics
   - Usage percentages across cores

3. **Memory Usage**
   - Available, used, and free memory
   - Swap usage information

4. **Disk Usage**
   - Filesystem usage percentages
   - Available space per mount point

5. **Process Information**
   - Top 10 CPU-consuming processes
   - Top 10 memory-consuming processes

## Script Structure

- `command_exists()`: Checks if required commands are available
- `handle_errors()`: Provides error handling and user feedback
- `gather_system_info()`: Collects basic system information
- `monitor_cpu_usage()`: Monitors CPU performance
- `track_memory_usage()`: Tracks memory consumption
- `check_disk_usage()`: Checks disk space utilization
- `monitor_process()`: Monitors running processes
- `generate_report()`: Orchestrates all monitoring functions
- `main()`: Entry point of the script

## Error Handling

The script includes built-in error handling for:
- Missing required commands (like `mpstat`)
- System command failures
- Permission issues

## Troubleshooting

**"mpstat command not found" error:**
- Install the `sysstat` package using your distribution's package manager
- Ensure the package is properly installed and accessible in your PATH

**Permission denied errors:**
- Make sure the script has execute permissions (`chmod +x`)
- Some system information may require elevated privileges

## Author

- **Author**: Selalelo
- **Version**: v1
- **Date**: 12 February 2024

## License

This project is open source and available for modification and distribution.

## Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## Future Enhancements

Potential improvements for future versions:
- Network monitoring capabilities
- Historical data logging
- Configuration file support
- Output formatting options (JSON, XML, etc.)
- Email alerting for critical thresholds
- Web interface for remote monitoring
