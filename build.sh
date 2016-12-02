#!/bin/bash
perf record -F 99 -p $2 -g -- sleep $1
perf script | ./tools/stackcollapse-perf.pl > $3.perf-folded
./tools/flamegraph.pl $3.perf-folded > $3.svg
rm $3.perf-folded
