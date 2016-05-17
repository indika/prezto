# VI Mode timeout
export KEYTIMEOUT=1


function findr()
{
    find . | grep -i $1
}


alias m_shan='mosh -p 60001 shan'

alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath="pwd | tr -d '\n' | pbcopy"


alias lc="fc -l '-1' | cut -f '5-' -d ' ' | gsed -e 's/^\s*//' -e 's/\s*$//' | xargs echo -n | pbcopy"
alias t="fc -e : -1"

alias passgen='pwgen -y 16'


# Temp scripts: Remember to delete me

function test_tree()
{
    cd /Users/indika/Dropbox/Projects/meta/sandbox
    python collapser.py
}




# Emacs stuff

alias vi='emacsclient -nw'
function em()
{
    emacsclient -n $1
}


# Generic Stuff

export CONFIG_SUBLIME='/Users/indika/Library/Application Support/Sublime Text 3/Packages'
export CONFIG_PYCHARM='/Users/indika/Library/Preferences/PyCharm2016.1'
export DROPBOX="/Users/indika/Dropbox"
export CODE_LIBRARY=${DROPBOX}/code_library

alias resource="source ~/.zshrc"

alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias rmlog='find . -name "*.log" -exec rm -rf {} \;'

alias timestamp="python -c 'import time; now = time.time(); print int(now); print int(now * 1000)'"


# VM stuff
alias vm_pause='VBoxManage controlvm 32e32fcf-2b86-44a4-b28f-ec9faa5ddb30 pause'
alias vm_resume='VBoxManage controlvm 32e32fcf-2b86-44a4-b28f-ec9faa5ddb30 resume'
alias vm_start='VBoxManage startvm 32e32fcf-2b86-44a4-b28f-ec9faa5ddb30 --type headless'
alias vm_stop="ssh shan 'shutdown now'"
alias vm_status='VBoxManage list runningvms | grep 32e32fcf-2b86-44a4-b28f-ec9faa5ddb30'



# Remind Stuff
alias sremind='export PYTHONPATH="/Users/indika/Dropbox/Projects/meta"; /Users/indika/.virtualenvs/meta/bin/python /Users/indika/Dropbox/Projects/meta/language/remind.py'

# Search Spanish library
function spag()
{
    ag --ignore-case -A5 $1 $CODE_LIBRARY/Languages/spanish
}
alias spes='/Users/indika/.virtualenvs/meta/bin/python /Users/indika/Dropbox/Projects/meta/language/translator/translate.py translate en es'
alias spen='/Users/indika/.virtualenvs/meta/bin/python /Users/indika/Dropbox/Projects/meta/language/translator/translate.py translate es en'
alias spin='export PYTHONPATH="/Users/indika/Dropbox/Projects/meta"; /Users/indika/.virtualenvs/meta/bin/python -m language.duolingo.query infinitive'

function sdef()
{
    open dict:://$1
}

function spc()
{
    spes $1 | pbcopy
}



# Timers
function countdown(){
   date1=$((`date +%s` + $1));
   while [ "$date1" -ge `date +%s` ]; do
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}
function stopwatch(){
  date1=`date +%s`;
   while true; do
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
   done
}



