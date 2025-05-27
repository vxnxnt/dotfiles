### PROMPT ###
PS1=' %F{#FFFF00}[%f %B%n@%m%b %(0?.%F{green}%?%f.%(130?.%F{green}%?%f.%F{red}%?%f )) %F{#7749BE}%~/%f %F{#FFFF00} ❱%f '

### PROMPT FOR ELEVATED PRIVS FOR NVIM ###
nvim(){
        for f in $@; do
                if ([ -e $f ] && ! [ -w $f ]) || (! [ -e $f ] && ! [ -w $(dirname $f) ] ); then
                        /usr/bin/rdo /usr/bin/nvim $@
                        return $?
                fi
        done
        /usr/bin/nvim $@
}

################
# AUTOSTART
################

export EDITOR=/usr/bin/nvim
export PYTHONDONTWRITEBYTECODE=1
neofetch

################
# Zsh alias
################

alias ls='eza --icons --color=always --no-permissions --no-user --no-time -s=extension -g -r -l -h'
alias clock='tty-clock -s -t -c -C 3'
alias qr='qrencode -t ansiutf8'
alias cat='bat -p -P'
alias zrsync='rsync --append-verify -vhP'
alias arsync='rsync --append-verify -avhP'
alias patchie='paru -Syu'
compress(){
        magick $1 -resize 1000x1000 $1.resized
}

############################
# History Configuration
############################

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed


#############
# Plugins
#############

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080,bg=bold,underline"
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
