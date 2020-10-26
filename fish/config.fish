# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# the sudo !! of bash
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

set SPACEFISH_PROMPT_ADD_NEWLINE false
set SPACEFISH_USER_SHOW always
set SPACEFISH_DIR_PERFIX ""
set SPACEFISH_HOST_SHOW_FULL true

set -x VISUAL "vim"
set -x EDITOR "vim"
set -x TUIR_EDITOR "vim"
source .profile

alias ls "lsd"
alias cat "bat -p --paging=never"
alias rtv 'tuir'
alias vlc "i3-swallow vlc"
alias zathura "i3-swallow zathura"
alias xclip "xclip -selection clipboard"
alias rtv "tuir"
alias screen-record "ffmpeg -framerate 30 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i default"
alias region-record "ffcast -s ffmpeg -f x11grab -s %s -i %D+%c"
alias simplehttpserver "browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"

function horrible-downloader --description "horrible-downloader wrapper to delete log on successful job"
    /home/suerflowz/.local/bin/horrible-downloader $argv
    if test $status -eq 0
        rm horribledownloader.log
    end
end

