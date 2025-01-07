# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/curtis.allen/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="curtis"
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="agnoster"

alias src='cd ~/src'
alias ctags="`brew --prefix`/bin/ctags"

eval "$(rbenv init -)"

# ctrl=x ctrl+x will open up the last line in vim to edit
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^x' edit-command-line

# compaudit -u
# eval "$(pyenv init -)"
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
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
# export GOPATH='/Users/curtis.allen/src'
# export GOPRIVATE='slack-github.com'
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
#plugins=(git gitignore github node osx sublime brew compleate termialapp history-substring-search ssh-agent go docker tmux aws terraform emoji go httpie zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting battery httpie z kubectl) 
plugins=(git history-substring-search zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting docker z) 

# User configuration
# zsh cd widget
zle -N znt-cd-widget
bindkey "^T" znt-cd-widget
bindkey "\C-x\C-e" edit-command-line

# BAT pager
export BAT_PAGER=/usr/local/bin/bat

# Diff Merge
export PATH="$HOME/src/bin:$HOME/.local/bin:$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$HOME/.rbenv/bin:/usr/local/opt/openjdk/bin:$HOME/.cargo/bin:/Users/curtis.allen/Library/Python/3.8/bin:~/.cache/bazel-slack-managed/0.23.0/bin:/usr/local/sbin:/usr/local/bin:/Users/curtis.allen/bin:/Applications/Docker.app/Contents/Resources/bin:$PATH"
#export PATH="/Users/curtis.allen/src/go_appengine:$GOPATH/bin:/Users/curtis.allen/bin:/Users/curtis.allen/Library/Python/2.7/bin:$DIFFMERGE_HOME:$PATH"
#export PATH="$GOPATH/bin:/Users/curtis.allen/bin:/Users/curtis.allen/Library/Python/2.7/bin:$DIFFMERGE_HOME:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export VISUAL='vim'
export EDITOR='vim'

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
export NVM_DIR="/Users/curtis.allen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# nvm use stable

alias sc="$HOME/src/slack-cli/bin/slack"
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

function mc() {
        open "https://mc.tinyspeck.com/mc/search.php?q=$1"
}

# Rename the tmux window pane and z into the directory
function zt() {
        windowID=$(tmux display-message -p '#I')
        tmux rename-window -t $windowID $1
        z $1
}

function sshup() {
  ssh-add --apple-use-keychain ~/.ssh/callen-id_rsa
}

# Start ssh agent
eval `ssh-agent -s`

function servethis() {
        python3 -m http.server
}

# helm completion
source <(helm completion zsh)
# Clean go pkg directories
NO_COLOR='\033[0m'
OK_COLOR='\033[32;01m'
ERROR_COLOR='\033[31;01m'


# Gimme alias
alias usego='eval "$(GIMME_GO_VERSION=1.23.4 gimme)"'

#export PATH="$HOME/.gobrew/bin:$PATH"
#eval "$(gobrew init -)"
# NPM runscript
alias npmrs='npm run-script'
# Postgres database
# alias pgstart='pg_ctl -D /usr/local/var/postgres9.5 -l /usr/local/var/postgres9.5/server.log start'
# alias pgstop='pg_ctl -D /usr/local/var/postgres9.5 stop -s -m fast'

# commit to neovim
# alias vim='nvim'
# alias vi='nvim'

# gitcheckout magic
function gbp() {
	# check out the given branch and set upstream 
	git checkout -b $1
	EXIT_CODE=$?
	if [ $EXIT_CODE -eq 0 ]; then
		git push -u origin HEAD
	fi
}

alias gcob='git checkout $(git branch | fzf)'
alias gcorb='checkout_remote_branch $(git branch -r | fzf)'
function checkout_remote_branch() {
  git checkout -b ${1:gs/origin\//} $1
}

# kubectl contexts
alias kctx='kubectl config use-context $(kubectl config get-contexts -o=name | fzf)'

# these beaches better reconize
alias kubebeach='ssh -A -t z-kube-beach-callen-coyote "tmux attach || tmux new -s kube-beach"'
alias opsbeach='ssh -A -t z-ops-callen-hornet "tmux attach || tmux new -s kube-beach"'

#function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias viewbranch='open $(slack checkpoint -w)'
# alias ls='exa'

alias weather="curl https://adventurous-chess.glitch.me/39.78/-105.00"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rg | fzf | vim
vimsearch () {
	nvim $(rg $@ | fzf -m | cut -d':' -f1 | sort | uniq)
}

alias finder="rg --files | fzf | xargs nvim -p"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##############################################
# Adding Source for use with Webapp and Artifactory
##############################################
source /Users/curtis.allen/.slack_webapp_artifactory

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
