


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
    ss motor 'cd /usr/lib/python2.7/site-packages/netcon/migration; python migration_on_customer_backups.py'
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

    # sc /Users/indika/dev/box/netcon_dbs/netcon.db.date $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/netcon_dbs/netcon.db.jsracs $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/netcon_dbs/netcon.db.nbb-dev $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/netcon_dbs/netcon.db.oxcoda $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/netcon_dbs/netcon.db.thud $SITEKEY:/etc/netcon

    ss $SITEKEY 'touch /nbdebug'
}

function netcon_pry_init()
{
    cd /Users/indika/dev/box/netbox/netcon/src/netcon/migration
    aup lego pry.py
    aup lego __init__.py

    # The basic mechanics is
    #scp -P 4 /var/backups/save/absme2/netcon.db lego.safenetbox.biz:/tmp
}


function netcon_pry()
{
    cd /Users/indika/dev/box/netbox/netcon/src/netcon/migration
    aup lego pry.py
    aup lego __init__.py

    rm -f /tmp/netcon.db
    scp m:/var/backups/save/absme2/netcon.db /tmp
    scp /tmp/netcon.db l:/tmp/netcon.db

    ssh l 'cd /etc/netcon; mv netcon.db netcon.db.orig; cp /tmp/netcon.db .; chmod g+w netcon.db; chown nobody:root netcon.db; python -m netcon.migration.pry; rm netcon.db; mv netcon.db.orig netcon.db'
}


function netcon_search_networks4()
{
    ag 'networks4.*append'
    ag 'networks4.*=.*\['
    ag 'networks6.*append'
    ag 'networks6.*=.*\['
    ag 'routes4.*append'
    ag 'routes4.*=.*\['
    ag 'routes6.*append'
    ag 'routes6.*=.*\['
}

function netcon_search()
{
    cd dev/box/netbox
    ag 'netcon.objstore'
    ag 'from netcon import objstore'
}


function netcon_rename_netcon()
{
    ag 'config_netcon'
    # printf "Expecting number of"
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
    # sc $SITEKEY:/tmp/netcon.json /Users/indika/dev/box/netcon_dbs/netcon.json

    # ss $SITEKEY 'cd /usr/lib/python2.7/site-packages/netcon/test; python test_migration.py'
}

function netcon_json()
{
    SITEKEY=10.107.10.254

    ss $SITEKEY 'curl localhost:60002/config/network > /tmp/netcon.json'
    sc $SITEKEY:/tmp/netcon.json /Users/indika/dev/box/netcon_dbs/netcon.json

    ss $SITEKEY 'curl localhost:60002/config/ngfw/config/policies > /tmp/ngfw.json'
    sc $SITEKEY:/tmp/ngfw.json /Users/indika/dev/box/netcon_dbs/ngfw.json
}

function netcon_test()
{
    SITEKEY=$1

    cd ~/dev/box/netbox
    hg baup $SITEKEY ~/dev/box/netbox
    cd /Users/indika/dev/box/netbox/netcon/tests
    test_on_site $SITEKEY test_something.py
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
    sc $SITEKEY:/etc/netcon/netcon.db /Users/indika/dev/box/netcon_dbs/netcon.db.tmp
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
    curl 'http://lego.safenetbox.biz/net/edit?oid=links%2F14;bid=links%2F7' -H 'Cookie: session=+D8UOa2KQsicNpAAS8yga8zsQa4W/4cAlmP8TQ8KL1apUt8qtkWIiIxVkMdW2y98JMV+901gnrvB2oX4PHcxr5nY4InrUum+o6p8cey79mcAb4cVk34cMn9LgO+RqJLt5QlvOXDGxjZ43Ad5XIhWUg==' -H 'Origin: http://lego.safenetbox.biz' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://lego.safenetbox.biz/net/edit?oid=links%2F14;bid=links%2F7' -H 'Connection: keep-alive' --data '__formname__=ppplink&oid=links%2F14&enabled=on&advanced=on&name=PPP+Link+USB-ACM&test_pairs4=&username=bob&password=bob&phone_number=123&init_string=ATZ&auth_method=0&force_ip=10.107.10.200&update=Update&%3D%3Dnetworks4%3Dip%5B___new___%5D=&%3D%3Dnetworks4%3Dprefix%5B___new___%5D=&%3D%3Dnetworks4%3Dcomment%5B___new___%5D=&%3D%3Droutes4%3Dnetwork%5B___new___%5D=&%3D%3Droutes4%3Dprefix%5B___new___%5D=&%3D%3Droutes4%3Dmtu%5B___new___%5D=1500&%3D%3Droutes4%3Dcomment%5B___new___%5D=' --compressed

    # A delete
    #curl 'http://lego.safenetbox.biz/net/local?oid=links%2F0;flav=local' -H 'Pragma: no-cache' -H 'Origin: http://lego.safenetbox.biz' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Referer: http://lego.safenetbox.biz/net/local?oid=links%2F0;flav=local' -H 'Cookie: session=Z575hMH9Q+OYE0bLnCReIEnVJsfOO4mEawaQlqVJQvtV2Z0Quvoy1MdAR1g8XIlg2ug7u8P1ykokAS8llMGfGAmWjmYoevm22FmYbI0vQFQNy/CbgV90Av/HxKbkh4hTC2tA9Gz5sjGQVz+is+nHmA==' -H 'Connection: keep-alive' --data '__formname__=link&oid=links%2F0&flav=local&dhcp_start=192.168.0.100&dhcp_end=192.168.0.200&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=10.233.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=Old+NBB&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=10.12.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=Current+NBB&%3D%3Dnetworks4%3Ddel%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=on&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=10.201.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=New+NEW+YO+YO+NBB&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=10.202.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=New+YOYOMAMA+NBB&%3D%3Dnetworks4%3Dip%5B___new___%5D=&%3D%3Dnetworks4%3Dprefix%5B___new___%5D=&%3D%3Dnetworks4%3Dcomment%5B___new___%5D=&networks_update=Update&%3D%3Droutes4%3Dnetwork%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=10.201.0.0&%3D%3Droutes4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=255.255.0.0&%3D%3Droutes4%3Dvia%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=10.201.255.253&%3D%3Droutes4%3Dmtu%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=1500&%3D%3Droutes4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=ROUTING+ROUTING&%3D%3Droutes4%3Dnetwork%5B___new___%5D=&%3D%3Droutes4%3Dprefix%5B___new___%5D=&%3D%3Droutes4%3Dvia%5B___new___%5D=&%3D%3Droutes4%3Dmtu%5B___new___%5D=1500&%3D%3Droutes4%3Dcomment%5B___new___%5D=' --compressed
}


