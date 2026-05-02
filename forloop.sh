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

for package in $@ #We pass data as arguements while executing this script example nginx mysql etc.
do
    dnf list installed $package &>> $LOG_FILE
    if [$? -ne 0 ]; then
        echo "$package not installed, Installing now"
        dnf install $package -y &>> $LOG_FILE
        validate $? "$package installation"
    else
        echo "$package already installed, skipping it"
    fi
done
