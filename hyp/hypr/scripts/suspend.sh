#!/bin/bash
swayidle -w \
' swaylock ' \
' hyprctl dispatch dpms off' \
'systemctl suspend' \
resume ' hyprctl dispatch dpms on' \
before-sleep 'swaylock'