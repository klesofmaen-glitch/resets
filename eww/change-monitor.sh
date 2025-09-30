#!/bin/bash
# ~/.config/eww/change-monitor.sh

eww update selected_monitor="$1"
eww reload
