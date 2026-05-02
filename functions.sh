#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "User should be root install packages"
    exit 1
    else
    echo "User has root privileges"
fi

validate(){
if [ $1 -ne 0 ]; then
    echo "$2 is failure"
    exit 1
    else
    echo "$2 is successfull"    
fi 
}

dnf install nodejs -y
validate() $? "Installation of Nodejs"

dnf install mysql
validate() $? "Installation of mysql"

dnf install nginx
validate() $? "Installation of nginx"

