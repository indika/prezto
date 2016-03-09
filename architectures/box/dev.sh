# Netbox Blue Specific

export PATH=$PATH:/Users/indika/dev/box/internal/nb-devtools/bin:/Users/indika/dev/box/sandbox:/Users/indika/.local/bin/
# export PATH=$PATH:/Users/indika/dev/box/internal_nb/nb-devtools/bin:/Users/indika/dev/box/sandbox:/Users/indika/.local/bin/

# Switching between NB and BB
function switch_bb()
{
    cd ~
    ln -fs /Users/indika/dev/config/mercurial/.hgrc_bb .hgrc
}

function switch_nb()
{
    #TODO: I need to update the path to the correct internal
    cd ~
    ln -fs /Users/indika/dev/config/mercurial/.hgrc_nb .hgrc
}

# # Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
# export GHC_DOT_APP="/Applications/ghc-7.10.2.app"
# if [ -d "$GHC_DOT_APP" ]; then
#   export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
# fi

# export PATH=$PATH:/Users/indika/dev/box/internal/nb-devtools/bin:/Users/indika/dev/box/sandbox
# export PATH=$PATH:/Users/indika/dev/box/internal/nb-devtools/bin:/Users/indika/dev/box/sandbox:/Users/indika $$/dev/tools/sublimehaskell-sandbox/.cabal-sandbox/bin
export PYTHONPATH=$PYTHONPATH:'/Users/indika/dev/box/internal/nb-devtools/modules'
export PYTHONPATH=$PYTHONPATH:'/Users/indika/dev/box/mailarchive/mailrelay/src'
export BOX_DOCS=/Users/indika/dev/box/docs


source $ZSH_HOME/architectures/box/site_init.sh
# source $ZSH_HOME/architectures/box/netcon.sh
source $ZSH_HOME/architectures/box/netlog.sh
# source $ZSH_HOME/architectures/box/reporting.sh
# source $ZSH_HOME/architectures/box/lync.sh
# source $ZSH_HOME/architectures/box/netlog.sh
source $ZSH_HOME/architectures/box/safechat.sh
# source $ZSH_HOME/architectures/box/chive.sh
# source $ZSH_HOME/architectures/box/internal.sh






# Monitor stuff
function sync_site()
{
    pkill fswatch
    rm -f /Users/indika/dev/box/saber/sync/sync_input.log
    # fswatch --batch-marker -e ".hg" . | /Users/indika/dev/box/saber/sync/dist/build/sync/sync
    fswatch --batch-marker -e ".hg" -e ".git" -e ".idea" /Users/indika/dev/box/netbox > /Users/indika/dev/box/saber/sync/sync_input.log &
    /Users/indika/dev/box/saber/sync/dist/build/sync/sync $1
    printf "Destroying process"
    ps aux | grep fswatch
}


function test_on_lego()
{
    # printf "Selective files (Netbox) are being AUPed to Lego\n"
    # cd /Users/indika/dev/box/netbox
    # hg baup lego /Users/indika/dev/box/netbox

    # printf "Selective files (Safchat) are being AUPed to Lego\n"
    # cd /Users/indika/dev/box/safechat
    # hg baup lego /Users/indika/dev/box/safechat

    # aup -r lego .
    hg baup lego .

    rununittest lego -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1
}


function test_on_motor()
{
    # printf "Selective files (Netbox) are being AUPed to MOTOR\n"
    # cd /Users/indika/dev/box/netbox
    # hg baup motor /Users/indika/dev/box/netbox

    # printf "Selective files (Safchat) are being AUPed to MOTOR\n"
    # cd /Users/indika/dev/box/safechat
    # hg baup motor /Users/indika/dev/box/safechat

    aup -r motor .
    rununittest motor -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1
}

function test_on_site()
{
    SITEKEY=$1
    rununittest $SITEKEY -n -t '-xvs --report=skipped' $2 2>&1 | tee $2.log

    ag -B 1 -A 3 'indika' $2.log
    ag -B 1 -A 3 'FAIL' $2.log
    ag -B 1 -A 3 'passed' $2.log

    printf "TESTING: %s" % $2
}

function test_all_in_directory()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego /Users/indika/dev/box/safechat

    for f in test_*.py
    do
        # echo $f
        filename="${filename%.*}"
        echo filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}


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
