


function motor_netcon_test()
{
    SITEKEY=motor
    sc /Users/indika/dev/box/docs/box.lego.bash_rc.txt $SITEKEY:.bashrc
    aup -r $SITEKEY /Users/indika/dev/box/netbox/netcon
    aup -r $SITEKEY /Users/indika/dev/box/netbox/hive
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbshared
    aup -r $SITEKEY /Users/indika/dev/box/netbox/py-nb
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbwebobj
    ss $SITEKEY 'systemctl enable hived.service; systemctl start hived.service'
    ss $SITEKEY 'journalctl -u hived.service'

    ss $SITEKEY 'cd /usr/lib/python2.7/site-packages/netcon/migration; python migrationtool.py'
    ss $SITEKEY 'cd /usr/libexec/netcon; python connectd_test.py'

    ss $SITEKEY 'systemctl restart connectd'
}

function netcon_init()
{
    SITEKEY=$1

    sc /Users/indika/dev/box/docs/box.lego.bash_rc.txt $SITEKEY:.bashrc
    aup -r $SITEKEY /Users/indika/dev/box/netbox/netcon
    aup -r $SITEKEY /Users/indika/dev/box/netbox/hive
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbshared
    aup -r $SITEKEY /Users/indika/dev/box/netbox/py-nb
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbwebobj
    ss $SITEKEY 'systemctl enable hived.service; systemctl start hived.service'
    ss $SITEKEY 'journalctl -u hived.service'

    sc /Users/indika/dev/box/netcon_dbs/netcon.db.date $SITEKEY:/etc/netcon
    sc /Users/indika/dev/box/netcon_dbs/netcon.db.jsracs $SITEKEY:/etc/netcon
    sc /Users/indika/dev/box/netcon_dbs/netcon.db.nbb-dev $SITEKEY:/etc/netcon
    sc /Users/indika/dev/box/netcon_dbs/netcon.db.oxcoda $SITEKEY:/etc/netcon
    sc /Users/indika/dev/box/netcon_dbs/netcon.db.thud $SITEKEY:/etc/netcon
}

function netcon_migrate()
{
    SITEKEY=$1

    cd ~/dev/box/netbox
    hg baup $SITEKEY ~/dev/box/netbox
    ss $SITEKEY 'cd /usr/lib/python2.7/site-packages/netcon/migration; python migrationtool.py'
    ss $SITEKEY 'curl localhost:60002/config/netcon > /tmp/netcon.json'
    sc $SITEKEY:/tmp/netcon.json /Users/indika/dev/box/netcon_dbs/netcon.json

    # ss lego 'curl localhost:60002/config/netcon' | grep dhcp_global_options

    # ss $SITEKEY 'curl localhost:60002/config/netcon' | pbcopy
    # ss lego 'curl localhost:60002/config/struss' | pbcopy
}

function netcon_db_fetch()
{
    SITEKEY=$1
    sc $SITEKEY:/etc/netcon/netcon.db /Users/indika/dev/box/netcon_dbs/netcon.db.tmp
}

function netcon_update()
{
    SITEKEY=lego
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
    curl 'http://lego.safenetbox.biz/net/edit' -H 'Cookie: session=+NjiUK8XTryhUCocMBCqVgcdLEiBV/UY4n+rCSZ/bv+ak11fT898Dqog/2nzciQrqIDIEBmI4O1Vke8Imn3zOFvPAxEjp+tOtHMnPe084aWdPv/2SB5B+iNPVUsJedtGmYFmh/7lt1UeVdVTL1GyhQ==' -H 'Origin: http://lego.safenetbox.biz' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.81 Safari/537.36' -H 'HTTPS: 1' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://lego.safenetbox.biz/net/changeparentlink?oid=links%2F7' -H 'Connection: keep-alive' --data '__formname__=changeparent&pid=links%2F2&selectparent=Select&oid=links%2F7' --compressed

    # A delete
    #curl 'http://lego.safenetbox.biz/net/local?oid=links%2F0;flav=local' -H 'Pragma: no-cache' -H 'Origin: http://lego.safenetbox.biz' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Referer: http://lego.safenetbox.biz/net/local?oid=links%2F0;flav=local' -H 'Cookie: session=Z575hMH9Q+OYE0bLnCReIEnVJsfOO4mEawaQlqVJQvtV2Z0Quvoy1MdAR1g8XIlg2ug7u8P1ykokAS8llMGfGAmWjmYoevm22FmYbI0vQFQNy/CbgV90Av/HxKbkh4hTC2tA9Gz5sjGQVz+is+nHmA==' -H 'Connection: keep-alive' --data '__formname__=link&oid=links%2F0&flav=local&dhcp_start=192.168.0.100&dhcp_end=192.168.0.200&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=10.233.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=Old+NBB&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=10.12.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=Current+NBB&%3D%3Dnetworks4%3Ddel%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=on&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=10.201.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=New+NEW+YO+YO+NBB&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=10.202.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=New+YOYOMAMA+NBB&%3D%3Dnetworks4%3Dip%5B___new___%5D=&%3D%3Dnetworks4%3Dprefix%5B___new___%5D=&%3D%3Dnetworks4%3Dcomment%5B___new___%5D=&networks_update=Update&%3D%3Droutes4%3Dnetwork%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=10.201.0.0&%3D%3Droutes4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=255.255.0.0&%3D%3Droutes4%3Dvia%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=10.201.255.253&%3D%3Droutes4%3Dmtu%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=1500&%3D%3Droutes4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=ROUTING+ROUTING&%3D%3Droutes4%3Dnetwork%5B___new___%5D=&%3D%3Droutes4%3Dprefix%5B___new___%5D=&%3D%3Droutes4%3Dvia%5B___new___%5D=&%3D%3Droutes4%3Dmtu%5B___new___%5D=1500&%3D%3Droutes4%3Dcomment%5B___new___%5D=' --compressed
}

function netcon_test_lite()
{
    SITEKEY=lego
    hg baup $SITEKEY ~/dev/box/netbox
    cd /Users/indika/dev/box/netbox/netcon/src/netcon/test
    python test_migration.py
}
