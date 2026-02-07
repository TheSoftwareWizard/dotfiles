#!/bin/bash
# Cava raw output to Unicode bars for Waybar

bar="▁▂▃▄▅▆▇█"
dict="s/;//g;"
for i in $(seq 0 7); do
    dict="${dict}s/$i/${bar:$i:1}/g;"
done
cava -p ~/.config/cava/config 2>/dev/null | while read -r line; do
    echo "$line" | sed "$dict"
done
