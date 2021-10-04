# ----------------------------------------------------------------------
# ----------------------------- VARIABLES ------------------------------
# ----------------------------------------------------------------------

PROMPT_AT=@
r='\[\e[31m\]' # red
g='\[\e[32m\]' # green
y='\[\e[33m\]' # yellow
b='\[\e[34m\]' # blue
p='\[\e[35m\]' # purple
a='\[\e[36m\]' # aqua
w='\[\e[37m\]' # white
x='\[\e[0m\]'  # reset
z='\[\e[30m\]' # black



# ----------------------------------------------------------------------
# ----------------------------- FUNCTIONS ------------------------------
# ----------------------------------------------------------------------

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

# get the current virtual environment, if it exists
venv_name(){
    local VENV
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        VENV="${VIRTUAL_ENV##*/}" && echo "($VENV) "
    fi

}



# ----------------------------------------------------------------------
# ------------------------------ ALIASES -------------------------------
# ----------------------------------------------------------------------

alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ls='ls -F --color'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'



# ----------------------------------------------------------------------
# ------------------------------- PROMPT -------------------------------
# ----------------------------------------------------------------------

# disable the standard prompt for virtual environment
VIRTUAL_ENV_DISABLE_PROMPT=1;

VENV="$r\$(venv_name)"                                            # (venv_name)
USER="$g\u$z$PROMPT_AT"                                           # username@
HOST="$a\h$z:"                                                    # hostname:
DIR="$b\W"                                                        # directory
BRANCH="$z\$(git_branch -l)$p\$(git_branch)$z\$(git_branch -r)$x" #(git_branch)

export PS1="$VENV$USER$HOST$DIR$BRANCH$ "
PROMPT_COMMAND='echo -ne "\033]0;$(pwd)\007"'
