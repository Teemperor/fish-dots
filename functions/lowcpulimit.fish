function lowcpulimit
	set cpulimit (math "$argv[1]*10000")
cgset -r cpu.cfs_quota_us=$cpulimit lowcpu
end
