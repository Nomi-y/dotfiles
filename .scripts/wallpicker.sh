#!/usr/bin/env bash

DIR="$HOME/.wallpapers"
CACHEDIR="$HOME/.local/wallpaper-cache/"

mkdir -p "$CACHEDIR"

IMAGE=$(nsxiv -abrto -A 15 "$DIR")

if [ -z "$IMAGE" ]; then
    exit
fi

rm -f "$CACHEDIR"/*

ln -sf "$IMAGE" "$CACHEDIR/$(basename "$IMAGE")"

wpaperctl set "$IMAGE"
