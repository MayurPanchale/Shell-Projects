# Shell-Projects
## Aws_resouce_list

This shell script takes two user inputs, `region` and `service_name`, and outputs a list of active resources belonging to the specified AWS service in the specified region. It uses the AWS CLI to fetch and filter resources, and displays their IDs, names, and types.
======================================================
# disk_utilization
It compares the disk usage percentage against a threshold (80%):
If usage is over 80%, it warns the user to consider expanding the disk or deleting files.
If usage is 80% or less, it confirms that there is enough space available.