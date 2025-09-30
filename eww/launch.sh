#!/bin/bash
# ~/.config/eww/launch.sh

# Используем полный путь к eww или проверяем доступность
EWW_CMD="eww"

# Проверяем, установлен ли eww в стандартных путях
if ! command -v eww &> /dev/null; then
    # Проверяем в cargo bin
    if [ -f "$HOME/.cargo/bin/eww" ]; then
        EWW_CMD="$HOME/.cargo/bin/eww"
        export PATH="$HOME/.cargo/bin:$PATH"
    else
        echo "Error: eww not found!"
        echo "Please install eww first: cargo install eww"
        exit 1
    fi
fi

# Убиваем предыдущие процессы eww
echo "Killing previous eww processes..."
$EWW_CMD kill > /dev/null 2>&1
sleep 1

# Перезапускаем демон
echo "Starting eww daemon..."
$EWW_CMD daemon > /dev/null 2>&1 &
sleep 2

# Проверяем конфиг
echo "Checking configuration..."
if ! $EWW_CMD check; then
    echo "Configuration error! Check eww.yuck syntax"
    exit 1
fi

# Запускаем бар
echo "Opening bar..."
$EWW_CMD open bar

if [ $? -eq 0 ]; then
    echo "✅ Eww bar launched successfully!"
else
    echo "❌ Failed to launch eww bar"
    echo "Check logs with: eww logs"
fi
