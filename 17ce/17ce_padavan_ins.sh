#!/bin/sh
echo "installing 17ce"
if [ $# == 1 ]; then
	echo "17CE账号：$1"	
	sleep 2
else
	echo "Usage:  ./17ce_padavan_ins.sh xxx@xxx.com #xxx@xxx.com改成您的账户"
	exit 1
fi
echo 
echo "by 17CE"
rm -rf /etc/storage/17ce
rm -rf /tmp/17ce
rm  -rf 17ce*
killall -9 17ce_v3 2>/dev/null  >/dev/null
cd /tmp
wget --no-check-certificate -O 17ce_padavan_ins.sh https://blog.yulinsoft.top/17ce/17ce_padavan.sh 2>/dev/null  >/dev/null
mkdir -p /etc/storage/17ce
cp 17ce_padavan_ins.sh /etc/storage/17ce/17ce_padavan_ins.sh
chmod +x  /etc/storage/17ce/17ce_padavan_ins.sh
if grep -wq "17ce_padavan_ins.sh" /etc/storage/post_wan_script.sh; then
  /etc/storage/17ce/17ce_padavan_ins.sh $1
else
  echo "/etc/storage/17ce/17ce_padavan_ins.sh $1 &">>/etc/storage/post_wan_script.sh
  /etc/storage/17ce/17ce_padavan_ins.sh $1
fi