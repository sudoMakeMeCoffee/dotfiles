#!/bin/bash

# Check for required commands
for cmd in xsetroot pamixer upower nmcli awk top date; do
    if ! command -v $cmd &>/dev/null; then
        echo "Command $cmd not found. Please install it."
        exit 1
    fi
done

# Set your Wi-Fi interface here
WIFI_IF="wlan0"

while true; do
    # ---- Time ----
    TIME=$(date +"%H:%M")

    # ---- Battery ----
    BAT_INFO=$(upower -i /org/freedesktop/UPower/devices/battery_macsmc_battery 2>/dev/null)
    if [ -n "$BAT_INFO" ]; then
        BAT_PERCENT=$(echo "$BAT_INFO" | awk '/percentage/ {print $2}')
        BAT_STATE=$(echo "$BAT_INFO" | awk '/state/ {print $2}')

        # Customize display based on state
        if [ "$BAT_STATE" = "charging" ]; then
            BAT="$BAT_PERCENT (its in daddy)"
        else
            BAT="$BAT_PERCENT"
        fi
    else
        BAT="N/A"
    fi

    # ---- Volume ----
    if command -v pamixer &>/dev/null; then
        VOL=$(pamixer --get-volume)
        MUTE=$(pamixer --get-mute)
        if [ "$MUTE" = "true" ]; then
            VOL="Muted"
        else
            VOL="${VOL}%"
        fi
    else
        VOL="N/A"
    fi

    # ---- CPU usage ----
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}')

    # ---- Wi-Fi ----
    if nmcli device status | grep -q "$WIFI_IF"; then
        WIFI_SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)
        if [ -z "$WIFI_SSID" ]; then
            WIFI_SSID="Disconnected"
        fi
    else
        WIFI_SSID="N/A"
    fi

    # ---- Combine into status string ----
    STATUS_STR="  $TIME |  $BAT | $VOL | BrainFuckOS"


    # ---- Update DWM status bar ----
    xsetroot -name "$STATUS_STR"

    sleep 1
done
