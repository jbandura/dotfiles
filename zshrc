# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Exports
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export EVENT_NOKQUEUE=1

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="doubleend"

# Vim mode
bindkey -v

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

################################
# HOME PROJECTS STUFF
################################

alias szu_front="cd ~/ember_dev/szu_front && ember s --proxy http://localhost:3000"
alias szu_back="cd ~/ruby_dev/szu_api && rails s"
alias elf="cd ~/ember_dev/ember-legit-forms"

################################
# NETGURU PROJECTS STUFF
################################

alias netguruco="cd ~/praca_dev/netguruco"

alias dreikanter_backend="cd ~/praca_dev/dreikanter/dreikanter/"
alias dreikanter_front="cd ~/praca_dev/dreikanter/dreikanter-front/"
alias dreikanter_back_server="cd ~/praca_dev/dreikanter/dreikanter/ && bin/rails server"
alias dreikanter_front_server="cd ~/praca_dev/dreikanter/dreikanter-front/ && nvm use && ember s"

alias honeypot="cd ~/praca_dev/honeypot"


################################
# VIM
################################
alias vim="nvim"

################################
# RAILS
################################

alias rs="rails s"
alias gtfo="rm -rf node_modules bower_components dist tmp && npm cache clear && npm install && bower install"
alias rake_clear="bundle exec rake db:drop db:create db:schema:load db:migrate db:seed"



################################
# TMUX
################################

alias honeypot_tmux="./shell/tmux_work.sh"
alias elabi_tmux="./shell/tmux_elabi.sh"

################################
# GIT
################################

alias gp="git push"
alias gstash="git add . && git stash"
alias gcm="git commit"

################################
# EMBER
################################
alias es="ember s"
alias et="ember t"





################################
# PHP
################################
alias lamp="curl -L -o 'install.sh' http://bit.ly/1hBfq57 && curl -L -o 'Vagrantfile' http://bit.ly/1mE3Qt9 && vagrant up"

################################
# SSH ALIASES
################################
alias ssh_cove="ssh coveco@cove.de -p 222"
#
################################
# TMUX ALIASES
################################

alias tmux_kill="tmux kill-session -t"

################################
# EXPORTS
################################

export PATH="$HOME/.bin:$PATH"
export PATH="/Library/Ruby/Gems/2.0.0/bin:$PATH"
export EDITOR='vim'

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

#export "/Users/jbandura/.rbenv/versions/2.1.5/lib/ruby/gems/2.1.0:$PATH"
eval "$(rbenv init - zsh --no-rehash)"

export NVM_DIR="/Users/jbandura/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
