#! /bin/bash
#This script is used to create a backup of folders to target location with user input

echo "Enter the full path name of the folder you want to backup:\c"dd
clear
backupfiles=backup.`date +%F`.`date +%k.%M`.tgz
echo "Enter the full path name of the folder you want to backup: \c"
read backupfolders
if [ ! -e $backupfolders ]
then
        echo "\n\nYou have typed incorrect path, So exiting from the backup script........\n";
        sleep 2;
        exit;
fi

echo "\nWhere do you want to keep the backup files.Enter the Full path: \c"
read backupdir

if [ ! -e $backupdir ]
then
        echo "Backup Folder doesn't exist. Creating the Folder......";
        sleep 2;
        mkdir -p $backupdir;
        if [ $? = 0 ]
        then
                echo "Backup Folder $backupdir created successfully";
                sleep 2;
        else
                echo "\nError has occured, while creating the Backup folder.\n";
        fi
        sleep 2;
else
        limit=7
        count=`ls $backupdir/backup* | wc -l`
        echo "Counting your existing backup files in the $backupdir..";
        sleep 2;
        if [ $count -le $limit ]
        then
                echo "Total Backup Files\\t\t\t\t\t\t\t : $count";
                sleep 2;
        else
                echo "Total Backup Files\\t\t\t\t\t\t\t : $count";
                sleep 2;
        fi
fi
if [ $? = 0 ]
then
if [ $count -le $limit ]
        then
        clear;
        echo -e "Backup process started to take the backup \033[33m$backupfolders.\033[0m Please wait for a moment...";
        sleep 3;
        tar -czvf $backupdir/$backupfiles $backupfolders;
        echo -e "\n\n\033[32mBackup process is completed. Backup File is saved in \033[0m\033[33m$backupdir.\033[0m\n\n";
        else
        echo -e "\n\n\033[31mWhile creating Backup, issue has occurs. Backup file limit is maximum 7, But it exceeded the limit. So delete any other old backup files in your backup folder..\033[0m\n\n";
fi
else
        echo "Error";

fi
