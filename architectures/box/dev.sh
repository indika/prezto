export PATH=$PATH:/Users/indika/dev/box/internal/nb-devtools/bin:/Users/indika/dev/box/sandbox
export PYTHONPATH=$PYTHONPATH:'/Users/indika/dev/box/internal/nb-devtools/modules'


source $ZSH_HOME/architectures/box/netcon.sh


# THIS IS DEFAULT
WORKON=default

CURRENT_PROJECT=/Users/indika/dev/box/safechat_$WORKON

alias safechat='$CURRENT_PROJECT/nbwebscan/src/nbwebscan'
alias yahoo='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/yahoo/messenger'
alias linkedin='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin'
alias twitter='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter'
alias aim='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/aim'
alias evernote='/Users/indika/dev/box/srm/srm/src/srm/evernote'



alias hgb="hg branches | sort | grep 'ipiyasena'"
alias icap_spector="/Users/indika/.virtualenvs/safechat/bin/python $CURRENT_PROJECT/nbwebscan/src/nbwebscan/helper/icap_spector/icap_spector.py"





function clear_flush()
{
    flush_redis
    clear_bundles
}

function flush_redis()
{
    printf "Resetting Cache\n"
    ss lego 'redis-cli -n 1 flushdb'
    # ss motor 'redis-cli -n 1 flushdb'
}

function clear_bundles()
{
    printf "Clearing all bundles\n"
    ss lego 'rm -rf /var/nbwebscan/bundles/*'
    # ss motor 'rm -rf /var/nbwebscan/bundles/*'
}


function lxml_sandbox()
{
    cd /Users/indika/dev/box/lxml_sandbox
    st -n /Users/indika/dev/box/lxml_sandbox

}





function fetch()
{
    sc lego:$1 /Users/indika/temp/lego_cache
    st /Users/indika/temp/lego_cache/$1
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

function fetch_bundles()
{
    printf "Re-Fetching Bundles from ISIX\n"
    sc -r 10.107.11.228:/var/nbwebscan/bundles /Users/indika/temp/bundles
}

function fetch_cache()
{
    printf "Re-Fetching Debug cache from Lego\n"
    cd ~
    rm -rf /Users/indika/temp/debug_cache
    sc -r lego:/tmp/debug_cache /Users/indika/temp/debug_cache
    cd ~/temp/debug_cache
    fdupes -dN ~/temp/debug_cache
}

function clear_cache()
{
    printf "Clearing Debug cache on Lego\n"
    ss lego 'rm -rf /tmp/debug_cache/*'
    ss lego 'mkdir -p /tmp/debug_cache'

}
