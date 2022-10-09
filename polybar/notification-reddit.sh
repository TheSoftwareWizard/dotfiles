#!/bin/sh

URL="{"kind": "Listing", "data": {"after": null, "dist": 0, "modhash": null, "geo_filter": "", "children": [], "before": null}}"
USERAGENT="polybar-scripts/notification-reddit:v1.0 u/sir_basura"

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 0 ]; then
    echo " $notifications"
else
    echo " $notifications"
fi