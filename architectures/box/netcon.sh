# see site_init.sh for related functions


function test_beta()
{
    cd /Users/indika/dev/box/tasks/notest
    sc ~/dev/box/sandbox/helpers/blue/pry.py oldrel-default:/var/tmp/pry.py
    ss oldrel-default 'python /var/tmp/pry.py'



}


function test_noop()
{
    cd /Users/indika/dev/box/netbox/netcon
    aup motor /Users/indika/dev/box/netbox/netcon -rv

    cd /Users/indika/dev/tower/sites/motor
    ap motor.yml

    cd /Users/indika/dev/box/tasks/notest
    sc netcon-empty.db motor:/etc/netcon/netcon.db

    # sc netcon-notest.db motor:/etc/netcon/netcon.db


    #1360819208.38
    # sc netcon-populated.db motor:/etc/netcon/netcon.db

    ss motor 'python -m netcon.migration.migrationtool'
}


function test_bob()
{
    # deleteme
    sc netcon-populated.db oldrel-default:/etc/netcon/netcon.db
}

function fetch_trawl_log()
{
    cd /Users/indika/dev/box/tasks/trawl
    /Users/indika/dev/box/sandbox/helpers/file_rotate.py -d 1 -w 1 -m 1 -l  backups trawl.log
    rm -f trawl.log
    scp motor:/var/log/trawl.log .

    rm -f connectd.tgz
    rm -rf connectd
    ssh motor 'cd /var/tmp/trawl; tar -cvzf connectd.tgz connectd'
    scp motor:/var/tmp/trawl/connectd.tgz .
    tar -xvf connectd.tgz

    # /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl trawl.log
}

function fetch_trawl_log_from_blue()
{
    cd /Users/indika/dev/box/tasks/trawl
    /Users/indika/dev/box/sandbox/helpers/file_rotate.py -d 1 -w 1 -m 1 -l  backups trawl.log
    rm -f trawl.log
    scp blue.nb:/home/ipiyasena/data/trawl/trawl.log.gz .
    gunzip trawl.log.gz
}

function netcon_json()
{
    SITEKEY=$1
    # SITEKEY=10.107.10.254

    ss $SITEKEY 'curl localhost:60002/config/network > /tmp/netcon.json'
    sc $SITEKEY:/tmp/netcon.json /Users/indika/dev/box/dbs_netcon/netcon.json

    # ss $SITEKEY 'curl localhost:60002/config/ngfw/config/policies > /tmp/ngfw.json'
    # sc $SITEKEY:/tmp/ngfw.json /Users/indika/dev/box/dbs_netcon/ngfw.json
}

function netcon_sample_hive()
{
    scp /Users/indika/dev/tower/sites/motor/assets/network_hive.json m:/etc/hive/network_hive.json
}


function netcon_test()
{
    SITEKEY=$1

    cd ~/dev/box/netbox
    hg baup $SITEKEY ~/dev/box/netbox
    cd /Users/indika/dev/box/netbox/netcon/tests
    test_on_site $SITEKEY test_something.py
}


function motor_netcon_test()
{
    SITEKEY=motor
    sc /Users/indika/dev/box/docs/box.lego.bash_rc.txt $SITEKEY:.bashrc
    aup -r $SITEKEY /Users/indika/dev/box/netbox/netcon
    aup -r $SITEKEY /Users/indika/dev/box/netbox/hive
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbshared
    aup -r $SITEKEY /Users/indika/dev/box/netbox/py-nb
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbwebobj
    aup -r $SITEKEY /Users/indika/dev/box/netbox/ngfw

    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbscan
    aup -r $SITEKEY /Users/indika/dev/box/safechat

    ss $SITEKEY 'systemctl enable hived.service; systemctl start hived.service'
    ss $SITEKEY 'journalctl -u hived.service'

    ss $SITEKEY 'cd /usr/lib/python2.7/site-packages/netcon/migration; python migrationtool.py'
    ss $SITEKEY 'cd /usr/libexec/netcon; python connectd_test.py'

    ss $SITEKEY 'systemctl restart connectd'
}


function netcon_schema()
{
    SITEKEY=$1
    cd /Users/indika/dev/box/netbox
    hg baup $SITEKEY ~/dev/box/netbox

    ss $SITEKEY 'python /usr/libexec/nbscan/hiveexport'
    ss $SITEKEY 'systemctl enable hived.service; systemctl restart hived.service'
    ss $SITEKEY 'cd /usr/lib/python2.7/site-packages/netcon/migration; python migrationtool.py'
}


function netcon_trawl()
{
    cd /Users/indika/dev/box/netbox/netcon/src/netcon/migration
    aup -r motor .
    ss motor 'cd /usr/lib/python2.7/site-packages/netcon/migration; python trawl.py'
}

function netcon_dns()
{
    SITEKEY=$1

    cd ~/dev/box/netbox
    hg baup $SITEKEY ~/dev/box/netbox
    netcon_curl

    ag 'dns_config'
    # ag 'dns_server1'
    # ag 'dns_server2'
}

function netcon_init()
{
    SITEKEY=$1

    sc /Users/indika/dev/box/docs/box.lego.bash_rc.txt $SITEKEY:.bashrc

    aup -r $SITEKEY /Users/indika/dev/box/netbox
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/netcon
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/hive
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/nbshared
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/py-nb
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/nbwebobj
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/ngfw
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/lcdd
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/nbscan


    aup -r $SITEKEY /Users/indika/dev/box/safechat


    sc /Users/indika/dev/box/sandbox/nb-tools/nbddns_hack.py $SITEKEY:/tmp

    ss $SITEKEY 'rm -f /home/httpd/netbox/net/passthroughnets*; rm -f /usr/lib/python2.7/site-packages/netcon/plugins/passthroughnets*; rm -f /usr/lib/python2.3/site-packages/netcon/plugins/passthroughnets*'


    ss $SITEKEY 'systemctl enable hived.service; systemctl start hived.service'
    ss $SITEKEY 'journalctl -u hived.service'

    # sc /Users/indika/dev/box/dbs_netcon/netcon.db.date $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/dbs_netcon/netcon.db.jsracs $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/dbs_netcon/netcon.db.nbb-dev $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/dbs_netcon/netcon.db.oxcoda $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/dbs_netcon/netcon.db.thud $SITEKEY:/etc/netcon

    ss $SITEKEY 'touch /nbdebug'
}


function netcon_pry_init()
{
    revert_vm lego 88
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego 30.1.11

    scp ~/dev/box/sandbox/helpers/blue/pry.py lego:/var/tmp/pry.py
}

function netcon_pry()
{
    SITEKEY=$1
    EXPECTED_ARGS=1

    if [ $# -ne $EXPECTED_ARGS ]
    then
      echo "Usage: `basename $0` {arg}"
      echo "Not with $# parameters, but with $EXPECTED_ARGS"
      return
      # exit $E_BADARGS
    fi

    echo
    echo -n "Prying open a netcon DB"
    echo


    NETCON_PATH="/var/backups/extracts/${SITEKEY}/etc/netcon/netcon.db"
    echo $NETCON_PATH
    rm -f /var/tmp/netcon.db

    scp motor:${NETCON_PATH} /var/tmp/netcon.db
    ss lego 'rm /tmp/netcon.db'
    scp /var/tmp/netcon.db lego:/tmp

    ssh lego 'cd /etc/netcon; mv netcon.db netcon.db.orig; cp /tmp/netcon.db .; chmod g+w netcon.db; chown nobody:root netcon.db;'

    ss lego 'python /var/tmp/pry.py'

    ssh lego 'cd /etc/netcon; rm netcon.db; mv netcon.db.orig netcon.db'
}

function netcon_pry_blue()
{
    #TODO: This script is the same as the one above, but it forms a different sitekey
    #And reads from blue instead

    SITEKEY=$1
    EXPECTED_ARGS=1

    if [ $# -ne $EXPECTED_ARGS ]
    then
      echo "Usage: `basename $0` {arg}"
      echo "Not with $# parameters, but with $EXPECTED_ARGS"
      return
      # exit $E_BADARGS
    fi

    echo
    echo -n "Prying open a netcon DB"
    echo


    NETCON_PATH="/home/ipiyasena/data/netcon/netcon_${SITEKEY}.db"
    echo $NETCON_PATH
    rm -f /var/tmp/netcon.db

    scp blue.nb:${NETCON_PATH} /var/tmp/netcon.db
    ss lego 'rm /tmp/netcon.db'
    scp /var/tmp/netcon.db lego:/tmp

    ssh lego 'cd /etc/netcon; mv netcon.db netcon.db.orig; cp /tmp/netcon.db .; chmod g+w netcon.db; chown nobody:root netcon.db;'

    ss lego 'python /var/tmp/pry.py'

    ssh lego 'cd /etc/netcon; rm netcon.db; mv netcon.db.orig netcon.db'
}


function netcon_pry_something()
{
    cd /Users/indika/dev/box/netbox/netcon/src/netcon/migration
    aup lego pry.py
    aup lego __init__.py

    rm -f /tmp/netcon.db
    scp m:/var/backups/save/absme2/netcon.db /tmp
    scp /tmp/netcon.db l:/tmp/netcon.db

    ssh l 'cd /etc/netcon; mv netcon.db netcon.db.orig; cp /tmp/netcon.db .; chmod g+w netcon.db; chown nobody:root netcon.db; python -m netcon.migration.pry; rm netcon.db; mv netcon.db.orig netcon.db'
}

function netcon_pry_inject()
{
    rm -f /tmp/netcon.db
    scp m:/var/backups/save/absme2/netcon.db /tmp
    scp /tmp/netcon.db l:/tmp/netcon.db

    ssh l 'cd /etc/netcon; mv netcon.db netcon.db.orig; cp /tmp/netcon.db .; chmod g+w netcon.db; chown nobody:root netcon.db;'
}



function netcon_ngfw()
{
    SITEKEY=$1

    cd /Users/indika/dev/box/netbox
    hg baup $SITEKEY ~/dev/box/netbox
    aup -r $SITEKEY /Users/indika/dev/box/netbox/ngfw

    # ss $SITEKEY 'cd /usr/lib/python/site-packages/ngfw; python nbdb.py'

    cd /Users/indika/dev/box/netbox/netcon/tests
    test_on_site $SITEKEY test_ngfw_hive_migration.py
}


function netcon_migrate()
{
    SITEKEY=$1

    cd ~/dev/box/netbox
    hg baup $SITEKEY ~/dev/box/netbox -v
    # aup $SITEKEY /Users/indika/dev/box/netbox/netcon/src/netcon/test

    # ss $SITEKEY 'cd /usr/libexec/nbdb.d; python netconhive'
    ss $SITEKEY 'cd /usr/lib/python2.7/site-packages/netcon/migration; python migrationtool.py'

    # ss $SITEKEY 'curl localhost:60002/config/network > /tmp/netcon.json'
    # sc $SITEKEY:/tmp/netcon.json /Users/indika/dev/box/dbs_netcon/netcon.json

    # ss $SITEKEY 'cd /usr/lib/python2.7/site-packages/netcon/test; python test_migration.py'
}



function netcon_test_localint()
{
    SITEKEY=10.107.10.254
    cd ~/dev/box/netbox
    hg baup $SITEKEY ~/dev/box/netbox
    cd /Users/indika/dev/box/netbox/py-nb/tests
    aup $SITEKEY test_localint.py
    test_on_site $SITEKEY test_localint.py
}

function netcon_test_lite()
{
    SITEKEY=lego
    hg baup $SITEKEY ~/dev/box/netbox
    cd /Users/indika/dev/box/netbox/netcon/src/netcon/test
    python test_migration.py
}

function netcon_test_all()
{
    SITEKEY=$1
    hg baup $SITEKEY ~/dev/box/netbox
    cd /Users/indika/dev/box/netbox/netcon/tests
    test_on_site $SITEKEY test_netcon_general.py
}

function netcon_test_durus()
{
    SITEKEY=$1

    # cd ~/dev/box/netbox
    # hg baup $SITEKEY ~/dev/box/netbox
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/hive
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/py-nb
    aup -r $SITEKEY /Users/indika/dev/box/netbox/netcon/src/netcon/migration
    # aup $SITEKEY /Users/indika/dev/box/netbox/netcon/src/netcon/config_netcon.py
    # aup $SITEKEY /Users/indika/dev/box/netbox/netcon/src/netcon/config_dhcp.py
    # aup $SITEKEY /Users/indika/dev/box/netbox/netcon/src/netcon/const.py
    ss $SITEKEY 'cd /usr/lib/python2.7/site-packages/netcon/migration; python explore_durus.py'
}

function netcon_db_fetch()
{
    SITEKEY=$1
    sc $SITEKEY:/etc/netcon/netcon.db /Users/indika/dev/box/dbs_netcon/netcon.db.tmp
}

function netcon_update()
{
    SITEKEY=$1
    cd ~/dev/box/netbox

    #baup needs Twisted
    hg baup $SITEKEY ~/dev/box/netbox -v
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/netcon

    netcon_curl
}

function netcon_db_switch()
{
    SITEKEY=lego
    ss $SITEKEY 'rm -f /etc/netcon/netcon.db; cp /etc/netcon/netcon.db.nbb-dev /etc/netcon/netcon.db'
}



function netcon_curl()
{
    # curl 'http://lego.safenetbox.biz/net/edit?oid=links%2F14;bid=links%2F7' -H 'Cookie: session=+D8UOa2KQsicNpAAS8yga8zsQa4W/4cAlmP8TQ8KL1apUt8qtkWIiIxVkMdW2y98JMV+901gnrvB2oX4PHcxr5nY4InrUum+o6p8cey79mcAb4cVk34cMn9LgO+RqJLt5QlvOXDGxjZ43Ad5XIhWUg==' -H 'Origin: http://lego.safenetbox.biz' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://lego.safenetbox.biz/net/edit?oid=links%2F14;bid=links%2F7' -H 'Connection: keep-alive' --data '__formname__=ppplink&oid=links%2F14&enabled=on&advanced=on&name=PPP+Link+USB-ACM&test_pairs4=&username=bob&password=bob&phone_number=123&init_string=ATZ&auth_method=0&force_ip=10.107.10.200&update=Update&%3D%3Dnetworks4%3Dip%5B___new___%5D=&%3D%3Dnetworks4%3Dprefix%5B___new___%5D=&%3D%3Dnetworks4%3Dcomment%5B___new___%5D=&%3D%3Droutes4%3Dnetwork%5B___new___%5D=&%3D%3Droutes4%3Dprefix%5B___new___%5D=&%3D%3Droutes4%3Dmtu%5B___new___%5D=1500&%3D%3Droutes4%3Dcomment%5B___new___%5D=' --compressed

    # Read interfaces
    # curl 'http://lego.safenetbox.biz/net/interfaces?oid=interfaces' -H 'Cookie: session=EtSNGO3BQDy5owSQjPKwBaXngkcV8l/U5SGcwC8OyAL2hxMGb/VkglPEQ8U4Lhc6kETOfVauurwP0QIlUX9cahRon8ly5pEyvlxF8Y3qib4bWvZ6MhEzq0vNK9F2GH2OhjjAMYNmo14cQ9DdGTYp9Q==' -H 'Origin: http://motor.safenetbox.biz' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://motor.safenetbox.biz/net/interfaces?oid=interfaces' -H 'Connection: keep-alive' --data '__formname__=loginform&httpd_username=tech&httpd_password=tech&login=Login' --compressed

    # Web wizard
    # curl 'http://motor.safenetbox.biz/wizard/network' -H 'Cookie: session=5g7fAumGSUm30KxX4olMGoOx7r91RURC1j8ODNizDUs5JfJAo32Ab/gc32zWVl1XrxmAuh8p8fEX3Gr7vUKlBdAmc9/Oit3GTidA99Lrl3mV4ykA3hDsbE+gKwMD8Z3BRHm28FXJhdtpCt+xtvr4xw==' -H 'Origin: http://motor.safenetbox.biz' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://motor.safenetbox.biz/wizard/network' -H 'Connection: keep-alive' --data '__formname__=network&ip=10.3.115.100&prefix=255.255.0.0&dhcp_start=192.168.0.100&dhcp_end=192.168.0.200&linktype=DHCPLink&next=Next+%3E&old_linktype=DHCPLink' --compressed

    # Broken VLANs
    curl 'http://lego.safenetbox.biz/net/interfaces?oid=interfaces/0' -H 'Pragma: no-cache' -H 'Origin: http://lego.safenetbox.biz' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Referer: http://lego.safenetbox.biz/net/interfaces?oid=interfaces/0' -H 'Cookie: session=O/wkaMtfSsyObLOfqt2u407e1tajYhq4fntW3KMVZRbBbQMrs+TShDb4uq+w9PIu/s5ik/QHbr73D/2xygkmcT+edCdm8vVIKpCA/MPpHZq3mX2vmT4yjeF8Rvx/7eHOYJ7IekU/QkxMBHkWOSwF9w==' -H 'Connection: keep-alive' --data '__formname__=base_form&oid=interfaces%2F0&name=Internet+Ethernet&role=Internet&speed=autoneg&delete=Delete&%3D%3Dvlans%3Ddel%5Binterfaces%2F0%2F0%5D=on' --compressed

    # A delete
    #curl 'http://lego.safenetbox.biz/net/local?oid=links%2F0;flav=local' -H 'Pragma: no-cache' -H 'Origin: http://lego.safenetbox.biz' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Referer: http://lego.safenetbox.biz/net/local?oid=links%2F0;flav=local' -H 'Cookie: session=Z575hMH9Q+OYE0bLnCReIEnVJsfOO4mEawaQlqVJQvtV2Z0Quvoy1MdAR1g8XIlg2ug7u8P1ykokAS8llMGfGAmWjmYoevm22FmYbI0vQFQNy/CbgV90Av/HxKbkh4hTC2tA9Gz5sjGQVz+is+nHmA==' -H 'Connection: keep-alive' --data '__formname__=link&oid=links%2F0&flav=local&dhcp_start=192.168.0.100&dhcp_end=192.168.0.200&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=10.233.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=Old+NBB&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=10.12.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=Current+NBB&%3D%3Dnetworks4%3Ddel%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=on&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=10.201.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=New+NEW+YO+YO+NBB&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=10.202.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=New+YOYOMAMA+NBB&%3D%3Dnetworks4%3Dip%5B___new___%5D=&%3D%3Dnetworks4%3Dprefix%5B___new___%5D=&%3D%3Dnetworks4%3Dcomment%5B___new___%5D=&networks_update=Update&%3D%3Droutes4%3Dnetwork%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=10.201.0.0&%3D%3Droutes4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=255.255.0.0&%3D%3Droutes4%3Dvia%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=10.201.255.253&%3D%3Droutes4%3Dmtu%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=1500&%3D%3Droutes4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=ROUTING+ROUTING&%3D%3Droutes4%3Dnetwork%5B___new___%5D=&%3D%3Droutes4%3Dprefix%5B___new___%5D=&%3D%3Droutes4%3Dvia%5B___new___%5D=&%3D%3Droutes4%3Dmtu%5B___new___%5D=1500&%3D%3Droutes4%3Dcomment%5B___new___%5D=' --compressed
}


