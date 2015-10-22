

function netlog_test()
{
    sc /Users/indika/dev/box/sandbox/log_parsers/data/netlogsquid/netlogsquid/proxy.1444281907 lego:/var/cache/squid
    aup lego '/Users/indika/dev/box/netbox/netlog2/src/modules/netlogsquid.py'
    ss lego 'systemctl restart netlogsquid'
}


function download_data()
{

    rm -rf /Users/indika/dev/box/data/wednesday/netlogsquid
    sc -r nbb-dev:/var/tmp/netlogsquid /Users/indika/dev/box/data/wednesday/netlogsquid

    rm -rf /Users/indika/dev/box/data/wednesday/nf_conntrack
    sc -r nbb-dev:/var/tmp/nf_conntrack /Users/indika/dev/box/data/wednesday/nf_conntrack

    rm -rf /Users/indika/dev/box/data/wednesday/traffic_dump
    sc -r nbb-dev:/var/tmp/traffic_dump /Users/indika/dev/box/data/wednesday/traffic_dump

    # /var/cache/nfnetlog/

    sc nbb-dev:/var/log/squid/access.log /Users/indika/dev/box/data/wednesday/access.log
    sc nbb-dev:/var/log/squid/access.log /Users/indika/dev/box/sandbox/log_parsers/data/access.log.1
    sc nbb-dev:/var/log/squid/access.log /Users/indika/dev/box/sandbox/log_parsers/data/access.log.2
    sc nbb-dev:/var/log/squid/access.log /Users/indika/dev/box/sandbox/log_parsers/data/access.log.3
    sc nbb-dev:/var/log/squid/access.log /Users/indika/dev/box/sandbox/log_parsers/data/access.log.4

    sc nbb-dev:/var/log/squid/cache-largeobjectcache.log /Users/indika/dev/box/data/wednesday/cache-largeobjectcache.log
}
