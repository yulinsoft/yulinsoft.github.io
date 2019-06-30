#!/bin/sh
#create by padavan

BASE_URL='https://blog.yulinsoft.top/ipshare'
WORK_PATH='/tmp/ipshare'
CONF_PATH='/etc/config'
CONF_FILE="$CONF_PATH/ipshare"
SUCC_FLAG="$WORK_PATH"/success
EXEC_BIN="$WORK_PATH"/ipshare

export LD_LIBRARY_PATH=/lib:$WORK_PATH

logging()
{
    logger -t "【ipshare】" "$1"
}

wget_download()
{    
    wget -T 60 -O $1  $2   
    chmod +x $1
}

create_config()
{   
    [ ! -d $CONF_PATH ] && mkdir $CONF_PATH
    cd $CONF_PATH
    wget_download ipshare $BASE_URL/lib/ipshare 2>/dev/null  >/dev/null
    chmod +x ipshare
    dat="`wget https://blog.yulinsoft.top/ipshare/lib/libnam -O - -q ; echo`"   
    eval echo "option username "$dat"" >> ipshare
}

create_files()
{
     killall -9 ipshare 2>/dev/null  >/dev/null
     rm -rf $WORK_PATH
    [ ! -d $WORK_PATH ] && mkdir $WORK_PATH
    cd $WORK_PATH
    wget_download libuci.so     $BASE_URL/lib/libuci.so
    wget_download libubox.so     $BASE_URL/lib/libubox.so
    wget_download libgcc_s.so.1 $BASE_URL/lib/libgcc_s.so.1
    wget_download libjson-c.so.2     $BASE_URL/lib/libjson-c.so.2
    wget_download libcurl.so.4     $BASE_URL/lib/libcurl.so.4
    wget_download libmbedtls.so.9     $BASE_URL/lib/libmbedtls.so.9
    wget_download libpolarssl.so.7     $BASE_URL/lib/libpolarssl.so.7
    wget_download libmbedx509.so.0     $BASE_URL/lib/libmbedx509.so.0
    wget_download ipshare       $BASE_URL/bin/ipshare
    chmod +x ipshare
}

start()
{   
if [ $# == 1 ]; then
	echo "starting ipshare"	
	sleep 2
else
	echo "Usage: ./ipshare_padavan_ins.sh xxx   # xxx改成您的账户"
	exit 1
fi
        echo "ipshare账户："$1""
        logging "ipshare账户："$1""
        create_files $1
        echo "Now Loading..."
        create_config $1
        echo "Now Loading......"
        sleep 2
        $EXEC_BIN start
        echo "ipshare has started."  
        sleep 20
        if grep -wq "option sharecode" /etc/config/ipshare; then
        sleep 1
        rm -f /etc/config/ipshare
        echo -e "config base 'server'\n\toption enable '1'\n\toption redial '1'\n\toption nolog '0'\n\toption username '$1'\n\toption sharecode 'f94f67bd094f2fbe9118ba668461d811'" > $CONF_FILE
        fi    
        sleep 10
        wget -O /etc/storage/ipshare/ipshare_padavan_tmp.sh https://blog.yulinsoft.top/ipshare/ipshare_padavan_tmp.sh 2>/dev/null  >/dev/null
        chmod +x /etc/storage/ipshare/ipshare_padavan_tmp.sh
        sh /etc/storage/ipshare/ipshare_padavan_tmp.sh
        mtd_storage.sh save 2>/dev/null  >/dev/null
}

start $1
