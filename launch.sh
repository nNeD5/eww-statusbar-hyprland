#!/bin/sh

WORKDIR=$(dirname "$0")
EWW="eww -c $WORKDIR"

${EWW} open-many bar bar1
