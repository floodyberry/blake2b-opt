#!/bin/bash

function usage {
	echo "usage:   ./check-x86.sh [x86,sse2,ssse3,xop,avx] [32,64]"
	echo ""
}

function check {
	if [ ! -f blake2b_blocks_$1-$2.s ] ; then
	        echo "blake2b_blocks_"$1"-"$2".s doesn't exist to test!"
	        exit 1;
	fi

	echo "checking "$1", "$2" bits, single implementation"
	gcc blake2b-example.c test-x86.c -Dblake2b_blocks=blake2b_blocks_$1 blake2b_blocks_$1-$2.s -O3 -o blake2b_test_$1 -m$2 2>/dev/null
	local RC=$?
	if [ $RC -ne 0 ]; then
		echo "blake2b_blocks_$1-$2 failed to compile"
		return
	fi
	./blake2b_test_$1
	rm -f blake2b_test_$1

	echo "checking against aggregate implementation"
        gcc blake2b-example.c test-x86.c -Dblake2b_blocks=blake2b_blocks_$1 blake2b_blocksopt_x86-$2.s -O3 -o blake2b_test_$1 -m$2 
        local RC=$?
        if [ $RC -ne 0 ]; then
                echo "blake2b_blocksopt_x86-$2 failed to compile"
                return
        fi
        ./blake2b_test_$1
	rm -f blake2b_test_$1
}

case $2 in
	32);;
	64);;
	"") usage; exit 1;;
	*) usage; echo "arch must be 32 or 64 bits!"; exit 1;;
esac

check $1 $2
