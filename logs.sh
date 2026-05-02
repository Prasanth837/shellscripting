#!/bin/bash

LOG_FOLDER="/var/log/shellscript"
LOG_FILE="/var/log/shellscript/$0.log"

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "User should be root install packages" | tee -a $LOG_FILE
    exit 1
    else
    echo "User has root privileges" | tee -a $LOG_FILE
fi

mkdir -p $LOG_FOLDER

validate(){
if [ $1 -ne 0 ]; then
    echo "$2 is failure" | tee -a $LOG_FILE
    exit 1
    else
    echo "$2 is successfull" | tee -a $LOG_FILE
fi 
}

dnf install nodejs -y &>> $LOG_FILE
validate $? "Installation of Nodejs"

dnf install mysql -y &>> $LOG_FILE
validate $? "Installation of mysql"

dnf install nginx -y &>> $LOG_FILE
validate $? "Installation of nginx"
