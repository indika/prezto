function bootstrap_chive()
{
    scp /Users/indika/dev/box/ansible/bootstrap.sh chive-test:
}

function update_chive()
{
    cd /Users/indika/dev/box/mailarchive
    aup -r 52.64.172.195 . -v
    ssh root@52.64.172.195 'systemctl restart mailrelay'
}
