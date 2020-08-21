#!/bin/sh

parse() {
  domain="org.mpris.MediaPlayer2"
  meta=$(dbus-send --print-reply --dest=${domain}.$1 \
    /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:${domain}.Player string:Metadata)

  # if you want to use spotpris2 as your mpris manager, use this device:
  # spotpris.device23a7cd55b65b1d7155f86020c3a50149cacbf1af
  # dont forger to launch spotpris2!

  #regex fml
  artist=$(echo "$meta" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1)
  album=$(echo "$meta" | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1)
  title=$(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1)
 
  if [ -z "$title" ]; then
    echo ""; exit
  fi

  #reverse str if it's in hebrew, cuz fuck rtl support
  if [ $(echo $title | grep -c [אבגדהוזחטיכלמנסעפצקרשת]) -eq 1 ]; then
    title=$(echo $title | rev)
  fi

  if [ $(echo $artist | grep -c [אבגדהוזחטיכלמנסעפצקרשת]) -eq 1 ]; then
    artist=$(echo $artist | rev)
  fi

  echo $artist - $title
}

main() {
    if  pgrep -x ncspot >/dev/null; then
       parse ncspot 
    else 
        if pgrep -x spotify >/dev/null; then
            parse spotify
        else
            echo ""; exit
        fi
    fi
    
    exit
}

main "$@"
