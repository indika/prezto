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


function revert_lego()
{
    #TODO: Have a look at this page
    # http://vmware.nb/listsnapshots?uuid=5000724b-446e-8163-71c7-707a055ce2a1

    #75         30.1.9 - clean
    #76         30.1.10 - clean
    #77         30.1.11 - clean

    # Lego has UUID: 50004144-07fe-d267-1b01-9413ce4c1027
    curl 'http://vmware.nb/revertvm' -H 'Origin: http://vmware.nb' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://vmware.nb/vmdetails?uuid=50004144-07fe-d267-1b01-9413ce4c1027&refresh=1444462124.94' -H 'Connection: keep-alive' --data 'uuid=50004144-07fe-d267-1b01-9413ce4c1027&snapshotid=77' --compressed

    # NEXT: Install devtools-c7
}

function revert_motor()
{
    #42         30.1.2 - dev with trawl files (rather clean)
    #44         30.1.11 - dev trawl

    # Motor has UUID: 50007f7d-f5cb-7a5b-ad23-9761b1d5e6a6
     curl 'http://vmware.nb/revertvm' -H 'Origin: http://vmware.nb' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Connection: keep-alive' --data 'uuid=50007f7d-f5cb-7a5b-ad23-9761b1d5e6a6&snapshotid=44' --compressed
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
    cd /Users/indika/dev/box/aws
    ansible-playbook lego.yml
    site-update lego devtools
    ss lego 'touch /tmp/q'
}

function set_dev_lego_30_1_11()
{
    revert_lego
    sleep 60s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    ss lego 'touch /nbdebug; reboot'
    sleep 5s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego
    cd /Users/indika/dev/box/aws/sites/lego
    ansible-playbook lego.yml
    site-update lego devtools
    ss lego 'touch /tmp/q'
}

function trawl_restart()
{
    revert_motor
    sleep 5s
    site-update motor netbox_30.2

    # Not sure how long I should sleep for, but I'm waiting for certain conditions
    # Such as the correct version has been applied
    # And perhaps that the runonce's are complete
    sleep 60s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup motor
    cd /Users/indika/dev/box/aws/sites/motor
    ansible-playbook motor.yml
    site-update motor devtools
    ss motor 'touch /tmp/q'
    cd /Users/indika/dev/box/netbox/netcon
    aup -r motor . -v
    sleep 20s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup motor
}


function shutdown_vms()
{
    ss motor 'shutdown now'
    ss lego 'shutdown now'
}
