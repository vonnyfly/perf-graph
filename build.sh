#!/bin/bash
host=${HOST:-192.168.31.188}
perf record -F 99 -p $2 -g -- sleep $1
perf script | ./tools/stackcollapse-perf.pl > $3.perf-folded
./tools/flamegraph.pl $3.perf-folded > $3.svg
rm $3.perf-folded
echo "Push to host: $host"
scp $3.svg root@"$host":/var/www/html/
