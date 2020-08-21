# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
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
alias rtv "tuir"
alias vlc "i3-swallow vlc"
alias xclip "xclip -selection clipboard"
