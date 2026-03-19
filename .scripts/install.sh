#!/bin/bash
set -e

if [ "$(basename "$PWD")" != "dotfiles" ]; then
    echo "Error: Must be run from dotfiles directory"
    exit 1
fi

sudo pacman -Syu --noconfirm \
    git \
    zsh \
    neovim \
    fzf \
    batcat \
    stow \
    hyprland \
    hyprlock \
    dunst \
    fuzzel \
    fastfetch \
    rust \
    wayland-egl \
    imlib2 \
    ttf-jetbrains-mono-nerd

git clone https://github.com/danyspin97/wpaperd
cd wpaperd
cargo build --release
sudo mv ./target/release/wpaperd /usr/bin
sudo mv ./target/release/wpaperctl /usr/bin
cd ..
rm -rf wpaperd

git clone https://github.com/nsxiv/nsxiv
cp ./.nomi/nsxiv-config.h ./nsxiv
cd nsxiv
sudo make install
cd ..
rm -rf nsxiv

stow -R . --ignore=.nomi -v
