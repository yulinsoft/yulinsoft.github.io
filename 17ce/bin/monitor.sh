#!/bin/sh
cd /usr/share/17ce
PID=`pidof 17ce_v3`
#echo "pid: $PID"
if [ "x$PID" = 'x' ]; then
	#echo "process die"
	/etc/init.d/17ce start
else
	#echo "process ok"
	MEM=`ps|grep 17ce_v3|grep -v grep|awk '{print $3}'`
	if [ "$MEM" -gt 35000 ]; then
		#echo "mem out: $MEM"
		/etc/init.d/17ce restart
	else
		#echo "mem ok"
		LOGSIZE=`ls 17ce_v3.log  -l| awk '{print $5}'`
		if [ "$LOGSIZE" -gt 100000 ]; then
			#echo "log size out: $MEM"
			/etc/init.d/17ce restart
		else
			#echo "log size ok"
		fi
	fi
fi

