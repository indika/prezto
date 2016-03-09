

function nfqueue_fetch()
{
    cd /Users/indika/dev/box/tasks/nfqueue
    sc oranges:/usr/bin/nfqueue-processor .
    sc oranges:/usr/bin/nfqueue-processor-wrapper .
    sc oranges:/root/daemon-bench.py .
}


function nfqueue_build()
{
    cd /Users/indika/dev/box/tasks/nfqueue
    ss build7 "cd /home/ipiyasena/build/gplcomputerdog; hg checkout nhoad-break-netfilterqueue-out-of-ngfw-20002; cd netfilterqueue; hg build --force --unsafe"
    ss build7 "cd /home/ipiyasena/build/gplcomputerdog; hg checkout nhoad-break-netfilterqueue-out-of-ngfw-20002; cd nfqueue-processor; hg build --force --unsafe"
    ss build7 "cd /home/ipiyasena/build/gplcomputerdog/nfqueue-processor; hg build --force --unsafe"
    scp build7:/var/spool/build/user/ipiyasena/RPMS/x86_64/netfilterqueue-30.0-2.el7.centos.x86_64.rpm .
    scp build7:/var/spool/build/user/ipiyasena/RPMS/x86_64/nfqueue-processor-1.0-1.el7.centos.x86_64.rpm .
    scp netfilterqueue-30.0-2.el7.centos.x86_64.rpm lego:
    scp nfqueue-processor-1.0-1.el7.centos.x86_64.rpm lego:
    ss lego 'rpm -e netfilterqueue; rpm -Uvh netfilterqueue-30.0-2.el7.centos.x86_64.rpm'
    ss lego 'rpm -e nfqueue-processor; rpm -Uvh nfqueue-processor-1.0-1.el7.centos.x86_64.rpm'
}

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
