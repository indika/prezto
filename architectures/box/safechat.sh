

# AIM

CURRENT_PROJECT=/Users/indika/dev/box/safechat

alias safechat='$CURRENT_PROJECT/nbwebscan/src/nbwebscan'
alias aim='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/aim'
alias yahoo='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/yahoo/messenger'
alias linkedin='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin'
alias twitter='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter'
alias aim='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/aim'
alias evernote='/Users/indika/dev/box/srm/srm/src/srm/evernote'

alias icap_spector="/Users/indika/.virtualenvs/safechat/bin/python $CURRENT_PROJECT/nbwebscan/src/nbwebscan/helper/icap_spector/icap_spector.py"


function test_aim()
{
    cd /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/aim
    aup -r lego . -v


}
