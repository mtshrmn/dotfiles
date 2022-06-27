#!/bin/sh
LOCK=/home/suerflowz/.local/etc/sound_fixer.lock
remove_lock() {
    rm -f "$LOCK"
}

another_instance() {
    echo "There's another instance running, exiting..."
    exit 1
}
lockfile -r 0 -l 3600 "$LOCK" || another_instance
trap remove_lock EXIT


while true; do
# wait for change in the clients
    watch -g "pactl list clients | grep Client | wc -l"
    t=$(pactl info| grep -Pc '^(?=.*Default Sink)(?=.*game)')
    if [ "$t" -eq 0 ]; then
        export PA_OUTPUT="monitor"
    else
        export PA_OUTPUT="headphones"
    fi
    python ~/scripts/polybar/sound.py
done
