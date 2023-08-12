#!/bin/sh


spaces (){
    # ouput format: [1, 2, 3]
    echo -n "["
    hyprctl workspaces | grep "ID" | cut -d" " -f3 | sort -n | sed -z 's/\n/,/g;s/,$//'
    echo "]"
}

spaces
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
while read _
do
    spaces
done
