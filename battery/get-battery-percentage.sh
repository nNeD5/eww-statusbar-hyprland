#!/bin/sh

# 󱊡 󱊢 󱊣

low_icon="󱊡 "
mid_icon="󱊢 "
high_icon="󱊣 "

capacity=$(</sys/class/power_supply/BAT0/capacity)

[ $capacity -lt 34 ] && echo "$low_icon$capacity%"
[ $capacity -gt 34 ] && [ $capacity -lt 67 ] && echo "$mid_icon$capacity%"
[ $capacity -gt 67 ] && echo "$high_icon$capacity%"

exit 0
