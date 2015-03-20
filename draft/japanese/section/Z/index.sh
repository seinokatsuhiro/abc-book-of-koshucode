#!/bin/sh
#
#  DESCRIPTION
#    Generate term index
#
#  USAGE
#    ./index.sh
#
#  NOTE
#    Please set envvar 'KOSHU_PKGDB' when using a Cabal sandbox, e.g., 
#    export KOSHU_PKGDB=SANDBOX/GHC-PLATFORM-packages.conf.d
#

alpha=A-B-C-D-E-F-G-H-I-J-K-L-M-N-O-P-Q-R-S-T-U-V-W-X

stderr () {
    echo "$*" 1>&2
}

runhaskell_koshu () {
    if [ -z "$KOSHU_PKGDB" ]; then
        runhaskell "$@"
    else
        runhaskell -package-db --ghc-arg="$KOSHU_PKGDB" "$@"
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

gen_term_table () {
    runhaskell_koshu ../Y/table.hs INDEX /furi /term /sects $alpha < $1
    stderr "$? <- Generate index table in markdown"
}

mkdir -p output

gen_sect                      > output/SECT.k
gen_term_index output/SECT.k  > output/INDEX.k
gen_term_table output/INDEX.k > output/TABLE.md

echo
ls -l output
