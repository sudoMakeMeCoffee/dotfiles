#!/bin/bash

# Path to your PNG icon
ICON="$HOME/Pictures/geturassoutofhere/brainfuck.png"
TMPBG="/tmp/lockscreen.png"
TMPICON="/tmp/lock_icon.png"

# Text to display
TEXT="BrainFckOS"
TEXT_COLOR="white"
TEXT_SIZE=35  # adjust as needed
TEXT_SPACING=10  # pixels below the icon

# Get screen resolution
RES=$(xdpyinfo | awk '/dimensions:/ {print $2}')
SCREEN_W=$(echo "$RES" | cut -d'x' -f1)
SCREEN_H=$(echo "$RES" | cut -d'x' -f2)

# Take a screenshot of the current screen
import -window root /tmp/screen.png

# Blur the screenshot
magick /tmp/screen.png -blur 0x6 "$TMPBG"

# Resize icon (15% of screen width) and save to temp file
ICON_W=$((SCREEN_W * 15 / 100))
magick "$ICON" -resize "${ICON_W}x" "$TMPICON"

# Get icon height after resize
ICON_H=$(magick identify -format "%h" "$TMPICON")

# Calculate text offset: icon height / 2 + spacing
TEXT_OFFSET=$((ICON_H / 2 + TEXT_SPACING))

# Overlay the icon centered
magick composite -gravity center "$TMPICON" "$TMPBG" "$TMPBG"

# Add text below the icon dynamically
magick "$TMPBG" -gravity center -fill "$TEXT_COLOR" -pointsize "$TEXT_SIZE" -annotate +0+"$TEXT_OFFSET" "$TEXT" "$TMPBG"

# Lock screen
i3lock -i "$TMPBG" --nofork --no-unlock-indicator

# Optional: clean up temp icon
rm "$TMPICON"
