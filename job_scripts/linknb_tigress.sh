#/bin/bash

NODENAME=localhost
PORT=9997

# Link a notebook running on tiger to current machine
# assumes that 'tiger' is defined in the ssh config file
ssh -N -f -L $NODENAME:$PORT:$NODENAME:$PORT tigress
open --new -a /Applications/Google\ Chrome.app --args "http://localhost:$PORT"
