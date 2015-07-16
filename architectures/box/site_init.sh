function site_init()
{
    SITEKEY=$1
    cd /Users/indika/dev/box/netbox
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nb-test/py.test

    cd /Users/indika/dev/box/safechat
    aup -r $SITEKEY /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/test
    aup $SITEKEY /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/conftest.py

}
