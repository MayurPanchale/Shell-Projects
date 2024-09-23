#!/bin/bash

######################################################################
# This Script checks the disk usage in a Linux system
# Author: Mayur Panchale / DevOps team
# Version: v1.0.0
######################################################################

ALERT=80 # alert level
ADMIN="mpanchale.kd@gmail.com" # dev/sysadmin email ID

# Check disk usage and filter out unnecessary filesystems
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read -r output; do
  echo "$output"
  usep=$(echo "$output" | awk '{ print $1 }' | cut -d'%' -f1)
  partition=$(echo "$output" | awk '{ print $2 }')

  # Check if usage percentage is greater than or equal to ALERT level
  if [ "$usep" -ge "$ALERT" ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as of $(date)" |
    mail -s "Alert: Almost out of disk space $usep%" "$ADMIN"
  fi
done
