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
