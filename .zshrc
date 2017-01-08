# Path to oh-my-zsh installation.
export ZSH=/Users/wlisrausr/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="agnoster-custom"

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Disable marking untracked files under VCS as dirty
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change the command execution time history
SAVEHIST=1000
HIST_STAMPS="mm/dd/yyyy"

# Plugins to load
plugins=(git)

# User configuration
export DEFAULT_USER='wlisrausr'

# Export PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export LANG=en_US.UTF-8
export TERM="xterm-256color"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export EDITOR=vim

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
