#!/bin/bash
# Script para mostrar número de notificaciones en Mako

# Contar notificaciones usando makoctl list
count=$(makoctl list 2>/dev/null | grep -c "^Notification" || echo "0")

# Si hay notificaciones, mostrar el número
if [ "$count" -gt 0 ]; then
    echo "󰂚 $count"
else
    echo "󰂚"
fi
