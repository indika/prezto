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


# VM stuff
alias vm_pause='VBoxManage controlvm 1e464b2d-f577-4bc5-9fa3-47459630694a pause'
alias vm_resume='VBoxManage controlvm 1e464b2d-f577-4bc5-9fa3-47459630694a resume'
alias vm_start='VBoxManage startvm 1e464b2d-f577-4bc5-9fa3-47459630694a --type headless'
alias vm_stop="ssh shan 'shutdown now'"
alias vm_status='VBoxManage list runningvms | grep 1e464b2d-f577-4bc5-9fa3-47459630694a'


# Sanity Stuff

alias sanity_start='/Users/indika/dev/sanity/responder/dist/build/sanity/sanity'
alias sanity_ui_start='open /Users/indika/dev/sanity/SanityInterface/build/Release/SanityInterface.app'


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

