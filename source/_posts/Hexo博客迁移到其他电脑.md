---
title: Hexo博客迁移到其他电脑
date: 2019-05-05 09:23:42
tags: hexo
---

### 安装hexo博客必要的软件

下载安装Git客户端
安装node js

### 恢复ssh配置

回到你的git bash中

##### 配置git用户名

`$ git config --global user.name "yourname"`
`$ git config --global user.email "youremail"`

这里的yourname输入你的GitHub用户名，youremail输入你GitHub的邮箱。这样GitHub才能知道你是不是对应它的账户。

可以用以下两条，检查一下你有没有输对

`$ git config user.name`
`$ git config user.email`

##### 恢复ssh密钥

将原电脑备份的.ssh文件夹复制到当前用户目录下，一般为“C:\Users\用户名”下。
ssh，简单来讲，就是一个秘钥，其中，id_rsa是你这台电脑的私人秘钥，不能给别人看的，id_rsa.pub是公共秘钥，可以随便给别人看。把这个公钥放在GitHub上，这样当你链接GitHub自己的账户时，它就会根据公钥匹配你的私钥，当能够相互匹配时，才能够顺利的通过git上传你的文件到GitHub上。
<!--more-->
继续回到你的git bash中，
输入

`$ cd ~/.ssh`

检查是否由.ssh的文件夹

输入ls，列出该文件下的内容。下图说明存在

输入

`$ eval "$(ssh-agent -s)"`

添加密钥到ssh-agent

再输入

`$ ssh-add ~/.ssh/id_rsa`

添加生成的SSH key到ssh-agent

登录Github，点击头像下的settings，添加ssh，因为原系统已经添加过了，这里就不用添加了。

输入ssh -T git@github.com，测试添加ssh是否成功。如果看到Hi后面是你的用户名，就说明成功了

##### 常见问题：

假如ssh-key配置失败，那么只要以下步骤就能完全解决

首先，清除所有的key-pair
`$ ssh-add -D`
`$ rm -r ~/.ssh`
删除你在github中的public-key

重新生成ssh密钥对
`$ ssh-keygen -t rsa -C "xxx@xxx.com"`

接下来正常操作
在github上添加公钥public-key:
1、首先在你的终端运行 xclip -sel c ~/.ssh/id_rsa.pub将公钥内容复制到剪切板
2、在github上添加公钥时，直接复制即可
3、保存
在终端 

`$ ssh -T git@github.com`

### 备份原文件

##### 需要转移的文件有：

> **文件(夹)	         说明**
> scaffolds/	     博客文章模板
> source/	         所有的博客文章
> themes/	        网站主题
> .gitignore	      push时需忽略的文件
> _config.yml	   站点配置文件
> package.json    依赖包的名称和版本号

由于配置文件和主题文件需要经常更改，采用github创建博客分支的方式进行备份。

##### 创建分支

克隆github上上生成的静态文件到hexo文件夹中

git clone https://github.com/yourname/xxxx.github.io.git hexo
克隆后将除.git文件外其他所有文件删除。主要是为了得到版本管理文件夹.git。

.git文件为隐藏文件，可直接将可见文件全部删除

将备份的原文件复制到此文件夹。若文件夹是从github克隆，则需要删除主题文件中的版本控制文件夹,以next主题为例：

`$ rm -rf thems/next/.git*`
创建名为hexo的分支

`$ git checkout -b hexo`
保存所有文件到暂存区

`$ git add --all`

##### 提交变更

`$ git commit -m "hexo-2"`
提交变更时报错：

根据提示配置。

推送分支到github,并用–set-upstream与origin创建关联，将hexo设置为默认分支

`$ git push --set-upstream origin hexo`

### 迁移

以后在其他电脑上写博客，直接将分支克隆下来。再使用npm install安装依赖。

`$ git clone -b hexo https://github.com/yourname/xxx.github.io.git myblog`

`$ cd myblog`

`$ npm install`

### 发表文章

##### 新建文章

`$ hexo n "xxx"`

注意：需要使用git push把源文件推到分支上

`$ git add .`
`$ git commit -m "xxxx"`
`$ git push origin hexo`

##### 部署文章

`$ hexo d -g`

##### 发布失败

如果发布失败，可以安装最新版的putty，然后删除环境变量中的所有带ssh的变量后，重新打开git bash发布。