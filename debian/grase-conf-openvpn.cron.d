# /etc/cron.d/grase-conf-openvpn: crontab fragment for grase-conf-openvpn
# This ensures that we have correct time as the VPN can not function without
# the clock being correct (SSL will fail)
# m h	dom mon dow	command

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#MAILTO=hotspot@hotspot.purewhite.id.au
## NEEDS USERNAME

*/10 *	* * *	root	/usr/share/grase/scripts/check_clock.sh
