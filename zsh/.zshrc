# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# start bash stuff
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"
source /Users/mammoth/mammoth_dev_machine/aliases
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=$PATH:~/Downloads//platform-tools/
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/lib
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Library/simba/googlebigqueryodbc/lib
export ODBCINI=/Library/simba/googlebigqueryodbc/Setup/odbc.ini
export ODBCINSTINI=/Library/simba/googlebigqueryodbc/Setup/odbcinst.ini
export SIMBAGOOGLEBIGQUERYODBCINI=/Library/simba/googlebigqueryodbc/lib/simba.googlebigqueryodbc.ini
export GOOGLE_APPLICATION_CREDENTIALS=/Users/mammoth/Downloads/admin_haris.json
export LINODE_API_TOKEN='ae7dad622efa4bbec2a4aa27b2840c01d77c5c714680721dc5f7ddea682e7a21'
export LINODE_DOWN_SIZE='Nanode 1GB'
export LINODE_NORMAL_SIZE='Linode 8GB'
export LINODE_DISKSIZE='8000'
export LINODE_NAME='shalimar'

alias labuild='lossh ubuntu@10.0.50.102'
alias lfeatures='ssh ubuntu@139.162.217.68 -i /Users/mammoth/.ssh/id_rsa'
alias lossh='ssh -o ProxyCommand="ssh -o StrictHostKeyChecking=no -o IdentityFile=/Users/mammoth/.ssh/bastion_key.pem -W %h:%p -q ubuntu@54.165.255.45" -i ~/.ssh/id_rsa'
alias tenv='source /Users/mammoth/testenv/testenv/bin/activate'
alias vdocs='source /Users/mammoth/mammoth_code/mammoth_docs/vdocs/bin/activate'
alias venv3='source /Users/mammoth/testenv/venv3/bin/activate'
alias venv_at='source /Users/mammoth/mammoth_code/api_tests/venv_at/bin/activate'
alias shalimar='ssh ubuntu@176.58.111.68'
alias frontend='cd /Users/mammoth/mammoth_code/frontend'
alias backend='cd /Users/mammoth/mammoth_dev_machine/mvc-service'
alias go2code='cd /Users/mammoth/mammoth_code'
alias linodeenv='source /Users/mammoth/mammoth_code/linode/linode_env/bin/activate'
alias vim='/usr/local/Cellar/vim/8.2.1350/bin/vim'
# end bash stuff

# Path to your oh-my-zsh installation.
export ZSH="/Users/mammoth/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
