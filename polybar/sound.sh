#!/bin/sh
# if default sink is game t=1 else t=0
t=$(pactl list short sinks | grep -Pc '^(?=.*RUNNING)(?=.*game)')

toggle() {
    t=$(((t + 1) % 2))
    if [ $t -eq 0 ]; then
        export PA_OUTPUT="monitor"
        output="hdmi"
    else
        export PA_OUTPUT="headphones"
        output="game"
    fi

    # get sink index and set it to default
    sink=$(pactl list short sinks | grep "$output" | awk '{print $1;}')
    pactl set-default-sink "$sink"
    # move sink inputs to their respective sinks
    python ~/.config/polybar/sound.py
}

trap "toggle" USR1

# handle polybar icon output
while true; do
    if [ $t -eq 0 ]; then
        echo ""
    else
        echo ""
    fi
    sleep 1 &
    wait
done

