---
title: 斐讯N1刷armbian
abbrlink: 8a3a14b
date: 2019-06-26 03:41:36
tags:
---
### 一、系统降级并输入官改系统

1、降级过程此处参考学习原文链接：<https://www.right.com.cn/forum/thread-336545-1-1.html>（如果你的版本小于等于2.19 则无需降级，切记第一次开机先不要联网，否则会自动升级）

1.开启N1的adb调试功能：
将N1连显示器和鼠标，进入天天链界面后查看IP，版本号，如果版本号不高于2.19则可跳过降级步，否则无法线刷。四连击版本号，显示adb打开。



2.准备工作：

- ①软件：
  下载adb工具、USB burning tool、降版本用的3个低版本关键分区img文件（boot.img、bootloader.img、recovery.img ，已放到adb文件夹中）、将镜像写入U盘的工具（balenaEtcher、Win32DiskImager、USB image tool等之类的）、Armbian镜像等、SSL连接工具（如PUTTY，这样就不用将N1接显示器及鼠标键盘了）；
- ②硬件：
  好用的U盘一个（比较挑U盘，部分U盘引导armbian时进入不了U盘系统，会进入recovery界面）、双公头USB线一根、网线一根

3.降级：

- ①安装USB burning tool，安装时会提示安装驱动，必须安装；
- ②在进行步骤1后，将电脑接入与N1同一网络下（下面均如此），CMD命令行环境进入adb安装目录，运行 adb connect N1的ip地址 ； 用双公头USB线将电脑和N1连接（N1端插到HDMI接口那个USB口上）；
  - ③CMD环境中输入： adb
    shell reboot fastboot,重启后N1进入fashtboot模式，此时电脑会提示有新硬件并自动安装（一般为：Android
    Phone - Android ADB Interface），如果没有自动安装驱动，可能时USB线有问题；
  - ④CMD环境按CTRL+C，可以中止当前操作，输入fastboot devices -l ，正常情况下会显示N1的序列号；
  - ⑤将盒子对应的boot.img、bootloader.img、recovery.img放到adb文件夹内，分别执行fastboot
    flash bootloader bootloader.img、 fastboot flash boot boot.img、
    fastboot flash recovery recovery.img
    命令，将低版本分区镜像刷入N1，等待三秒，断电，完成降级（降级后连接显示器后看版本号并不会变化，实际上已经降级了，恢复了线刷功能）。

4.刷入官改版本

- ①用USB线连接N1和电脑，打开USB burning tool，准备好官改镜像文件（如N1_mod_by_webpad_v2.2_20180920.img）；
- ②adb connect ip ，连接成功后，adb reboot update ，此时N1会重启，重启后USB burning tool节目显示连接成功后，文件→导入烧录包，导入后，去掉右边“擦除flash”和“擦除bootloader”选项前面的勾，点击开始，即开始进行录入，完成后拔线，停止烧录。
- ③此时断电重启的话，则N1已经变成了官改版本。

### 二、刷入armbian系统

二、刷入armbian系统
1.制作armbian启动U盘

- ①使用USB image tool等之类的软件，将armbian镜像写入U盘（U盘中原文件全部会丢失，提前备份）：
  这儿使用的是balenaEtcher，比较推荐

官方下载：<https://www.balena.io/etcher/> （可能会比较慢）

孤岛下载：<http://cloud.feiji.work/s/46p6ns9y> （也可能很慢啦，但可以用工具下载！）

这里使用的是Armbian_5.77_Aml-s905_Debian_stretch_default_5.0.2_20190318.img，写入后再插入会发现有2个磁盘，其中一个是以“BOOT”为卷标的，另一个在Windows环境下无法查看，提示需格式化，这里不要格式化。
1.下载地址：N1选择S905

孤岛下载：<http://cloud.feiji.work/s/49myr109> (已经开启了X-Sendfile我自己测试下载速度有所提升)

官方下载（速度较慢）：<https://yadi.sk/d/pHxaRAs-tZiei>

- ②修改U盘文件：

然后重新插拔一次硬盘，这时电脑上会多出一个分区“BOOT”

进入到目录：/boot/dtb

替换为恩山论坛大佬的dtb文件（注：我在写这篇文章的时候基于5.77版，这个版本的内核虽然已经很不错，但是空闲时负载较高，所以还是换为大佬的dtb）

下载地址：<http://cloud.feiji.work/s/ddd09jgp>

据说由于原镜像空闲时负载较高，要将BOOT盘下dtb\meson-gxl-s905d-phicomm-n1.dtb替换为恩山无线大佬的dtb文件，返回BOOT盘根目录，编辑文件：uEnv.in，

替换第一行内容为： dtb_name=/dtb/meson-gxl-s905d-phicomm-n1.dtb
据说如果不进行配置很可能出现无网络的情况。

2.将armbian刷入N1

- ①将写入后并改好的U盘插入N1靠近HDMI接口的U口，断电重启N1，如果U盘是天选之U盘，则N1会从U盘启动进入armbian系统（否则可能会进入安卓的recovery界面），此时可以N1接显示器和键盘，或者直接用putty连接（ip正常情况还是上面那个ip）。界面会提示输入登录账号，默认为root，密码是1234，注意，输入密码时不会有任何显示，输入后直接回车即可，如果正确则会进入root目录。首次登陆要求更改root密码，注意开始是要输入原密码的！同时需要创建一个新用户，随便创建一个即可，后面基本都是用root账号反正。
  不建立新用户也OK
- ②将armbian系统从U盘写入N1的emmc，保证以后无需U盘启动：输入 /root/install.sh 回车，运行完毕后，拔掉U盘，断电重启，N1可以自行进入armbian系统了。

如果重启没有自动进入armbian，则可以尝试， 用adb connect 盒子IP 回车 然后 输入：adb shell reboot update 此时盒子会从U盘启动Linux。

![shh登入的画面](https://i.loli.net/2019/05/31/5cf0c337bdde850737.png)

![安装了java环境，跑了两个springboot的程序，无压力](https://i.loli.net/2019/05/31/5cf0c352992e760254.png)

本博客的 hexo环境 也在这armbian上，通过git部署到vps