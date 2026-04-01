#!/bin/sh
out() { printf '{"text":"%s","tooltip":"%s"}\n' "$1" "$2"; }
if ! command -v ip >/dev/null 2>&1; then
    out "" ""
    exit 0
fi
if ip link show 2>/dev/null | grep -q 'tun[0-9]*:'; then
    out "VPN" "VPN connected"
else
    out "" ""
fi
