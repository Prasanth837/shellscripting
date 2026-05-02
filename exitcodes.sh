#!/bin/bash/

User=$(id -u)

if [ $User -ne 0 ]; then
    echo "Used id has no root permissions"
    exit 1
fi

echo "Installing nginx service"
dnf install nginx -y

if [ $! -ne 0 ]; then
    echo "Installation of Nginx is unsuccessfull"
    exit 1
else
echo "Installation of Nginx is successfull"
fi