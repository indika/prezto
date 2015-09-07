

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

function update_lego()
{
    /Users/indika/dev/box/safechat
    hg baup lego .

    # ss lego 'nbconf squid_refresh; systemctl restart squid; systemctl restart safechat_icap'
    ss lego 'systemctl restart safechat_icap; systemctl | grep safechat_icap'
    ss lego 'nbconf squid_refresh'
}

function fetch_icaps()
{
    #cat /var/log/safechat/icap | grep 'XI ICAP.*for URL.*https://twitter.com/i/discover'

    printf "Fetching ICAPs from Lego\n"
    rm -rf /Users/indika/temp/icaps
    mkdir /Users/indika/temp/icaps

    sc lego:/var/tmp/safechat/icap/\*.request   /Users/indika/temp/icaps/

    # Now parse them
    # /Users/indika/.virtualenvs/safechat/bin/python /Users/indika/dev/box/helper/icap_inspector/data/icaps/icap_plain_text.py --dir /Users/indika/temp/icaps

    for f in /Users/indika/temp/icaps/*.request
    do
        filename="${f}.txt"
        echo $filename
        # rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log
        showicap --pretty $f > $filename

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done
}
