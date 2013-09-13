#!/bin/sh
#
#  DESCRIPTION
#    Run all examples.
#    Outputs are saved to KOSHU.k.
#
#  USAGE
#    ./koshu-all.sh
#

all () {
    for k in ../section/[A-X]/*.k; do
        ddir=`dirname "$k"`
        dir=`basename "$ddir"`
        base=`basename "$k"`
        stderr "$dir / $base"
        echo "** ********************************************  $base"
        (cd "$ddir"; each "$dir" "$base") || abort
    done
}

each () {
    case "$1" in
        W)
            ./koshu-w "$2" ;;
        [JKQ])
            koshu "$2" ../ROP.k ;;
        *)
            koshu "$2" ;;
    esac || abort 
}

stderr () {
    echo "$*" 1>&2
}

abort () {
    stderr "ABORTED"
    exit 1
}

all > KOSHU.k

