#!/bin/bash
#This script is written by me (Selva) to ensure the particular application (process) is running all the time.
#If an application is not running for any reason, this script would monitor the process and will restart the application.
#To do so automatically, we can add this script in cron job for particular interval.

#Process name created by the application start script.
process_name="app.py"

status_log="/root/devops-challenge/logs"

#Checking the process running or not.
command=`ps -ef | grep -i $process_name | grep -v grep`

if [ $? -eq 0 ]
then
    echo  -e "`date` - Application $process_name is running" >> $status_log
else

    python /root/devops-challenge/app.py & > /dev/null

    if [ $? -eq 0 ]
    then
        echo -e "`date` - Application $process_name is not running, hence started now" >> $status_log
    fi
fi
