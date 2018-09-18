#!/bin/bash
#If an application (process) is not running for any reason, this script would monitor the process and will restart the application.
#To do so automatically, we can add this script in cron job for particular interval.

#Process name created by the application start script.
process_name="app.py"

#Checking the process running or not.
command=`ps -ef | grep -i $process_name | grep -v grep`

if [ $? -eq 0 ]
then
    echo  -e "`date` - Application $process_name is running"
else
    echo -e "`date` - Application $process_name is not running, hence starting it"

    python /root/devops-challenge/app.py & > /dev/null

    if [ $? -eq 0 ]
    then
        echo -e "Started the Application $process_name, It's running"
    fi
fi
