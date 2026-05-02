LOG_FOLDER="/var/log/shellscript"
LOG_FILE="/var/log/shellscript/$0.log"
R="\e[31m"  #Red colour
G="\e[32m"  #Green Colour
B="\e[34m"  #Blue Colour
Y="\e[33m"  #Yellow Colour
N="\e[0m"   #Normal black colour

set -e
trap 'echo "There is an error in $LINENO, Commnad: $BASH_COMMAND"' ERR

#we should start code with any colour but if we want to end the line with normal colour then give "\e[0m" for normal colour

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo -e "$R User should be root install packages $N" | tee -a $LOG_FILE
    exit 1
    else
    echo -e "$G User has root privileges $N" | tee -a $LOG_FILE
fi

mkdir -p $LOG_FOLDER


for package in $@ #We pass data as arguements while executing this script example nginx mysql etc.
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        echo -e "$package not installed, $Y Installing now $N "
        dnf install $package -y &>> $LOG_FILE
        
    else
        echo -e "$package already installed, $B skipping it $N "
    fi
done
