# BOX configuration


# Imports
source $ZSH_HOME/architectures/box/rdp.sh
source $ZSH_HOME/architectures/box/dev.sh

source $ZSH_HOME/architectures/tools/boxen.sh

# source $ZSH_HOME/architectures/tools/hd.sh
# source $ZSH_HOME/architectures/tools/synergy.sh




# Netbox Blue Specific

export BOX_DOCS=/Users/indika/dev/box/docs
export BOX_SAFECHAT=/Users/indika/dev/box/safechat



# Generic Stuff

export CONFIG_SUBLIME='/Users/indika/Library/Application Support/Sublime Text 3/Packages'
export CONFIG_PYCHARM='/Users/indika/Library/Preferences/PyCharm40'
export DROPBOX="/Users/indika/Dropbox"
export CODE_LIBRARY=${DROPBOX}/code_library




# ALIASES that I need
alias gca='git commit -v -a'
alias grv='git remote -v'
alias gst='git status'
alias ggpull='git pull origin master'
alias ggpush='git push origin master'

alias ll='ls -lah'

alias pass='pwgen -y 16'



alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias rmlog='find . -name "*.log" -exec rm -rf {} \;'

alias haskell='st -n $CODE_LIBRARY/Haskell $CODE_LIBRARY/Blog ~/dev/functional;cd ~/dev/functional'


alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath="pwd | tr -d '\n' | pbcopy"
alias hgbii='hg branches | grep ipiyasena'


alias pass='pwgen -y 16'


alias write='st -n /Users/indika/dev/config/sublime/projects/write.sublime-project'




# Generic stuff
alias movies='echo "http://thepiratebay.se/browse/201/0/7/0" | pbcopy'



function last_command()
{
    var=`tail -2 ~/.zsh_history | head -1`
    echo $var | grep -oE ';(.*)' | cut -c 2- | pbcopy
}


function ad()
{
    ag -C5 --ignore-case $1 $CODE_LIBRARY $BOX_DOCS
}




# activate
# source $VIRTUALENV_ROOT/dev/bin/activate

# PYENV Stuff
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv shell netbox

