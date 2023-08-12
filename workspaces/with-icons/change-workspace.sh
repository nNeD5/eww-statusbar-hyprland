#!/bin/sh

# hyprctl dispatch workspace $1

[ ! $1 =~ '^[0-9]+$' ] && hyprctl dispatch workspace $1
[ $1 ] && hyprctl dispatch workspace name:$1
