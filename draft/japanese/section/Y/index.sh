#!/bin/sh
#
#  DESCRIPTION
#    Generate operator index
#
#  USAGE
#    ./index.sh
#
#  NOTE
#    Please set envvar 'KOSHU_PKGDB' when using a Cabal sandbox, e.g., 
#    export KOSHU_PKGDB=SANDBOX/GHC-PLATFORM-packages.conf.d
#

github=https://github.com/seinokatsuhiro/abc-of-koshucode
alpha=A-B-C-D-E-F-G-H-I-J-K-L-M-N-O-P-Q-R-S-T-U-V-W-X-Y-Z

stderr () {
    echo "$*" 1>&2
}

runhaskell_koshu () {
    if [ -e cabal.sandbox.config ]; then
        cabal exec runhaskell "$@"
    else
        runhaskell "$@"
    fi
}

gen_link () {
    stderr "Generate links in markdown"
    for a in `echo $alpha | tr - ' '` ; do
        echo "[$a]: $github/blob/master/draft/japanese/section/$a"
    done
}

gen_koshu_element () {
    echo "-*- koshu -*-"
    ( cd ..
    for k in [A-Z]/*.k; do
        echo
        echo "** **********************  $k"
        echo

        if [ $k = W/W.k ]; then
            koshu-w --element $k
        else
            koshu --element $k
        fi
        stderr "$? <- Generate judges of KOSHU-RELMAP-ROP for $k"
    done
    )
}

gen_rop_index () {
    koshu $1 $2
    stderr "$? <- Generate judges of INDEX"
}

gen_rop_table () {
    runhaskell_koshu table.hs INDEX /order /rop /sects $alpha < $1
    stderr "$? <- Generate index table in markdown"
}

mkdir -p output

gen_link                              > output/LINK.md
gen_koshu_element                     > output/ELEMENT.k
gen_rop_index Y.k  output/ELEMENT.k   > output/ROP-INDEX.k
gen_rop_index Y2.k output/ROP-INDEX.k > output/INDEX.k
gen_rop_table output/INDEX.k          > output/TABLE.md

