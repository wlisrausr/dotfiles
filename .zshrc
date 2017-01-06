# Path to oh-my-zsh installation.
export ZSH=/Users/wlisrausr/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="agnoster-custom"

# Case-sensitive completion.
CASE_SENSITIVE="true"

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

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

source $ZSH/oh-my-zsh.sh

# Path to MySQl
export PATH=/usr/local/mysql/bin:$PATH

# Path to PHP 7.0
export PATH=/usr/local/php5/bin:$PATH

# ZSH syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
