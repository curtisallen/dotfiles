# Path to your oh-my-zsh installation.
export ZSH=/Users/callen/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="curtis"
#ZSH_THEME="agnoster"

alias c='pygmentize -O style=monokai -f console256 -g'
alias src='cd ~/src'
alias gornp='cd ~/src/src/github.com/RobotsAndPencils'
alias venv='source .venv/bin/activate'
alias ctags="`brew --prefix`/bin/ctags"

eval "$(rbenv init -)"
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
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export GOPATH='/Users/callen/src'
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
plugins=(git gitignore github node osx sublime brew compleate termialapp history-substring-search nvm-zsh ssh-agent fab vagrant jump jsontools go docker tmux aws terraform emoji go httpie valut dircycle zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting battery httpie scd)

# User configuration
# zsh cd widget
zle -N znt-cd-widget
bindkey "^T" znt-cd-widget

# Docker config
#export DOCKER_CERT_PATH=/Users/callen/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1
#export DOCKER_HOST=tcp://192.168.59.103:2376

# Diff Merge
export DIFFMERGE_HOME=/Applications/DiffMerge.app/Contents/MacOS
export PATH="/Users/callen/anaconda/bin:/Users/callen/src/go_appengine:$GOPATH/bin:/Users/callen/bin:$DIFFMERGE_HOME:$PATH"
#export PATH="/Users/callen/src/go_appengine:$GOPATH/bin:/Users/callen/bin:/Users/callen/Library/Python/2.7/bin:$DIFFMERGE_HOME:$PATH"
#export PATH="$GOPATH/bin:/Users/callen/bin:/Users/callen/Library/Python/2.7/bin:$DIFFMERGE_HOME:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
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
export NVM_DIR="/Users/callen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Powerline
#powerline-daemon -q

# Functions
function extract() {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xjf $1 ;;
			*.tar.gz) tar xzf $1 ;;
			*.bz2) bunzip2 $1 ;;
			*.rar) rar x $1 ;;
			*.gz) gunzip $1 ;;
			*.tar) tar xf $1 ;;
			*.tbz2) tar xjf $1 ;;
			*.tgz) tar xzf $1 ;;
			*.zip) unzip $1 ;;
			*.Z) uncompress $1 ;;
			*.7z) 7z x $1 ;;
			*) echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function saws() {
  ssh ubuntu@$*
}

function sshup() {
	ssh-add ~/.ssh/curtis_rsa
	ssh-add ~/.ssh/rnp
	#ssh-add ~/.ssh/tex_staging.pem
	#ssh-add ~/.ssh/tex_infrastructure.pem
	#ssh-add ~/.ssh/tex_production.pem
  #ssh-add ~/.ssh/varo_development.pem
  #ssh-add ~/.ssh/varo_infrastructure.pem
  #ssh-add ~/.ssh/varo_dev1.pem
  #ssh-add ~/.ssh/varo_prod.pem
}

# Start ssh agent
eval `ssh-agent -s`
sshup

function servethis() {
	python -m SimpleHTTPServer
}
# Clean go pkg directories
NO_COLOR='\033[0m'
OK_COLOR='\033[32;01m'
ERROR_COLOR='\033[31;01m'

function cleango() {
    if [ -d "$PWD/Godeps/_workspace/pkg" ] ; then
        echo "Removing golang packages from ${PWD}/Godeps/_workspace/pkg/darwin_amd64/"
        rm -r $PWD/Godeps/_workspace/pkg/darwin_amd64/*
        [ "$(ls -A $PWD/Godeps/_workspace/pkg/darwin_amd64)" ] && echo "${ERROR_COLOR}Not Empty${NO_COLOR}" || echo "${OK_COLOR}Empty${NO_COLOR}"
    fi
    if [ -d "$GOPATH/pkg/darwin_amd64/" ] ; then
        echo "Removing golang packages from ${GOPATH}/pkg/darwin_amd64/"
        rm -r $GOPATH/pkg/darwin_amd64/*
        [ "$(ls -A $GOPATH/pkg/darwin_amd64)" ] && echo "${ERROR_COLOR}Not Empty${NO_COLOR}" || echo "${OK_COLOR}Empty${NO_COLOR}"
    fi
}

# Gimme alias
alias go14='eval "$(GIMME_GO_VERSION=1.4.3 gimme)"'
alias go15='eval "$(GIMME_GO_VERSION=1.5 gimme)"'
alias go16='eval "$(GIMME_GO_VERSION=1.6.2 gimme)"'
alias go17='eval "$(GIMME_GO_VERSION=1.7.1 gimme)"'
alias go18='eval "$(GIMME_GO_VERSION=1.8 gimme)"'
go17

#export PATH="$HOME/.gobrew/bin:$PATH"
#eval "$(gobrew init -)"
# NPM runscript
alias npmrs='npm run-script'
# Postgres database
alias pgstart='pg_ctl -D /usr/local/var/postgres9.5 -l /usr/local/var/postgres9.5/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres9.5 stop -s -m fast'

# commit to neovim
alias vim='nvim'
alias vi='nvim'

# gitcheckout magic
alias gcob='git checkout $(git branch | fzf)'

#function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/callen/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/callen/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/callen/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/callen/google-cloud-sdk/completion.zsh.inc'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
