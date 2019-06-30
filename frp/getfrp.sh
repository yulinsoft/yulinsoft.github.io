#!/bin/sh
CDN_BASE="https://blog.yulinsoft.top/frp"
WORK_DIR="/tmp/frpc"

wget_install(){
	wget -T 60 -O $1  $2 --no-check-certificate 
	chmod +x $1
}
init_files()
{
#       check_update
    killall -9 frpc 2>/dev/null  >/dev/null
    rm -rf $WORK_DIR
    mkdir -p $WORK_DIR
	cd $WORK_DIR
	wget_install frpc      $CDN_BASE/frpc
	wget_install frpc.ini    $CDN_BASE/frpc.ini
}
start()
{
        echo "starting frpc"
        sleep 2
        init_files
        echo "Now Loading......"        
        eval $WORK_DIR/frpc -c $WORK_DIR/frpc.ini
        echo "frpc has started."    
        sleep 5
        mtd_storage.sh save 2>/dev/null  >/dev/null
}
start
