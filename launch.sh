#!/bin/sh

WORKDIR=$(pwd)
EWW="eww -c $WORKDIR"

# Open widgets
run_eww() {
    ${EWW} close-all
    ${EWW} --force-wayland --restart open-many bar bar1
}
run_eww
