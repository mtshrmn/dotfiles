#!/bin/sh

# order of display:
# ncsopt
# spotify
# qutebrowser
# vlc

if [ "$(playerctl status --player=ncspot 2> /dev/null)" = "Playing" ]; then
    artist=$(playerctl metadata artist --player=ncspot)
    title=$(playerctl metadata title --player=ncspot)
    echo "$artist - $title" | fribidi /dev/stdin
elif [ "$(playerctl status --player=spotifyd 2> /dev/null)" = "Playing" ]; then
    artist=$(playerctl metadata artist --player=spotifyd)
    title=$(playerctl metadata title --player=spotifyd)
    echo "$artist - $title" | fribidi /dev/stdin
elif [ "$(playerctl status --player=spotify 2> /dev/null)" = "Playing" ]; then
    artist=$(playerctl metadata artist --player=spotify)
    title=$(playerctl metadata title --player=spotify)
    echo "$artist - $title" | fribidi /dev/stdin 
elif [ "$(playerctl status --player=qutebrowser 2> /dev/null)" = "Playing" ]; then
    title=$(playerctl metadata title --player=qutebrowser)
    artist=$(playerctl metadata artist --player=qutebrowser)
    if [[ $artist = "" ]]; then
        echo "$title" | fribidi /dev/stdin
    else
        echo "$artist - $title" | fribidi /dev/stdin
    fi

else
    echo ""
fi
