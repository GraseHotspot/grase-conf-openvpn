#!/bin/bash

## This script checks if time is before this script was last modified, and if it is, then we use ntpdate to set the clock
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
[ `date +%s` -lt `stat -c %Y $0` ] && (
	echo "Time appears to be in the past, attempting to update the clock"
	date
	ntpdate -u pool.ntp.org || true
	/etc/init.d/ntp restart || true
	date
)

