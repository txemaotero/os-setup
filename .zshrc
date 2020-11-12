# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/Library/PostgreSQL/11/bin:$PATH:/Library/TeX/texbin/:$HOME/.cargo/bin:/usr/local/Cellar/python/3.7.7/Frameworks/Python.framework/Versions/3.7/bin

# Syntax highlighting and tab completion
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -Uz compinit

# Coloured man pages using less as pager
main() {
    env \
	      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	      LESS_TERMCAP_md=$(printf "\e[1;31m") \
	      LESS_TERMCAP_me=$(printf "\e[0m") \
	      LESS_TERMCAP_se=$(printf "\e[0m") \
	      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	      LESS_TERMCAP_ue=$(printf "\e[0m") \
	      LESS_TERMCAP_us=$(printf "\e[1;36m") \
	      man "$@"
}

# Good colors
TERM=xterm-256color
# Default editor
export EDITOR="nvim-nightly"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
  common-aliases
  python
  virtualenv
  osx
)

# User configuration

POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias vim="nvim-nightly"
alias vi="nvim-nightly"
alias ema="emacs -nw"
alias youtube-dl-best="youtube-dl -f bestvideo+bestaudio"
alias python3="/usr/local/opt/python/bin/python3.7"
alias nagaussview="python3 ~/bitbucket/nagausspy/src/nagausspy/viewer.py"
alias mntscratch="sshfs hydra:/scratch/chema/ ~/scratch"
alias mntnas="sshfs hydra:/nas/chema/ ~/nas"
alias mntgpu="sshfs hydra:/gpudrive/chema/ ~/gpudrive"
alias mntcesga="sshfs cesga:lustre/ ~/cesga"
alias ls="colorls"
alias l="ls -l"
alias ll="ls -l"
alias la="ls -la"
alias tree="ls --tree"
alias yapf="yapf3"
alias vmd="/Applications/VMD\ 1.9.4a38.app/Contents/MacOS/startup.command"
alias plotter2="/Applications/plotter2.app/Contents/MacOS/plotter2"
alias packmol="~/.packmol/packmol"
alias nwchem="${HOME}/nwchem-6.8.1-release/bin/MACX64/nwchem"
# Unaliases
unalias rm
unalias cp
unalias mv
unalias ipython
unalias fd
unalias ff

# ctrl-p/n go up and down
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# completion ..
zstyle ':completion:*' special-dirs true

# ssh
local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts
setopt nonomatch

# kill completion
zstyle ':completion:*:processes' command 'NOCOLORS=1 ps -U $(whoami)|sed "/ps/d"'
zstyle ':completion:*:processes' insert-ids menu yes select
zstyle ':completion:*:processes-names' command 'NOCOLORS=1 ps xho command|sed "s/://g"'
zstyle ':completion:*:processes' sort false

############ Theme

dir_icon(){
    python3 $HOME/github/os-setup/get_icon.py $PWD
}

prompt_anaconda() {
  # Depending on the conda version, either might be set. This
  # variant works even if both are set.
  _path=$CONDA_ENV_PATH$CONDA_PREFIX
  if ! [ -z "$_path" ]; then
    # config - can be overwritten in users' zshrc file.
    set_default POWERLEVEL9K_ANACONDA_LEFT_DELIMITER ""
    set_default POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER ""
    "$1_prompt_segment" "$0" "$2" "$3" "$4" "Conda" 'PYTHON_ICON'
  fi
}

# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Set up non-Apple terminals.
if zstyle -t ':prezto:module:terminal' auto-title \
    && ( ! [[ -n "$STY" || -n "$TMUX" ]] )
    then
    # Sets the tab and window titles before the prompt is displayed.
    add-zsh-hook precmd _terminal-set-titles-with-path
    # Sets the tab and window titles before command execution.
    add-zsh-hook preexec _terminal-set-titles-with-command
fi

export VIRTUAL_ENV_DISABLE_PROMPT=
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"


function jptnode(){
    # Forwards port $1 from node $2 into port $1 on the local machine and listens to it
    ssh -t -t chema@fmgtc009.usc.es -L ${1}:localhost:${1} ssh ${2} -L ${1}:localhost:${1}
    }

function realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

function jupyter-molview(){
    if [ -z "$2"]
    then
    sed "s?fgro_replace?$(realpath ${1})?; s?ftrr_replace??" ~/.molecular_representations/plantilla.ipynb > ~/.molecular_representations/temporary.ipynb
    else
    sed "s?fgro_replace?$(realpath ${1})?; s?ftrr_replace?$(realpath ${2})?" ~/.molecular_representations/plantilla.ipynb > ~/.molecular_representations/temporary.ipynb
    fi
    jupyter-notebook ~/.molecular_representations/temporary.ipynb
    }

###-tns-completion-start-###
if [ -f ${HOME}/.tnsrc ]; then 
    source ${HOME}/.tnsrc 
fi
###-tns-completion-end-###

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
