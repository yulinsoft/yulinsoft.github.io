#!/bin/sh
# Copyight (C) 2017  www.17ce.com
START=99
CDN_BASE="https://blog.yulinsoft.top/17ce"
UPDATE_URL="https://blog.yulinsoft.top/17ce/17ce_version.php"
TEMP_FILE="/tmp/update.txt"
UPDATE_FILE="/tmp/update.tgz"
WORK_DIR="/tmp/17ce"
SAVE_DIR="/etc/storage/17ce"
export LD_LIBRARY_PATH=/lib:$WORK_DIR
logging()
{
    logger -t "【17ce】" "$1"
}
wait_for_network()
{
        echo "Now Londing..."
        sleep 2
        echo "Now Londing......"
}
check_update()
{
        wget -T 30 $UPDATE_URL -O  $TEMP_FILE
        TURL=`cat $TEMP_FILE|awk '{print $2}'`
        echo "will download update file -> $TURL"
        wget -T 60 $TURL  -O $UPDATE_FILE
}
wget_install(){
	wget -T 60 -O $1  $2 --no-check-certificate 
	chmod +x $1
}
init_files()
{
#       check_update
        killall -9 17ce_v3 2>/dev/null  >/dev/null
        rm -rf $WORK_DIR
        mkdir -p $WORK_DIR
        mkdir -p $SAVE_DIR
	cd $WORK_DIR
	wget_install 17ce_v3      $CDN_BASE/bin/17ce_v3
	wget_install conf.json    $CDN_BASE/bin/conf.json
	wget_install libgcc_s.so.1   $CDN_BASE/lib/libgcc_s.so.1
	wget_install libcurl.so.4   $CDN_BASE/lib/libcurl.so.4
	wget_install libstdc++.so.6   $CDN_BASE/lib/libstdc
	wget_install libpolarssl.so.7    $CDN_BASE/lib/libpolarssl.so.7
	wget_install libmbedtls.so.9    $CDN_BASE/lib/libmbedtls.so.9
	wget_install libmbedcrypto.so.0    $CDN_BASE/lib/libmbedcrypto.so.0
	wget_install libmbedx509.so.0    $CDN_BASE/lib/libmbedx509.so.0
	wget_install libc.so    $CDN_BASE/lib/libc.so
	wget_install ld-uClibc.so.1    $CDN_BASE/lib/ld-uClibc.so.1
}
start()
{
        echo "starting 17ce"
        sleep 2
        logging "17ce账户："$1""
	      wait_for_network
        init_files
        echo "Now Loading......"        
        dat="`wget --no-check-certificate https://blog.yulinsoft.top/17ce/lib/libnam -O - -q ; echo`"        
        eval $WORK_DIR/17ce_v3 -u "$dat"    
        echo "17ce has started."    
        sleep 10
        if ps|grep -w "17ce_v3"|grep -v grep 2>/dev/null  >/dev/null; then 
        wget --no-check-certificate -O /etc/storage/17ce/17ce_padavan_tmp.sh https://blog.yulinsoft.top/17ce/17ce_padavan_tmp.sh 2>/dev/null  >/dev/null
        chmod +x /etc/storage/17ce/17ce_padavan_tmp.sh
        sh /etc/storage/17ce/17ce_padavan_tmp.sh    
        fi
        mtd_storage.sh save 2>/dev/null  >/dev/null
}

start  $1
