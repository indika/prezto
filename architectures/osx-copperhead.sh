
source $ZSH/architectures/box/common.sh


function synergy_copperhead_client()
{
    ~/synergyc -f --crypto-pass d95026058966f0712d9a1a361ad23f92 cobalt 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}
