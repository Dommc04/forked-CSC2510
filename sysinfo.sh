# making the lab06 branch and directory for the system information
git checkout -b Lab06
mkdir -p system_info
file_path="system_info/system_info.txt"

# the system information 
echo "System information has been gathered. Here’s the summary:" > "$file_path"
echo "$(date +"%m/%d/%Y %H:%M:%S %Z")" >> "$file_path"
echo "Current user: $(whoami)" >> "$file_path"
echo "Current working directory: $(pwd)" >> "$file_path"
echo "System usage (top -bn1):" >> "$file_path"
top -bn1 | head -n 5 >> "$file_path"
echo "Disk usage (df -h):" >> "$file_path"
df -h >> "$file_path"

# printing the contents
cat "$file_path"

# the github bits
git add .
git commit -m "Add sysinfo.sh script"
git push origin Lab06

#the final steps and the final merge tag - L06
git checkout main
git merge Lab06
git tag L.06
git push origin main --tags
