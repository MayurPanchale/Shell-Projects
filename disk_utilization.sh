#!/bin/bash

######################################################################
# This Script checks the disk usage in a Linux system
# Author: Mayur Panchale / DevOps team
# Version: v1.0.0
######################################################################

echo "Checking disk usage in Linux system"

# command to get the disk usage
disk_size=$(df -h | grep "/dev/root" | awk '{print $5}' | cut -d '%' -f1)

echo "$disk_size% of disk is filled"

# Check if disk size is greater than 80%
if [ "$disk_size" -gt 80 ]; then
    echo "Disk is utilized more than 80%. Please expand disk or delete files soon."
else
    echo "Enough disk space available."
fi
