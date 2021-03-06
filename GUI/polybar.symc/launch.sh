#!/usr/bin/env bash

# Terminate already running bar instances
pidof polybar && killall polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar top -c ~/.config/polybar/config &

echo "Bars launched..."
