#!/bin/sh

# order of display:
# ncsopt
# spotify
# chromium
# vlc

if [ "$(playerctl status --player=ncspot 2> /dev/null)" = "Playing" ]; then
    artist=$(playerctl metadata artist --player=ncspot)
    title=$(playerctl metadata title --player=ncspot)
    echo "$artist - $title" | fribidi /dev/stdin
elif [ "$(playerctl status --player=spotify 2> /dev/null)" = "Playing" ]; then
    artist=$(playerctl metadata artist --player=spotify)
    title=$(playerctl metadata title --player=spotify)
    echo "$artist - $title" | fribidi /dev/stdin
elif [ "$(playerctl status --player=chromium 2> /dev/null)" = "Playing" ]; then
    artist=$(playerctl metadata artist --player=chromium)
    if [[ $artist = "" ]]; then
        artist="UNKOWN ARTIST"
    fi
    title=$(playerctl metadata title --player=chromium)
    echo "$artist - $title" | fribidi /dev/stdin
else
    echo ""
fi
