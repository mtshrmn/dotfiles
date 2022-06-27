#!/bin/sh

# order of display:
# ncsopt
# spotify
# qutebrowser
# vlc

mformat() {
    title=$(playerctl metadata title --player=$1)
    artist=$(playerctl metadata artist --player=$1)
    if [ "$artist" = "" ]; then
        echo "$title" | fribidi /dev/stdin
    else
        echo "$artist — $title" | fribidi /dev/stdin
    fi
}

play_order="ncspot spotify qutebrowser"

for player in $play_order; do
    if [ "$(playerctl status --player=$player 2> /dev/null)" = "Playing" ]; then
        mformat $player
        exit
    fi
done
echo ""
