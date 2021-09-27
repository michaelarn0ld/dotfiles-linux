# ----------------------------------------------------------------------
# ----------------------------- FUNCTIONS ------------------------------
# ----------------------------------------------------------------------

# get the current git branch, if it exists
git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# get the current virtual environment, if it exists
virtualenv_info(){
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv) "
}



# ----------------------------------------------------------------------
# ------------------------------ ALIASES -------------------------------
# ----------------------------------------------------------------------

alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias webcam='gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 8 -f v4l2 /dev/video0'
alias ls='ls -F --color'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'



# ----------------------------------------------------------------------
# ------------------------------- PROMPT -------------------------------
# ----------------------------------------------------------------------

# disable the standard virtual environment prompt addition
export VIRTUAL_ENV_DISABLE_PROMPT=1;

# terminal prompt: \u\ = username, \W\ = current directory
PS1="\[\e[0;92m\]\$(virtualenv_info)\[\e[m\]" 
PS1+="[" 
PS1+="\[\e[0;93m\]\u\[\e[m\]" 
PS1+=" " 
PS1+="\[\e[0;95m\]\W\[\e[m\]" 
PS1+="\[\e[0;92m\]\$(git_branch)\[\e[m\]" 
PS1+="]" 
PS1+="$ " 

export PS1;
export CLICOLOR=1;
