# ------------------------------ ALIASES -------------------------------

alias c='clear'
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias grep='grep --color=always'
alias ls='ls -F --color'
alias vi='vim'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'



# ------------------------------ COLORS --------------------------------

r='\[\e[31m\]' # red
g='\[\e[32m\]' # green
y='\[\e[33m\]' # yellow
b='\[\e[34m\]' # blue
p='\[\e[35m\]' # purple
a='\[\e[36m\]' # aqua
w='\[\e[37m\]' # white
x='\[\e[0m\]'  # reset
z='\[\e[30m\]' # black



# ----------------------- ENVIRONMENT VARIABLES ------------------------

export EDITOR=vi
export PUBLIC="$HOME/Public"
export REPOS="$PUBLIC/repos"
export GHREPOS="$REPOS/github.com/michaelarn0ld"
export SH_SCRIPTS="$GHREPOS/sh-scripts"
export BASH_SCRIPTS="$GHREPOS/bash-scripts"
export ZET_PATH="$GHREPOS/zet"
export ZETDIR="$GHREPOS/zettelkasten-public"
export ZET_SCRIPT_DIR="/home/michael/Public/repos/github.com/michaelarn0ld/zet"
export ZETDIR_PRIVATE="$GHREPOS/zettelkasten-private"
export GITHUB_URL="https://github.com/michaelarn0ld"



# ----------------------------- FUNCTIONS ------------------------------

# get the current git branch, if it exists
git_branch() {
    local BRANCH=$(git branch --show-current 2>/dev/null) 
    if [[ -n "$BRANCH" ]]; then
        if [[ "$1" == "-l" ]]; then
            echo "("
        elif [[ "$1" == "-r" ]]; then
            echo ")"
        else 
            echo "$BRANCH"
        fi
    fi
}

# set the path
path_append() {
    declare arg
    for arg in "$@"; do
        test -d "$arg" || continue
        [[ ":$PATH:" =~ ":$arg:" ]] || PATH="$PATH:$arg"
    done
    export PATH
}

# get the current virtual environment, if it exists
#venv_name(){
#    local VENV
#    if [[ -n "$VIRTUAL_ENV" ]]; then
#        # Strip out the path and just leave the env name
#        VENV="${VIRTUAL_ENV##*/}" && echo "($VENV) "
#    fi
#
#}



# ------------------------- HISTORY -------------------------- 
set -o vi



# --------------------------- PATH --------------------------- 

path_append \
    "$HOME/.local/bin" \
    "$BASH_SCRIPTS" \
    "$ZET_PATH" \
    "$SH_SCRIPTS" \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/local/games \
    /usr/bin \
    /usr/sbin \
    /bin \
    /sbin



# ------------------------------- PROMPT -------------------------------

VENV="$r\$(venv_name)"                           
NAME="$g\u$z"                         
HOST="$a\h$z"                                 
DIR="$b\W"                                    
BRANCH="$z\$(git_branch -l)$p\$(git_branch)$z\$(git_branch -r)$x" 

# disable the standard prompt for virtual environment
#VIRTUAL_ENV_DISABLE_PROMPT=1

#PS1="$VENV$NAME@$HOST:$DIR$BRANCH$ "
PS1="$NAME@$HOST:$DIR$BRANCH$ "
PROMPT_COMMAND='echo -ne "\033]0;$(pwd)\007"'
