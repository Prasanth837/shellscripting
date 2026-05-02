#!/bin/bash

validate(){
if [ $1 -ne 0 ]; then
    echo "$2 is failure"
    exit 1
    else
    echo "$2 is successfull"     
}

dnf install nodejs -y
validate() $! "Installation of Nodejs"

dnf install mysql
validate() $! "Installation of mysql"

dnf install nginx
validate() $! "Installation of nginx"

