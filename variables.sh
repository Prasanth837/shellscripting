#!/bin/bash

echo "All args passed to scripts: $@"
echo "Number of vars passed to script: $#"
echo "Script name: $0"
echo "Present working directory: $PWD"
echo "who is the user: $USER"
echo "Home directory of current user: $HOME"
echo "PID of this process: $$"
sleep 100 &
echo "PID of recently executed background process: $!"
echo "All args passed to script: $*"
