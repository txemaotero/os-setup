# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/Library/PostgreSQL/11/bin:$PATH:/Library/TeX/texbin/:$HOME/.cargo/bin:/usr/local/Cellar/python/3.7.4_1/Frameworks/Python.framework/Versions/3.7/bin
# export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.7/site-packages:/Users/txema/bitbucket/gromacs_analysis/src:/usr/local/bin:./src
export ANDROID_HOME=/Users/txema/Library/Android/sdk

#
# Command to check colors
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

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

TERM=xterm-256color
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export EDITOR="nvim"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="gnzh"

POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LINUX_ICON='%F{208}\uf31c Ubuntu'

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# ENABLE_CORRECTION="true"

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source $ZSH/oh-my-zsh.sh

# Example aliases
alias vim="nvim"
alias vi="nvim"

alias youtube-dl-best="youtube-dl -f bestvideo+bestaudio"

alias ema="emacs -nw"
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
alias vi="vim -X"
alias vmd="/Applications/VMD\ 1.9.4a38.app/Contents/MacOS/startup.command"
alias plotter2="/Applications/plotter2.app/Contents/MacOS/plotter2"
alias packmol="~/.packmol/packmol"
alias nwchem="/Users/txema/nwchem-6.8.1-release/bin/MACX64/nwchem"
alias vdos-filter="jupyter notebook --notebook-dir=${PWD} ~/vdos_filter/Interactive\ filter\ vDoS.ipynb"

# ctrl-p
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

POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{cyan}/%F{blue}"
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator custom_dir_icon dir_joined
                                   dir_writable_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status command_execution_time vcs
                                    background_jobs_joined time_joined
                                    user_joined os_icon_joined host_joined battery)
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="clear"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="cyan"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="clear"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="red"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_FORMAT="%D{\uf073 %b %d \uf017 %H:%M}" #  Jun 15  09:32
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="yellow"
POWERLEVEL9K_TIME_ICON=""
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='clear'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='magenta'
POWERLEVEL9K_USER_DEFAULT_BACKGROUND='clear'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='cyan'
POWERLEVEL9K_USER_ROOT_BACKGROUND='clear'
POWERLEVEL9K_USER_ROOT_FOREGROUND='red'
POWERLEVEL9K_USER_ICON="\uf415" # 
POWERLEVEL9K_ROOT_ICON="\u26a1" # ⚡
POWERLEVEL9K_HOST_LOCAL_BACKGROUND='clear'
POWERLEVEL9K_HOST_LOCAL_FOREGROUND='magenta'
POWERLEVEL9K_HOST_REMOTE_BACKGROUND='clear'
POWERLEVEL9K_HOST_REMOTE_FOREGROUND='magenta'
POWERLEVEL9K_HOST_ICON="\uF109 " # 
POWERLEVEL9K_SSH_ICON="\uF489 "  # 
POWERLEVEL9K_OS_ICON_BACKGROUND="clear"
POWERLEVEL9K_OS_ICON_FOREGROUND="grey"

# # Prompt settings OLD
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%K{white}%k"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{black}%F{green} \uf155%f%F{black} %k\ue0b0%f "

# # Separators
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0b0'
# POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$''
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0b2'
# POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\ue0b7'

# # Context
# DEFAULT_USER=$USER
# POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
# POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='028'
# POWERLEVEL9K_CONTEXT_TEMPLATE="%F{cyan}%n%f"
# POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'

# # Dirs
# POWERLEVEL9K_DIR_HOME_BACKGROUND='green'
# POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='green'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='yellow'
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

# # OS segment
# POWERLEVEL9K_OS_ICON_BACKGROUND='black'

# # VCS icons
# POWERLEVEL9K_VCS_GIT_ICON=$''
# POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$''
# POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
# POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf421'
# POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# # VCS colours
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
# POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
# POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
# POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'

# # VCS CONFIG
# POWERLEVEL9K_SHOW_CHANGESET=false

# # Status
# POWERLEVEL9K_OK_ICON=$'\uf164'
# POWERLEVEL9K_FAIL_ICON=$'\uf165'
# POWERLEVEL9K_CARRIAGE_RETURN_ICON=$'\uf165'

# Battery
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='red'
POWERLEVEL9K_BATTERY_LOW_BACKGROUND='clean'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='yellow'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='clean'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='green'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='clean'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='214'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='clean'

# # Time
# POWERLEVEL9K_TIME_FORMAT="%F{black}%D{%I:%M}%f"
# POWERLEVEL9K_TIME_BACKGROUND='cyan'

POWERLEVEL9K_CUSTOM_DIR_ICON='dir_icon'
POWERLEVEL9K_CUSTOM_DIR_ICON_BACKGROUND='clean'
POWERLEVEL9K_CUSTOM_DIR_ICON_FOREGROUND='blue'

POWERLEVEL9K_VIRTUALENV_BACKGROUND='clean'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='grey'

# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Prompt elements
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context custom_dir_icon dir vcs virtualenv)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs time battery)

# Emacs

# Set up non-Apple terminals.
if zstyle -t ':prezto:module:terminal' auto-title \
    && ( ! [[ -n "$STY" || -n "$TMUX" ]] )
    then
# Sets the tab and window titles before the prompt is displayed.
    add-zsh-hook precmd _terminal-set-titles-with-path
# Sets the tab and window titles before command execution.
    add-zsh-hook preexec _terminal-set-titles-with-command
fi

if [[ -n ${EMACS} ]]; then
    zstyle ':prezto:module:terminal' auto-title 'no'
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
    alias ls="colorls --light"
fi

unalias rm
unalias cp
unalias mv
unalias ipython

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
if [ -f /Users/txema/.tnsrc ]; then 
    source /Users/txema/.tnsrc 
fi
###-tns-completion-end-###
