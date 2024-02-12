#!/bin/bash

######################################
# System Monitoring and Report Tool  #
# Author: Selalelo                   #
# Version: v1                        #
# Date: 12 February 2024             #
######################################

#Function to check if command exists
command_exists(){
	command -v "$1" >/dev/null 2>&1
}

#Function to handle errors
handle_errors(){
	echo "Error: $1" >&2
	exit 1
}

#Fucntion to gathetr system information
gather_system_info(){
	echo "### System Information ###"
	echo "Hostname: $(hostname)"
	echo "Kernel Version: $(uname -r)"
	echo "CPU Information:"
	cat /proc/cpuinfo | grep "model name" | head -n 1
	echo "Memory Information:"
	free -h
	echo "Disk Storage:"
	df -h
	echo "---------------------------------------------------"
}

# Function to monitor CPU usage
monitor_cpu_usage() {
	echo "### CPU Usage ###"
	if command_exists "mpstat"; then
		mpstat 1 1
	else
	handle_errors"mpstat command not found. Install sysstat package"
	fi
	echo "-------------------------------------------"
}

#Function to track memory usage
track_memory_usage(){
	echo "### Memory Usage ###"
	free -h
	echo "-------------------------------------------"
}

#Function to check disk usage
check_disk_usage() {
	echo "### Disk Usage ###"
	df -h
	echo "--------------------------------------------"
}

#Fuction to monitor processes
monitor_process() {
	echo "### Top Processes ###"
	echo "Top CPU-Consuming processes:"
	ps aux --sort=-%cpu | head -n 11
	echo "Top Memory-Consuming Processes:"
	ps aux --sort=-%mem | head -n 11
	echo "----------------------------------------------"
}

#Generate report function
generate_report() {
	echo "### System Report ###"
	gather_system_info
	monitor_cpu_usage
	track_memory_usage
	check_disk_usage
	monitor_process
}

#Main function
main() {
	generate_report
}

main
