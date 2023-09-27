date=$(date +%d-%m-%Y-%H_%M)
cd ~/shell/shell.exe/Job08
grep -c "login session" /var/log/syslog > "number_connection-$date.txt"
tar -cvf "number_connection-$date.tar" "number_connection-$date.txt"
mv "number_connection-$date.tar" ~/shell/shell.exe/Job08/backup
