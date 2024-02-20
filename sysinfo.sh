#!/bin/bash
echo "System information has been gathered. Here’s the summary:" > system_info.txt
echo "$(date +"%m/%d/%Y %H:%M:%S %Z")" >> system_info.txt
echo "Current user: $(whoami)" >> system_info.txt
echo "Current working directory: $(pwd)" >> system_info.txt
echo "System usage:" >> system_info.txt
top -b -n 1 | head -n 5 >> system_info.txt
echo "" >> system_info.txt
echo "Disk usage:" >> system_info.txt
df -h >> system_info.txt
cat system_info.txt
git add .
git commit -m "Add sysinfo.sh script"
git push origin Lab06
git checkout main
git merge Lab06
git tag L.06
git push origin main --tags
