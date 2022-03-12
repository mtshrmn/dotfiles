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
set SPACEFISH_PROMPT_ORDER time user dir host git package node ruby golang php rust haskell julia docker aws venv conda pyenv dotnet kubecontext exec_time line_sep vi_mode jobs exit_code char

set -x XDG_CONFIG_HOME "/home/suerflowz/.config/"
set -x XDG_DOCUMENTS_DIR "/home/suerflowz/documents/"
set -x XDG_DOWNLOAD_DIR "/home/suerflowz/downloads/"
set -x XDG_MUSIC_DIR "/home/suerflowz/music/"
set -x XDG_PICTURES_DIR "/home/suerflowz/pictures/"
set -x XDG_VIDEOS_DIR "/home/suerflowz/videos/"

set PATH /home/suerflowz/scripts/apps /home/suerflowz/.cargo/bin /home/suerflowz/.local/bin $PATH
set -x VISUAL "nvim"
set -x EDITOR "nvim"
set -x TUIR_EDITOR "nvim"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MCFLY_KEY_SCHEME "vim"
source ~/.profile

alias vim "nvim"
alias i3-swallow "swallow"
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
alias free_mem "sudo -- sh -c 'free && sync && echo 3 > /proc/sys/vm/drop_caches && free'"

function docs
     find documents/ -type f | fzf | xargs -r i3-swallow xdg-open 2> /dev/null
end

function conf
    find /home/suerflowz/.config/ \( \
    -path /home/suerflowz/.config/chromium -o \
    -path /home/suerflowz/.config/pipewire-media-session -o \
    -path /home/suerflowz/.config/pulse -o \
    -path /home/suerflowz/.config/Notion -o \
    -path /home/suerflowz/.config/obsidian -o \
    -path /home/suerflowz/.config/yarn -o \
    -path /home/suerflowz/.config/transmission-daemon -o \
    -path /home/suerflowz/.config/coc -o \
    -path /home/suerflowz/.config/.git -o \
    -path /home/suerflowz/.config/google-chrome -o \
    -path /home/suerflowz/.config/BetterDiscord -o \
    -path /home/suerflowz/.config/SideQuest -o \
    -path /home/suerflowz/.config/Postman -o \
    -path /home/suerflowz/.config/Min -o \
    -path /home/suerflowz/.config/spicetify -o \
    -path /home/suerflowz/.config/discord -o \
    -path /home/suerflowz/.config/balena-etcher-electron -o \
    -path /home/suerflowz/.config/libreoffice \
    \) -prune -false -o -type f | cut -d'/' -f5- | fzf --layout=reverse --history=/home/suerflowz/.cache/conf/fzf.history | awk '{print "/home/suerflowz/.config/"$1}' | xargs -r nvim
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

# git wrapper for various commands
function git --description "git wrapper"
    if test "$argv[1]" = "show"
        if string match -r "[a-f0-9]{7}\$" "$argv[2]" 
            /usr/bin/git show $argv[2..-1] | bat -l diff
        else
            set ext (echo "$argv[2]" | tr "." "\n" | tail -1)
            /usr/bin/git show $argv[2..-1] | bat -l "$ext"
        end
    else
        /usr/bin/git $argv[1..-1]
    end
end

mcfly init fish | source
set -gx MCFLY_FUZZY true
