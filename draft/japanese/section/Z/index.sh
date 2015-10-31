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

runhaskell_koshu () {
    if [ -e cabal.sandbox.config ]; then
        cabal exec runhaskell "$@"
    else
        runhaskell "$@"
    fi
}

gen_sect () {
    runhaskell_koshu sect.hs TERM.txt ../[A-X]/README.md
    stderr "$? <- Generate judges of TERM and SECT"
}

gen_term_index () {
    koshu Z.k $1
    stderr "$? <- Generate judges of INDEX"
}

gen_term_matrix () {
    runhaskell_koshu ../Y/matrix.hs INDEX /furi /term /sects $alpha < $1
    stderr "$? <- Generate index table in markdown"
}

mkdir -p output

gen_sect                       > output/SECT.k
gen_term_index  output/SECT.k  > output/INDEX.k
gen_term_matrix output/INDEX.k > output/MATRIX.md

echo
ls -l output
