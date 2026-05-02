#!/bin/bash

LOG_FOLDER="/var/log/shellscript"
LOG_FILE="/var/log/shellscript/$0.log"

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "User should be root install packages"
    exit 1
    else
    echo "User has root privileges"
fi

mkdir -p $LOG_FOLDER

validate(){
if [ $1 -ne 0 ]; then
    echo "$2 is failure"
    exit 1
    else
    echo "$2 is successfull"    
fi 
}

dnf install nodejs -y &>> $LOG_FILE
validate $? "Installation of Nodejs"

dnf install mysql &>> $LOG_FILE
validate $? "Installation of mysql"

dnf install nginx &>> $LOG_FILE
validate $? "Installation of nginx"
