#!/bin/bash
# ┌─[ CAVA ]───────────────────────────────────┐

STYLE="${1:-default}"

case "$STYLE" in
    thin)
        bar="▏▎▍▌▋▊▉█"
        dict="s/;//g;"
        for i in $(seq 0 7); do dict="${dict}s/$i/${bar:$i:1}/g;"; done
        ;;
    minimal)
        bar="░▒▓█"
        dict="s/0/A/g;s/1/A/g;s/2/B/g;s/3/B/g;s/4/C/g;s/5/C/g;s/6/D/g;s/7/D/g;"
        dict="${dict}s/A/░/g;s/B/▒/g;s/C/▓/g;s/D/█/g;s/;//g"
        ;;
    dots)
        bar="·∙◦●"
        dict="s/0/A/g;s/1/A/g;s/2/B/g;s/3/B/g;s/4/C/g;s/5/C/g;s/6/D/g;s/7/D/g;"
        dict="${dict}s/A/·/g;s/B/∙/g;s/C/◦/g;s/D/●/g;s/;//g"
        ;;
    block)
        dict="s/[0123]/ /g;s/[4567]/█/g;s/;//g"
        ;;
    braille)
        bar="⣀⣄⣤⣦⣶⣿"
        dict="s/7/5/g;s/6/5/g;"
        for i in $(seq 0 5); do dict="${dict}s/$i/${bar:$i:1}/g;"; done
        dict="${dict}s/;//g"
        ;;
    *)
        bar="▁▂▃▄▅▆▇█"
        dict="s/;//g;"
        for i in $(seq 0 7); do dict="${dict}s/$i/${bar:$i:1}/g;"; done
        ;;
esac

cava -p ~/.config/cava/config 2>/dev/null | while read -r line; do
    echo "$line" | sed "$dict"
done
