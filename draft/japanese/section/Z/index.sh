#!/bin/sh
#
#  DESCRIPTION
#    Generate term index
#
#  USAGE
#    ./index.sh
#

alpha=A-B-C-D-E-F-G-H-I-J-K-L-M-N-O-P-Q-R-S-T-U-V-W-X

stderr () {
    echo "$*" 1>&2
}

gen_sect () {
    stderr "Generate judges of TERM and SECT"
    runhaskell sect.hs TERM.txt ../[A-X]/*.md
}

gen_term_index () {
    stderr "Generate judges of INDEX"
    koshu Z.k $1
}

gen_term_table () {
    stderr "Generate index table in markdown"
    runhaskell ../Y/table.hs INDEX /furi /term /sects $alpha < $1
}

mkdir -p output

gen_sect                      > output/SECT.k
gen_term_index output/SECT.k  > output/INDEX.k
gen_term_table output/INDEX.k > output/TABLE.md

