# Path to oh-my-zsh installation.
export ZSH=/Users/wlisrausr/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="af-magic-custom"

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
plugins=(git git-extras osx web-search jsontools extract npm brew bower composer cloudapp docker)

# User configuration
export DEFAULT_USER='wlisrausr'

# Export PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

export LANG=en_US.UTF-8
export TERM="xterm-256color"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export PAGER=vimpager

# Android HOME env variables
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Vi mode
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fasd auto init
eval "$(fasd --init auto)"

# Exercism command completion
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

# Rubyenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
