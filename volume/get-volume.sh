#!/bin/sh


off_icon="󰖁 "
low_icon="󰕿 "
mid_icon="󰖀 "
high_icon="󰕾 "

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%1.0f\n", $2*100}')


[ $volume -eq 0 ]  && echo "$off_icon"
[ $volume -gt 0 ]  && [ $volume -lt 35 ] && echo "$low_icon$volume%"
[ $volume -gt 34 ] && [ $volume -lt 68 ] && echo "$mid_icon$volume%"
[ $volume -gt 67 ] && echo "$high_icon$volume%"

echo "" # NOTE: figure out wtf
