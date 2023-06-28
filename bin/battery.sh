#!/bin/bash
battery=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [ $battery -le 5 ]; then
  battery_icon=""
elif [[ $battery -le 25 ]]; then
  battery_icon=""
elif [[ $battery -le 50 ]]; then
  battery_icon=""
elif [[ $battery -le 75 ]]; then
  battery_icon=""
else
  battery_icon=""
fi

if [ $battery == "100" ] ; then
  notify-send "Battery: $status" "Battery Full! $battery% <span color='#EBBCBA'>$battery_icon</span>"
elif [ $status == "Charging" ] ; then
  notify-send "Battery: $status" "$battery% <span color='#9CCFD8'>$battery_icon</span>"
elif [[ $battery -lt 20 ]] ; then
  notify-send "Battery: $status" "Battery Low! $battery% <span color='#EB6F92'>$battery_icon</span>"
else
  notify-send "Battery: $status" "$battery% <span color='#E0DEF4'>$battery_icon</span>"
fi
