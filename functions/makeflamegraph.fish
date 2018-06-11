function makeflamegraph
	perf record -F 99 -a -g -- $argv
perf script | stackcollapse-perf > /tmp/out.perf-folded
flamegraph /tmp/out.perf-folded > /tmp/flamegraph.svg
google-chrome-stable /tmp/flamegraph.svg
end
