#!/bin/sh

# 󱐋 󰉃
charge_icon="󱐋"
no_charge_icon=" "

status_on_start=$(</sys/class/power_supply/AC/online)
[ $status_on_start -eq 0 ] && echo $no_charge_icon
[ $status_on_start -eq 1 ] && echo $charge_icon

acpi_listen | stdbuf -oL awk -F " |," -e '/^ac_adapter / {printf "%1.0f\n", $4}' |
while read -r status
do
    [ $status -eq 1 ] && echo $charge_icon
    [ $status -eq 0 ] && echo $no_charge_icon
done
