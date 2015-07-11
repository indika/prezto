# Synergy stuff

function synergy_build()
{
    cd /Users/indika/dev/opensource/synergy
    ./hm.sh build -d
}

function synergy_cobalt_copper_server()
{
    cd /Users/indika/dev/opensource/synergy/bin/debug
    ./synergys --config $CODE_LIBRARY/Tools/Synergy/synergy.cobalt_copper.conf -f --crypto-pass d95026058966f0712d9a1a361ad23f92 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}

function synergy_cobalt_wings_server()
{
    cd /Users/indika/dev/opensource/synergy/bin/debug
    ./synergys --config $CODE_LIBRARY/Tools/Synergy/synergy.cobalt_wings.conf -f --crypto-pass d95026058966f0712d9a1a361ad23f92 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}


function synergy_cobalt_client()
{
    /Users/indika/dev/opensource/synergy/bin/debug/synergyc -f --crypto-pass d95026058966f0712d9a1a361ad23f92 192.168.1.54 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}


function synergy_teleport_copperhead()
{
    cd /Users/indika/dev/opensource/synergy/bin/debug
    scp synergyc indika@copperhead:
}
