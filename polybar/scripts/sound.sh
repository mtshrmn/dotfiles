#!/bin/sh
# if default sink is game t=1 else t=0
t=$(pactl info| grep -Pc '^(?=.*Default Sink)(?=.*game)')

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
    python ~/scripts/polybar/sound.py
    sh ~/.config/polybar/scripts/sound_fixer.sh 1>/dev/null 2>/dev/null &
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

