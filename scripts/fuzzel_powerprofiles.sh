#!/usr/bin/env bash

SELECTION="$(bash $(dirname "$0")/list_power_profiles.sh | fuzzel --dmenu -p "Select power profile:")"

powerprofilesctl set $SELECTION
