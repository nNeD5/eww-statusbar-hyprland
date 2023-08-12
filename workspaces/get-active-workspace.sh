#!/bin/sh

hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id'

socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
stdbuf -oL awk -F '>>|,' -e '/^workspace>>/ {print $2}'
