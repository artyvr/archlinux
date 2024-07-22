#!/usr/bin/env bash

sleep 60

list=`pacman -S -u -p --print-format "%n %v"`
if [ "$list" == "" ]; then
    break
else
    count=`echo "$list" | wc -l`
    #notify-send -u normal -w -h string:bgcolor:#383C4A -h string:fgcolor:#9a9996 -h string:frcolor:#383C4A "Найдены обновления, всего $count шт. (win+u)" "$list"
    dunstify -t 1200000 "Найдены обновления, всего $count шт. (win+u)" "$list"
fi
