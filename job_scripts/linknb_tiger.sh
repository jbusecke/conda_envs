#/bin/bash

NODENAME=$1
PORT=9998

# Link a notebook running on tiger to current machine
# assumes that 'tiger' is defined in the ssh config file
ssh -N -f -L $PORT:$NODENAME:$PORT tiger
open --new -a /Applications/Google\ Chrome.app --args "http://localhost:$PORT"
