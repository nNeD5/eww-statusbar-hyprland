#!/bin/sh


# workspaces_list: [1,2,4]
get_icon (){
    [ "$id" == "(1)" ] && echo -n "󰙯  "
    [ "$id" == "(2)" ] && echo -n "  "
    [ "$id" == "(3)" ] && echo -n "3  "
    [ "$id" == "(4)" ] && echo -n "4  "
    [ "$id" == "(5)" ] && echo -n "5  "
}

tail --follow lists |
while read -r w
do
    for i in $(echo $w | tr -d "[" | tr -d "]" | sed "s/,/ /g")
    do
        id=$(hyprctl workspaces | grep "ID $i" | cut -d " " -f4)
        get_icon
    done
    echo ""
done
