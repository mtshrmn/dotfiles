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

set -x VISUAL "nvim"
set -x EDITOR "nvim"
set -x TUIR_EDITOR "nvim"
source .profile

alias vim "nvim"
alias ls "lsd"
alias cat "bat -p --paging=never"
alias mv "mv -iv"
alias rtv "bicon \"\" ttrv --enable-media"
alias cp "cp -riv"
alias mkdir "mkdir -vp"
#alias vlc "i3-swallow vlc"
alias zaread "i3-swallow zaread"
alias zathura "i3-swallow zathura"
alias feh "i3-swallow feh"
alias xclip "xclip -selection clipboard"
alias webcam "i3-swallow mpv --no-cache --untimed --no-demuxer-thread --video-sync=audio --vd-lavc-threads=1 --vf=hflip /dev/video0"

function docs
     find documents/ -type f | fzf | xargs -r i3-swallow xdg-open 2> /dev/null
end

alias simplehttpserver "browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"

# Setup extract alias
function x --description "General extractor"
  if [ -f $1 ]
    switch $1
      case "*.tar.bz2"   tar xjf $1 ;;
      case "*.tar.gz"    tar xzf $1 ;;
      case "*.bz2"       bunzip2 $1 ;;
      case "*.rar"       rar x $1 ;;
      case "*.gz"        gunzip $1 ;;
      case "*.tar"       tar xvf $1 ;;
      case "*.tbz2"      tar xjf $1 ;;
      case "*.tgz"       tar xzf $1 ;;
      case "*.zip"       unzip $1 ;;
      case "*.Z"         uncompress $1 ;;
      case "*.7z"        7za x $1 ;;
      case "*.xz"        xz -d $1 ;;
      case "*"           echo "'$1' cannot be extracted via extract()" ;;
    end
  else
    echo "'$1' is not a valid file"
  end
end
