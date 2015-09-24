

function test_unpackaged()
{

    cd /Users/indika/dev/box/internal/nb-devtools/modules/nbdev/hg
    sc unpackaged_indika.py ipiyasena@build7:/home/ipiyasena/internal_dev/nb-devtools/modules/nbdev/hg
    aup -r lego . -v

    ss lego 'python /usr/local/internal/nb-devtools/modules/nbdev/hg/unpackaged_indika.py'

}
