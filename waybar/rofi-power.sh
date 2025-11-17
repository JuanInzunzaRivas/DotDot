#For rofi, opens a "power menu" on click.
#!/usr/bin/env bash

all=([SHUTDOWN] [REBOOT] [LOGOUT] [LOCK])

show=("${all[@]}")

declare -A actions
actions[SHUTDOWN]="poweroff"
actions[REBOOT]="reboot"
actions[LOGOUT]="hyprctl dispatch exit"
actions[LOCK]="hyprlock"

chosen=$(echo -e "[SHUTDOWN]\n[REBOOT]\n[LOGOUT]\n[LOCK]" | \
rofi -dmenu -no-custom -theme ~/.config/rofi/signalis-power.rasi)

selection="$chosen"

case "$selection" in
    "[SHUTDOWN]") ${actions[SHUTDOWN]} ;;
    "[REBOOT]") ${actions[REBOOT]} ;;
    "[LOGOUT]") ${actions[LOGOUT]} ;;
    "[LOCK]") ${actions[LOCK]} ;;
    *) exit 1 ;;
esac
