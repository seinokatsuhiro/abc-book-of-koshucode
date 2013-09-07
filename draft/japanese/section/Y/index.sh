#!/bin/sh
#
#  DESCRIPTION
#    Generate operator index
#
#  USAGE
#    ./index.sh
#

github=https://github.com/seinokatsuhiro/abc-of-koshucode
alpha=A-B-C-D-E-F-G-H-I-J-K-L-M-N-O-P-Q-R-S-T-U-V-W-X-Y-Z

stderr () {
    echo "$*" 1>&2
}

gen_link () {
    stderr "Generate links in markdown"
    for a in `echo $alpha | tr - ' '` ; do
        echo "[$a]: $github/blob/master/draft/japanese/section/$a"
    done
}

gen_koshu_element () {
    stderr "Generate judges of KOSHU-RELMAP-ROP"
    (cd .. ; koshu --element [A-Z]/*.k)
}

gen_rop_index () {
    stderr "Generate judges of INDEX"
    koshu $1 $2
}

gen_rop_table () {
    stderr "Generate index table in markdown"
    runhaskell table.hs INDEX /order /rop /sects $alpha < $1
}

mkdir -p output

gen_link                              > output/LINK.md
gen_koshu_element                     > output/ELEMENT.k
gen_rop_index Y.k  output/ELEMENT.k   > output/ROP-INDEX.k
gen_rop_index Y2.k output/ROP-INDEX.k > output/INDEX.k
gen_rop_table output/INDEX.k          > output/TABLE.md

