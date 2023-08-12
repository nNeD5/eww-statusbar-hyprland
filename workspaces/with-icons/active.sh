#!/bin/sh

declare -A name_icons

while read line
do
    name_icons["${line%=*}"]=${line#*=}
done < ./workspaces/config

# hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.name'

socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
stdbuf -oL awk -F '>>|,' -e '/^workspace>>/ {print $2}' |
while read -r name
do
    if [ ${name_icons[$name]} ]
    then
        echo -n "${name_icons[$name]}"
    else
        echo -n "$(hyprctl workspaces | grep "ID * $name" | cut -d" " -f3)"
    fi
    echo ""
done
