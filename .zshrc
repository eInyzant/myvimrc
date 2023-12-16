# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#ZSH_THEME="powerline"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)
plugins=(git git-extras symfony2 last-working-dir node npm mvn composer bower python pip virtualenv virtualenvwrapper redis-cli rsync docker)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=$PATH:$HOME.local/bin/:/usr/local/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbi:/usr/local/share/python:~/Library/Python/2.7/bin
export PATH=$HOME/.local/bin/:/opt/local/bin:/opt/local/sbin:/opt/admin/bin:/usr/local/sbin:/usr/local/bin:/user/local/mysql/bin:/usr/local/git/bin:/user/bin:/bin:/user/sbin:$PATH:$HOME/.config/composer/vendor/bin:$HOME/Documents/android-studio/bin:$HOME/.pub-cache/bin


export MANPATH="/usr/local/main:$MANPATH"
export LANG="fr_FR.UTF-8"
export LC_ALL="fr_FR.UTF-8"
export LC_CTYPE="fr_FR.UTF-8"
export APP_ENV=dev
source ~/.dcc_func.sh
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export ES_JAVA_HOME="/usr/lib/jvm/default-java"
export ES_JAVA_OPTS="$ES_JAVA_OPTS -Djna.tmpdir=/home/erwan/Documents/elasticsearch-7.12.1/tmp/"
export ES_TMPDIR="/home/erwan/Documents/elasticsearch-7.12.1/tmp"
export COMPOSER_HOME="/home/erwan/.config/composer"
export ES_HOME="/home/erwan/Documents/elasticsearch-7.12.1/"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Powerline
#. ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
WORDCHARS="${WORDCHARS:s#/#}"
WORDCHARS="${WORDCHARS:s#.#}"
export EDITOR=$(which nvim)

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)%* - %n"
  fi
}

export LC_ALL="en_US.UTF-8"

alias hosts='sudo nvim /etc/hosts'
alias work='cd /var/www/html/Localhost/ && l'
alias sumo='cd /var/www/html/Localhost/sumotori/'
alias portaildubijou='cd /var/www/html/Localhost/pdb/project/httpdocs/ && l'
alias pdbmagento='php -f /var/www/html/Localhost/pdb/project/httpdocs/bin/magento'
alias compilepdb='pdbmagento cache:clean && pdbmagento setup:di:compile && echo "finishede"'
alias mistercannes='cd /var/www/html/Localhost/tommy/mistercannes/magento/ && l'
alias mcmagento='php -f /var/www/html/Localhost/tommy/mistercannes/magento/bin/magento'
alias compilemistercannes='mcmagento cache:clean && mcmagento setup:di:compile && "finishede"'
alias ipone='cd /var/www/html/Localhost/ipone/httpdocs/ && l'
alias iponemagento='php -f /var/www/html/Localhost/ipone/httpdocs/bin/magento'
alias compileipone='iponemagento cache:clean && iponemagento setup:di:compile && echo "finishede"'
alias deleev='cd /var/www/html/Localhost/la-belle-vie/'
alias deleev-start=deleev-start
alias deleev-stop=deleev-stop
alias deleev-update=deleev-update
alias deleev-update-and-start=deleev-update-and-start
alias dco='deleev && cd deleev-core'
alias dad='deleev && cd deleev-admin'
alias dap='deleev && cd deleev-api'
alias dpr='deleev && cd deleev-admin-products'
alias dfl='deleev && cd flow'


alias crontab="VIM_CRONTAB=true crontab"


#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
setopt CORRECT



## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

setopt nonomatch            # do not print error on non matched patterns
## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
MAILCHECK=0

# Disable hostname completion
zstyle ':completion:*' hosts off

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function deleev-start() {
  echo "############ STARTING ...."
  sudo service docker start
  sudo service apache2 stop
  sudo service mysql stop
  sudo -i service elasticsearch stop
  sudo service rabbitmq-server stop

  work
  echo "############ DOCKER HAPROXY"
  cd la-belle-vie/docker-haproxy
  ./bin/deploy_and_start.sh
  echo "############ DELEEV API"
  cd ../deleev-api
  ./bin/deploy_and_start.sh
  echo "############ DELEEV ADMIN"
  cd ../deleev-admin
  ./bin/deploy_and_start.sh
  echo "############ FLOW"
  cd ../flow
  ./bin/deploy_and_start.sh
  echo "########### TEAM"
  cd ../deleev-team
  #npm run serve
  #echo "########### DMBOARD"
  #cd ../dm-board
  #./bin/deploy_and_start.sh
  #echo "########### COMMIS ET PREP"
  #cd ../commis-et-prep/
  #./bin/deploy_and_start.sh
  cd ../deleev-admin/

  #ngrok start api admin dmboard commisetprep
  ngrok start api admin dmboard
}
function deleev-stop() {
  sudo ls
  echo "############ STOPPING..."
  work
  echo "########### DOCKER HAPROXY"
  cd la-belle-vie/docker-haproxy
  dcc stop
  echo "########### DELEEV API"
  cd ../deleev-api
  dcc stop
  echo "########### DELEEV ADMIN"
  cd ../deleev-admin
  dcc stop
  echo "########### FLOW"
  cd ../flow
  dcc stop

  #echo "########### DMBOARD"
  #cd ../dm-board
  #dcc stop

  echo "########### TEAM"
  cd ../deleev-team

  echo "########### Stop docker containers"
  docker stop $(docker ps -a -q)
  #echo "########### COMMIS ET PREP"
  #cd ../commis-et-prep/
  #dcc stop
  start-php
}


function deleev-update() {
  sudo ls
  echo "########### UPDATING"
  work
  echo "########### DOCKER HAPROXY"
  cd la-belle-vie/docker-haproxy
  git pull origin master
  echo "########### DELEEV CORE"
  cd ../deleev-core
  git pull origin master
  echo "########### DELEEV API"
  cd ../deleev-api
  git pull origin master
  echo "########### DELEEV ADMIN"
  cd ../deleev-admin
  git pull origin master
  echo "########### FLOW"
  cd ../flow
  git pull origin master
  echo "########### TEAM"
  cd ../deleev-team
  git pull origin master
  #echo "########### COMMIS ET PREP"
  #cd ../commis-et-prep/
  #git pull origin master
  #echo "########### DMBOARD"
  #cd ../dm-board/
  #git pull origin master

  cd ../deleev-admin/
}
function deleev-update-and-start() {
  deleev-update
  deleev-start
}

pdb-update-static-files()
{
  portaildubijou
  pdbmagento maintenance:enable
  pdbmagento cache:flush
  rm -Rf pub/static/frontend/* pub/static/adminhtml/* var/view_preprocessed/* pub/static/_cache/* pub/static/_requirejs/*
  pdbmagento setup:static-content:deploy fr_FR --theme="Magento/backend"
  pdbmagento setup:static-content:deploy en_US --theme="Magento/backend"
  pdbmagento setup:static-content:deploy fr_FR --theme="Pdb/joaillerie"
  pdbmagento setup:static-content:deploy fr_FR --theme="Pdb/commercial"
  pdbmagento setup:static-content:deploy fr_FR --theme="Pdb/traditionnel"
  pdbmagento setup:static-content:deploy fr_FR --theme="Pdb/portaildubijou"
  pdbmagento maintenance:disable
}

sphp74()
{
  alias composer=$HOME/Documents/composer2/composer.phar
  sudo a2dismod php8.0
  sudo a2dismod php8.1
  sudo a2enmod php7.4
  sudo service rabbitmq-server start
  sudo systemctl restart apache2
  sudo service mysql start
  sudo update-alternatives --set php /usr/bin/php7.4
  sudo update-alternatives --set phar /usr/bin/phar7.4
  sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.4
  sudo update-alternatives --set phpize /usr/bin/phpize7.4
  sudo update-alternatives --set php-config /usr/bin/php-config7.4
}
sphp80()
{
  alias composer=$HOME/Documents/composer2/composer.phar
  sudo a2dismod php7.4
  sudo a2enmod php8.0
  sudo a2dismod php8.1
  sudo service rabbitmq-server start
  sudo systemctl restart apache2
  sudo service mysql start
  sudo update-alternatives --set php /usr/bin/php8.0
  sudo update-alternatives --set phar /usr/bin/phar8.0
  sudo update-alternatives --set phar.phar /usr/bin/phar.phar8.0
  sudo update-alternatives --set phpize /usr/bin/phpize8.0
  sudo update-alternatives --set php-config /usr/bin/php-config8.0
}
sphp81()
{
  alias composer=$HOME/Documents/composer2/composer.phar
  sudo a2dismod php7.4
  sudo a2dismod php8.0
  sudo a2enmod php8.1
  sudo systemctl restart apache2
  sudo service mysql start
  sudo service rabbitmq-server start
  sudo update-alternatives --set php /usr/bin/php8.1
  sudo update-alternatives --set phar /usr/bin/phar8.1
  sudo update-alternatives --set phar.phar /usr/bin/phar.phar8.1
  sudo update-alternatives --set phpize /usr/bin/phpize8.1
  sudo update-alternatives --set php-config /usr/bin/php-config8.1
}
start-php()
{
  sudo service mysql start
  sudo service apache2 start
  sudo service docker stop
}

function crontab()
{
  if [ $1 == "-r" -o $1 == "-sr" -o $1 == "-rs" ]; then
    echo "-r option removes the crontab file."
    echo "To remove the file use the option '-ir' to interactively remove crontab file"
  else
    command crontab $1
  fi
}

function startDocker()
{
  sudo service mysql stop
  sudo service apache2 stop
  docker-compose up -d --build
}


# FLUTTER / ANDROID : 
export CHROME_EXECUTABLE=/usr/bin/brave-browser

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/erwan/.dart-cli-completion/zsh-config.zsh ]] && . /home/erwan/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

