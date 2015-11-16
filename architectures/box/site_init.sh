# nbreports
# http://vmware.nb/vmdetails?uuid=5000a497-dbbc-dfe5-50a5-af181bdddef6&refresh=1446514348.77
# 1     30.1.11 - nbreports
# 2     30.1.11 - nbreports


function revert_vm()
{
    /Users/indika/.virtualenvs/netbox/bin/python /Users/indika/dev/box/sandbox/helpers/revert_vm.py $1 $2
}

function site_init()
{
    SITEKEY=$1
    cd /Users/indika/dev/box/netbox
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nb-test -v

    cd /Users/indika/dev/box/safechat
    aup -r $SITEKEY /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/test -v
    aup $SITEKEY /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/conftest.py -v
    aup $SITEKEY /Users/indika/dev/box/safechat/nbarchive/src/nbarchive/test -v

    scp /Users/indika/dev/box/docs/box.lego.bash_rc.txt ${SITEKEY}:.bashrc
}


function run_update()
{
    site-update lego netbox_30.1.11
    site-update oldrel-default netbox_30.1.9.3
    # ssh -t ipiyasena@blue.nb '/usr/local/sbin/quickupdate lego devtools-c7'
    # ssh -t ipiyasena@blue.nb '/usr/local/sbin/quickupdate motor netbox_30.2'
}

function test_move_nics()
{
    curl 'http://vmware.nb/movenics' -H 'Origin: http://vmware.nb' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://vmware.nb/vmdetails?uuid=50004144-07fe-d267-1b01-9413ce4c1027&refresh=1445997456.6' -H 'Connection: keep-alive' --data 'nicconnected_4000=on&nichardware_4000=Dev&nicconnected_4001=on&nichardware_4001=Dev+Internet+Side&uuid=50004144-07fe-d267-1b01-9413ce4c1027' --compressed
}

function nic_lego_set_dev_internet_side()
{
    curl 'http://vmware.nb/movenics' -H 'Origin: http://vmware.nb' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://vmware.nb/vmdetails?uuid=50004144-07fe-d267-1b01-9413ce4c1027' -H 'Connection: keep-alive' --data 'nicconnected_4000=on&nichardware_4000=Dev&nicconnected_4001=on&nichardware_4001=Dev+Internet+Side&uuid=50004144-07fe-d267-1b01-9413ce4c1027' --compressed
}

function revert_lego()
{
    #TODO: Have a look at this page
    # http://vmware.nb/listsnapshots?uuid=5000724b-446e-8163-71c7-707a055ce2a1

    #75         30.1.9 - clean
    #76         30.1.10 - clean
    #77         30.1.11 - clean
    #78         30.1.11 checkpoint - clean (updated SSH Key)
    #79         30.1.11 checkpoint - clean (updated SSH Key)
    #80         30.2 checkpoint (oxcoda testing)
    #81         30.2 checkpoint (oxcoda testing, with lan)
    #83         30.2 d - (oxcoda testing, with Cobalt and no Internet)
    #84         30.1.11d - pppoe test (prep)
    #86         30.1.11 checkpoint - clean (updated SSH Key, with multiple Nics)
        #88     30.1.11 checkpoint - clean (updated SSH Key, Cobalt, with multiple nics)
    #87         30.1.11 Configuration


    # Lego has UUID: 50004144-07fe-d267-1b01-9413ce4c1027
    curl 'http://vmware.nb/revertvm' -H 'Origin: http://vmware.nb' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://vmware.nb/vmdetails?uuid=50004144-07fe-d267-1b01-9413ce4c1027&refresh=1444462124.94' -H 'Connection: keep-alive' --data 'uuid=50004144-07fe-d267-1b01-9413ce4c1027&snapshotid=83' --compressed
}

function revert_motor()
{
    #42         30.1.2 - dev with trawl files (rather clean)
    #44         30.1.11 - dev trawl
    #45         30.1.11 - dev trawl (with subnet)
    #46         30.1.11 - dev with trawl files (rather clean with free space and with cobalt subnet)
    #47         30.2 - dev trawl (reading for testing)
    #48         30.2 - dev trawl (reading for testing, with no internet)
    #50         30.2 - dev trawl d (reading for testing, with no internet)
    #51         30.2 - dev trawl e (reading for testing, with no internet)
    #52         30.2 - dev trawl e (reading for testing, with no internet, with upgraded schema)
    #61         30.1.11 - pretrawl
    #               I may need to take this from 30.1.11

    # Motor has UUID: 50007f7d-f5cb-7a5b-ad23-9761b1d5e6a6
     curl 'http://vmware.nb/revertvm' -H 'Origin: http://vmware.nb' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Connection: keep-alive' --data 'uuid=50007f7d-f5cb-7a5b-ad23-9761b1d5e6a6&snapshotid=49' --compressed
}


function test_pppoe()
{
    revert_vm lego 84
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    cd /Users/indika/dev/tower/sites/lego
    ansible-playbook lego.yml
    cd /Users/indika/dev/box/netbox/netcon
    aup -r lego . -v

    # curl 'http://vmware.nb/poweron' -H 'Origin: http://vmware.nb' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://vmware.nb/vmdetails?uuid=503eac1a-74fa-1f96-9a62-4418f3f5281c&refresh=1445923761.86' -H 'Connection: keep-alive' --data 'uuid=503eac1a-74fa-1f96-9a62-4418f3f5281c' --compressed
}

function test_react()
{
    revert_vm ireport 2
    sleep 5s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup ireport
    # ss lego 'touch /nbdebug; reboot'
    # sleep 5s
    # python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    # cd /Users/indika/dev/tower/sites/lego
    # ansible-playbook lego.yml
    # site-update lego devtools
    # ss lego 'touch /tmp/q'
    cd /Users/indika/dev/box/netbox_clean/nbreporting
    aup -r ireport . -v
    cd /Users/indika/dev/box/netbox_reporting/WebUI
    aup -r ireport . -v
    cd /Users/indika/dev/box/netbox_reporting
    aup -rm ireport nbreporting
}

function test_lego_migration()
{
    revert_vm lego 88
    sleep 5s
    site-update lego netbox_30.2
    sleep 60s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego 30.2
    ss lego 'touch /nbdebug; reboot'
    sleep 5s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego 30.2
}

function test_lego_migration_old()
{
    revert_vm lego 88
    sleep 5s
    site-update lego netbox_30.2
    sleep 60s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    ss lego 'touch /nbdebug; reboot'
    sleep 5s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    cd /Users/indika/dev/tower/sites/lego
    ansible-playbook lego.yml
    site-update lego devtools
    ss lego 'touch /tmp/q'
    cd /Users/indika/dev/box/netbox/netcon
    aup -r lego . -v
}

function trawl_restart()
{
    revert_vm motor 61
    sleep 5s
    site-update motor netbox_30.2

    # TODO: Not sure how long I should sleep for, but I'm waiting for certain conditions
    # Such as the correct version has been applied
    # And perhaps that the runonce's are complete

    # TODO: Read the comments that I have written for myself

    sleep 60s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup motor 30.2
    cd /Users/indika/dev/tower/sites/motor
    ansible-playbook motor.yml
    site-update motor devtools
    ss motor 'touch /tmp/q'
    cd /Users/indika/dev/box/netbox/netcon/src/netcon/migration
    aup -r motor . -v

    # I shouldn't need this on a real trawl restart
    # ss build7 'cd /home/ipiyasena/build/safechat/nbwebscan; hg pull -u; hg checkout 9.12; hg build --force --notag --install 10.3.115.100'
    # ss build7 'cd /home/ipiyasena/build/netbox/hive; hg pull -u; hg checkout 30.2; hg build --force --notag --install 10.3.115.100'

    ss motor 'reboot'
    sleep 10s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup motor
}



function trawl_restart_lite()
{
    # Use this for reverting the trawl from what is already 30.2
    revert_vm motor 52
    sleep 5s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup motor
    cd /Users/indika/dev/tower/sites/motor
    ansible-playbook motor.yml
    ss motor 'touch /tmp/q'
    cd /Users/indika/dev/box/netbox/nbpostgresql
    aup -r motor . -v
    cd /Users/indika/dev/box/netbox/netcon/src/netcon/migration
    aup -r motor . -v
}

function set_lego_oxcoda_testing()
{
    revert_vm lego 83
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    ss lego 'touch /nbdebug; reboot'
    sleep 5s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    cd /Users/indika/dev/tower/sites/lego
    ansible-playbook lego.yml
    ss lego 'touch /tmp/q'
    cd /Users/indika/dev/box/netbox/netcon
    aup -r lego . -v
}


function set_dev_lego()
{
    revert_lego
    sleep 5s
    site-update lego netbox_30.2
    sleep 60s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    ss lego 'touch /nbdebug; reboot'
    sleep 5s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    cd /Users/indika/dev/tower/sites/lego
    ansible-playbook lego.yml
    site-update lego devtools
    ss lego 'touch /tmp/q'
    cd /Users/indika/dev/box/netbox/netcon
    aup -r lego . -v
}

function set_dev_lego_30_1_11()
{
    revert_lego
    sleep 60s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    ss lego 'touch /nbdebug; reboot'
    sleep 5s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    cd /Users/indika/dev/tower/sites/lego
    ansible-playbook lego.yml
    site-update lego devtools
    ss lego 'touch /tmp/q'
}






function shutdown_vms()
{
    ss motor 'shutdown now'
    ss lego 'shutdown now'
}
