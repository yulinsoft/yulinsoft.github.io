---
title: 如何编译自己需要的 OpenWrt 固件
tags: OpenWrt
abbrlink: 7ec7b2eb
date: 2019-05-03 21:17:01
categories: OpenWrt
---
### 注意：

1. 不要用root用户git和编译！！！
2. 国内用户编译前最好准备好梯子
3. 默认登陆IP 192.168.1.1,密码password

### 编译命令如下:
1. 首先装好Ubuntu 64bit，推荐Ubuntu 14 LTS x64
2. 命令行输入sudo apt-get update，然后输入
``` bash
sudo apt-get install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils
```
<!--more-->
编译amule需要安装额外的包
> autoconf automake libtool autopoint


3.克隆代码
``` bash
git clone https://github.com/coolsnowwolf/lede
```
4. 命令下载好源代码，然后cd lede进入目录
``` bash
  ./scripts/feeds update -a
  ./scripts/feeds install -a
  make menuconfig
```

 

5.最后选好你要的路由，输入
``` bash
make -j1 V=s
```
（-j1后面是线程数。第一次编译推荐用单线程，国内请尽量全局科学上网）即可开始编译你要的固件了。

 

本套代码保证肯定可以编译成功。里面包括了R9所有源代码，包括IPK的。