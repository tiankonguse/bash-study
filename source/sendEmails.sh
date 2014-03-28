#########################################################################
# File Name: sendEmails.sh
# Author: tiankonguse
# mail: i@tiankonguse.com
# Created Time: Tue 25 Feb 2014 11:01:10 PM CST
#########################################################################
#!/bin/bash

# crontab -e
# 0 2 * * * filepath

# Check hard drive space

echo "Hard drive space:" > /home/tiankonguse/log/email.txt

df -h >> /home/tiankonguse/log/email.txt

# List the users that are logged in

echo "Users currently logged in:" >> /home/tiankonguse/log/email.txt

who >> /home/tiankonguse/log/email.txt

# List currently running processes

echo "Running processes:" >> /home/tiankonguse/log/email.txt

ps -e >> /home/tiankonguse/log/email.txt

# Send the email

cat /home/tiankonguse/log/email.txt | mail -s "Daily server information" tiankonguse@gmail.com

# Delete the file we created

rm /home/tiankonguse/log/email.txt


