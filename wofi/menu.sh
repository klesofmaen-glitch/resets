#!/bin/bash

case "$1" in
    "power")
        echo -e "Выключить\nПерезагрузить\nСпящий режим" | wofi --dmenu
        ;;
    "wifi")
        echo -e "Включить Wi-Fi\nВыключить Wi-Fi\nСканировать сети" | wofi --dmenu
        ;;
    *)
        echo -e "power\nwifi" | wofi --dmenu
        ;;
esac
