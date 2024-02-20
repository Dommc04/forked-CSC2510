#!/bin/bash

# I. Create a new branch
git checkout -b Lab06

# II. Make a new directory if it doesn't exist
mkdir -p system_info

# III. Set the file path
file_path="system_info/system_info.txt"

# IV. Gather system information and write to the file
echo "System information has been gathered. Here’s the summary:" > $file_path
echo "$(date +"%m/%d/%Y %H:%M:%S %Z")" >> $file_path
echo "Current user: $(whoami)" >> $file_path
echo "Current working directory: $(pwd)" >> $file_path
echo "System usage (top -bn1):" >> $file_path
top -bn1 | awk 'NR<=5' >> $file_path
echo "Disk usage (df -h):" >> $file_path
df -h >> $file_path

# V. Print contents to the terminal
cat $file_path

# VI. Create a new PR to merge Lab06 into main
git add .
git commit -m "Add sysinfo.sh script"
git push origin Lab06

# Create a pull request in GitHub (manually)

# Merge the PR in GitHub (manually)

# Merge main into dev (manually)

# Tag the merge commit
git checkout main
git merge Lab06
git tag L.06
git push origin main --tags
