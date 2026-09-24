#!/usr/bin/env bash

chosen=$(printf "Shutdown\nReboot\nLogout\nSwitch User\nSuspend" | rofi -dmenu -i -p "Power Menu" -theme-str 'window {width: 12em;} listview {lines: 5;}')

case "$chosen" in
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
    Logout) bspc quit ;;
    "Switch User") dm-tool switch-to-greeter ;;
    Suspend) systemctl suspend ;;
esac
