#!/usr/bin/env bash

upower -i $(upower -e | grep BAT) \
| awk -F: '/percentage/ {
    gsub(/[%[:space:]]/, "", $2);
    val=$2;
    printf("%d\n", (val+0.5))
    exit
  }'
