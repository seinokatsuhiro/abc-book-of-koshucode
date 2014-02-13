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
    echo "** -*- koshu -*-"
    echo
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
            invoke_koshu_w "$2" ;;
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

invoke_koshu_w () {
    if which koshu-w > /dev/null ; then
        stderr "use installed koshu-w"
        koshu-w "$1"
    elif [ -x ./koshu-w ]; then
        stderr "use local koshu-w"
        ./koshu-w "$1"
    else
        stderr "skip koshu-w"
    fi
}

all > KOSHU.k

