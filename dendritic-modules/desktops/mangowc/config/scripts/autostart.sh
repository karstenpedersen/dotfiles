#!/bin/sh

# Background
swaybg -i ~/dotfiles/assets/nix-wallpaper.png >/dev/null 2>&1 &

# Keep clipboard content after app closes
wl-clip-persist --clipboard regular --reconnect-tries 0 &

# Watch clipboard and store history
wl-paste --type text --watch cliphist store &

# Waybar
waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/styles.css >/dev/null 2>&1 &
