#!/bin/bash
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

wpaperd &

waybar &

dunst &
