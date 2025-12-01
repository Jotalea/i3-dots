#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# dnyamic shell history like in zsh
shopt -s histappend
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
HISTCONTROL=ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=100000

# aliases
alias music="(cd /run/media/jotalea/JotaSD/audio/music/ && ./list.sh -p)"
alias ls="ls --color=auto"
#alias grep="grep --color=auto"
alias grep="rg --color=auto"
alias cat="bat"
alias ctrlc="xclip -i -selection clipboard"
alias ctrlv="xclip -o -selection clipboard"
alias pac="/run/media/jotalea/JotaSD/code/scripts/pac"

# variables
export sd="/run/media/jotalea/JotaSD/"

# powerline or primary prompt string
# starship preset catppuccin-powerline -o ~/.config/starship.toml
if [ "$TERM" = "linux" ] || [ -z "$DISPLAY" ]; then
    # TTY/unsupported terminal - use lambda symbol
    PS1='\w \$ '
else
    # Graphical terminal - try starship, fallback to custom prompt with lambda
    if command -v starship >/dev/null 2>&1; then
        eval "$(starship init bash)"
    else
        # Fallback prompt with colors and lambda symbol
        PS1='\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\] λ '
    fi
fi
