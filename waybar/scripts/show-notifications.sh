#!/bin/bash
# Script para mostrar todas las notificaciones en un panel con wofi

# Obtener todas las notificaciones
notifications=$(makoctl list 2>/dev/null)

if [ -z "$notifications" ]; then
    wofi --dmenu --prompt "No hay notificaciones" --location top-right <<< ""
    exit 0
fi

# Contar notificaciones
count=$(echo "$notifications" | grep -c "^Notification" || echo "0")

if [ "$count" -eq 0 ]; then
    wofi --dmenu --prompt "No hay notificaciones" --location top-right <<< ""
    exit 0
fi

# Formatear notificaciones: ID | App | Summary
formatted=$(echo "$notifications" | awk '
    BEGIN { 
        id = ""
        app = ""
        summary = ""
    }
    /^Notification/ {
        # Guardar notificación anterior si existe
        if (id != "") {
            printf "%s | %s | %s\n", id, app, summary
        }
        # Extraer nueva notificación
        if (match($0, /Notification ([0-9]+): (.+)/, arr)) {
            id = arr[1]
            summary = arr[2]
            app = "Unknown"
        }
    }
    /App name:/ {
        if (match($0, /App name: (.+)/, arr)) {
            app = arr[1]
        }
    }
    END {
        # Imprimir última notificación
        if (id != "") {
            printf "%s | %s | %s\n", id, app, summary
        }
    }
')

# Mostrar en wofi con scroll y estilo Gruvbox
# Posición desde arriba a la derecha (como si saliera de waybar)
echo "$formatted" | wofi --dmenu \
    --width 600 \
    --height 400 \
    --prompt "󰂚 Notificaciones ($count) - ↑↓ para scrollear" \
    --location top-right \
    --anchor top-right \
    --xoffset -10 \
    --yoffset 45 \
    --lines 12 \
    --insensitive \
    --style ~/.config/wofi/style.css
