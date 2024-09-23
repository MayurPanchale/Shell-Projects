# Shell Projects

## AWS Resource List

This shell script takes two user inputs, `region` and `service_name`, and outputs a list of active resources belonging to the specified AWS service in the specified region. It uses the AWS CLI to fetch and filter resources, displaying their IDs, names, and types.

---

## Disk Utilization

This script checks the disk usage on a Linux system. It compares the disk usage percentage against a threshold of 80%:

- If usage exceeds 80%, it warns the user to consider expanding the disk or deleting files.
- If usage is 80% or less, it confirms that there is enough space available.

---

### Getting Started

To run these scripts, ensure you have the necessary permissions and tools installed:

1. **AWS CLI**: For the AWS Resource List script, make sure you have the AWS CLI configured with the appropriate access.
2. **Bash Environment**: Both scripts should be run in a Bash environment.

### Usage

1. **AWS Resource List**:
   ```bash
   ./aws_resource_list.sh
---
## Alert-Disk-utilization
_Linux shell script to send an alert email if disk usage exceeds_
+ First, find disk space usage using the df command.
+ Then filter out filesystem and find out the percentage of space using the grep command
+ Write a shell script to watch the disk space and send an email.

*Prerequisite*
By default, mail command may not be installed on your system. Hence, use the apk command on Alpine Linux, dnf command/yum command on RHEL & co, apt command/apt-get command on Debian, Ubuntu & co, zypper command on SUSE/OpenSUSE, pacman command on Arch Linux to install the mail.



### Step #1: Get Disk Space
- Open the terminal application and type the `df` command (no need to use the `du` command) to check free disk space on your Linux or Unix server. For example:

```bash
df -H

```
The -H option shows sizes in powers of 1000 as follows:

```bash
Copy code
Filesystem             Size   Used  Avail Use% Mounted on
/dev/hdb1               20G    14G   5.5G  71% /
tmpfs                  394M   4.1k   394M   1% /dev/shm
/dev/hdb5               29G    27G   654M  98% /nas/www
```
### Step #2: Filter Filesystems and Find Usage Percentage
We don’t want unwanted filesystems, such as NFS mounted, CD/DVD ROM, or loopback devices. To filter out the results, use the grep command as follows:

```bash
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }'
```
### Step #3: Write a shell script
The above Linux command displays fields 5 and 1 of the df command. Now all you need to do is write a script to see if the percentage of space is >= 80%. In other words, the following shell script will send an alert email alert if disk usage exceeds 80%.

```bash
#!/bin/bash

######################################################################
# Monitor Linux disk space and send an email alert to $ADMIN
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
```
### Here is how to install the mail command on a Debian/Ubuntu Linux using the apt-get command or apt command:
```bash
$ sudo apt install mailutils
```
Verify the Installation: 
```bash
$ mail --version
```
### Running the Script
Save the script as alert-disk-utilization.sh
Make the script executable:
bash
Copy code
chmod +x alert-disk-utilization.sh
Run the script:
bash
```
./disk_utilization.sh
```