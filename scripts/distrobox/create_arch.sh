#!/usr/bin/env bash

FLAKE_PATH="$(cd $(dirname "$0")/../../ && echo $(pwd))"
distrobox create --name arch --image archlinux:latest --home $FLAKE_PATH/distrobox/arch
distrobox enter arch -- "sudo pacman -S --noconfirm --needed git base-devel"
distrobox enter arch -- "git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
