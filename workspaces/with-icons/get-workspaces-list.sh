#!/bin/sh


declare -A name_icons

while read line
do
    name_icons["${line%=*}"]=${line#*=}
done < ./workspaces/config
spaces (){
    name_list=$(hyprctl workspaces | grep "ID" | cut -d" " -f4 | sort)
    for name in $name_list
    do
        name=$(echo $name | tr -d "(" | tr -d ")")
        if [ ${name_icons[$name]} ]
        then
            echo -n "${name_icons[$name]}"
        else
            echo -n "$(hyprctl workspaces | grep "ID * $name" | cut -d" " -f3)"
        fi
    done
    echo ""
}

spaces
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
while read _
do
    spaces
done
