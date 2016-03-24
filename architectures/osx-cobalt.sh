# BOX configuration


# Imports
source $ZSH_HOME/architectures/all-common.sh
source $ZSH_HOME/architectures/osx-common.sh

source $ZSH_HOME/architectures/box/rdp.sh
source $ZSH_HOME/architectures/box/dev.sh

source $ZSH_HOME/architectures/tools/boxen.sh

# source $ZSH_HOME/architectures/tools/hd.sh
# source $ZSH_HOME/architectures/tools/synergy.sh



# Generic Stuff

export CONFIG_SUBLIME='/Users/indika/Library/Application Support/Sublime Text 3/Packages'
export CONFIG_PYCHARM='/Users/indika/Library/Preferences/PyCharm40'
export DROPBOX="/Users/indika/Dropbox"
export CODE_LIBRARY=${DROPBOX}/code_library


# Emacs stuff
function em()
{
    emacsclient -n $1
}


# VM stuff
alias vm_pause='VBoxManage controlvm 32e32fcf-2b86-44a4-b28f-ec9faa5ddb30 pause'
alias vm_resume='VBoxManage controlvm 32e32fcf-2b86-44a4-b28f-ec9faa5ddb30 resume'
alias vm_start='VBoxManage startvm 32e32fcf-2b86-44a4-b28f-ec9faa5ddb30 --type headless'
alias vm_stop="ssh shan 'shutdown now'"
alias vm_status='VBoxManage list runningvms | grep 32e32fcf-2b86-44a4-b28f-ec9faa5ddb30'

# Tower stuff

alias tower='/Users/indika/dev/tower/sites'


# Sanity Stuff

alias sanity_start='/Users/indika/dev/sanity/responder/dist/build/sanity/sanity'
alias sanity_ui_start='open /Users/indika/dev/sanity/SanityInterface/build/Release/SanityInterface.app'
alias hitme='/Users/indika/dev/reinforcement/dist/build/reinforcement/reinforcement'

# Delta stuff

function delta_build()
{
    cd /Users/indika/dev/box/delta
    stack build
}

function delta()
{
    /Users/indika/dev/box/delta/.stack-work/install/x86_64-osx/lts-3.15/7.10.2/bin/delta
}

function delta_test()
{
    fswatch --batch-marker -e ".hg" -e ".git" -e ".idea" /Users/indika/dev/box/netbox | delta
}

# Postgres stuff
export PGDATA="/opt/boxen/data/postgresql-9.4"
alias psql='/opt/boxen/homebrew/bin/psql -d postgres'




alias pass='pwgen -y 16'


alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias rmlog='find . -name "*.log" -exec rm -rf {} \;'

alias haskell='st -n $CODE_LIBRARY/Haskell $CODE_LIBRARY/Blog ~/dev/functional;cd ~/dev/functional'


alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath="pwd | tr -d '\n' | pbcopy"
alias pubkey="cat ~/.ssh/id_rsa_nbb.pub|pbcopy"
alias hgbii='hg branches | grep ipiyasena'


alias pass='pwgen -y 16'


alias write='st -n /Users/indika/dev/config/sublime/projects/write.sublime-project'




# Generic stuff
alias movies='echo "https://thepiratebay.vg//browse/201/0/7/0" | pbcopy'



function last_command()
{
    var=`tail -2 ~/.zsh_history | head -1`
    echo $var | grep -oE ';(.*)' | cut -c 2- | pbcopy
}


# This has to come after the aliases
function ad()
{
    ag -C5 --ignore-case $1 $CODE_LIBRARY $BOX_DOCS
}




# activate
source ~/.virtualenvs/netbox/bin/activate

# PYENV Stuff
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# pyenv shell netbox

