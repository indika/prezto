function site_init()
{
    SITEKEY=$1
    cd /Users/indika/dev/box/netbox
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nb-test/py.test -v

    cd /Users/indika/dev/box/safechat
    aup -r $SITEKEY /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/test -v
    aup $SITEKEY /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/conftest.py -v

    scp /Users/indika/dev/box/docs/box.lego.bash_rc.txt ${SITEKEY}:.bashrc
}
