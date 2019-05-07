---
title: nexT主题配置
tags: next
abbrlink: '75058071'
date: 2019-05-07 11:35:57
---

NexT 坚持将复杂的细节隐藏，提供尽量少并且简便的设置，保持最大限度的易用性。

### 设置 RSS

NexT 中 RSS 有三个设置选项，满足特定的使用场景。 更改 **主题配置文件**，设定 `rss` 字段的值：

- `false`：禁用 RSS，不在页面上显示 RSS 连接。
- 留空：使用 Hexo 生成的 Feed 链接。 你可以需要先安装 [hexo-generator-feed](https://github.com/hexojs/hexo-generator-feed) 插件。
- 具体的链接地址：适用于已经烧制过 Feed 的情形。

### 添加「标签」页面

新建「标签」页面，并在菜单中显示「标签」链接。「标签」页面将展示站点的所有标签，若你的所有文章都未包含标签，此页面将是空的。 底下代码是一篇包含标签的文章的例子：

```
title: 标签测试文章
tags:
  - Testing
  - Another Tag
---
```

请参阅 [Hexo 的分类与标签文档](https://hexo.io/zh-cn/docs/front-matter.html#分类和标签)，了解如何为文章添加标签或者分类。

- [新建页面](https://theme-next.iissnan.com/theme-settings.html#new-page-tags)
- [设置页面类型](https://theme-next.iissnan.com/theme-settings.html#set-page-tags)
- [修改菜单](https://theme-next.iissnan.com/theme-settings.html#update-menu-for-tags-page)

在终端窗口下，定位到 Hexo 站点目录下。使用 `hexo new page` 新建一个页面，命名为 `tags` ：

```
$ cd your-hexo-site
$ hexo new page tags
```

**注意：**如果有集成评论服务，页面也会带有评论。 若需要关闭的话，请添加字段 `comments` 并将值设置为 `false`，如：

禁用评论示例

```
title: 标签
date: 2014-12-22 12:39:04
type: "tags"
comments: false
---
```

### 添加「分类」页面

新建「分类」页面，并在菜单中显示「分类」链接。「分类」页面将展示站点的所有分类，若你的所有文章都未包含分类，此页面将是空的。 底下代码是一篇包含分类的文章的例子：

```
title: 分类测试文章
categories: Testing
---
```

请参阅 [Hexo 的分类与标签文档](https://hexo.io/zh-cn/docs/front-matter.html#分类和标签)，了解如何为文章添加标签或者分类。

- [新建页面](https://theme-next.iissnan.com/theme-settings.html#new-page-categories)
- [设置页面类型](https://theme-next.iissnan.com/theme-settings.html#set-page-categories)
- [修改菜单](https://theme-next.iissnan.com/theme-settings.html#update-menu-for-categories-page)

在终端窗口下，定位到 Hexo 站点目录下。使用 `hexo new page` 新建一个页面，命名为 `categories` ：

```
$ cd your-hexo-site
$ hexo new page categories
```

**注意：**如果有集成评论服务，页面也会带有评论。 若需要关闭的话，请添加字段 `comments` 并将值设置为 `false`，如：

禁用评论示例

```
title: 分类
date: 2014-12-22 12:39:04
type: "categories"
comments: false
---
```

### 设置字体

**注意：** 此特性在版本 **5.0.1** 中引入，要使用此功能请确保所使用的 NexT 版本在此之后

为了解决 [Google Fonts API](https://www.google.com/fonts) 不稳定的问题，NexT 在 5.0.1 中引入此特性。 通过此特性，你可以指定所使用的字体库外链地址；与此同时，NexT 开放了 5 个特定范围的字体设定，他们是：

- 全局字体：定义的字体将在全站范围使用
- 标题字体：文章内标题的字体（h1, h2, h3, h4, h5, h6）
- 文章字体：文章所使用的字体
- Logo字体：Logo 所使用的字体
- 代码字体： 代码块所使用的字体

各项所指定的字体将作为首选字体，当他们不可用时会自动 Fallback 到 NexT 设定的基础字体组：

- 非代码类字体：Fallback 到 `"PingFang SC", "Microsoft YaHei", sans-serif`
- 代码类字体： Fallback 到 `consolas, Menlo, "PingFang SC", "Microsoft YaHei", monospace`

另外，每一项都有一个额外的 `external` 属性，此属性用来控制是否使用外链字体库。 开放此属性方便你设定那些已经安装在系统中的字体，减少不必要的请求（请求大小）。

配置示例

```
font:
  enable: true

  # 外链字体库地址，例如 //fonts.googleapis.com (默认值)
  host:

  # 全局字体，应用在 body 元素上
  global:
    external: true
    family: Monda

  # 标题字体 (h1, h2, h3, h4, h5, h6)
  headings:
    external: true
    family: Roboto Slab

  # 文章字体
  posts:
    external: true
    family:

  # Logo 字体
  logo:
    external: true
    family: Lobster Two
    size: 24

  # 代码字体，应用于 code 以及代码块
  codes:
    external: true
    family: PT Mono
```

### 设置代码高亮主题

NexT 使用 [Tomorrow Theme](https://github.com/chriskempson/tomorrow-theme) 作为代码高亮，共有5款主题供你选择。 NexT 默认使用的是 白色的 `normal` 主题，可选的值有 `normal`，`night`， `night blue`， `night bright`， `night eighties`：

| ![img](https://theme-next.iissnan.com/assets/img/tomorrow.png) | ![img](https://theme-next.iissnan.com/assets/img/tomorrow-night.png) | ![img](https://theme-next.iissnan.com/assets/img/tomorrow-night-blue.png) | ![img](https://theme-next.iissnan.com/assets/img/tomorrow-night-bright.png) | ![img](https://theme-next.iissnan.com/assets/img/tomorrow-night-eighties.png) |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
|                                                              |                                                              |                                                              |                                                              |                                                              |

更改 `highlight_theme` 字段，将其值设定成你所喜爱的高亮主题，例如：

高亮主题设置示例

```
# Code Highlight theme
# Available value: normal | night | night eighties | night blue | night bright
# https://github.com/chriskempson/tomorrow-theme
highlight_theme: normal
```

### 侧边栏社交链接

侧栏社交链接的修改包含两个部分，第一是链接，第二是链接图标。 两者配置均在 **主题配置文件** 中。

1. 链接放置在 `social` 字段下，一行一个链接。其键值格式是 `显示文本: 链接地址`。

   配置示例

   ```
   # Social links
   social:
     GitHub: https://github.com/your-user-name
     Twitter: https://twitter.com/your-user-name
     微博: http://weibo.com/your-user-name
     豆瓣: http://douban.com/people/your-user-name
     知乎: http://www.zhihu.com/people/your-user-name
     # 等等
   ```

2. 设定链接的图标，对应的字段是 `social_icons`。其键值格式是 `匹配键: Font Awesome 图标名称`， `匹配键` 与上一步所配置的链接的 `显示文本` 相同（大小写严格匹配），`图标名称` 是 Font Awesome 图标的名字（不必带 `fa-` 前缀）。`enable` 选项用于控制是否显示图标，你可以设置成 `false` 来去掉图标。

   配置示例

   ```
   # Social Icons
   social_icons:
     enable: true
     # Icon Mappings
     GitHub: github
     Twitter: twitter
     微博: weibo
   ```

### 开启打赏功能

越来越多的平台（微信公众平台，新浪微博，简书，百度打赏等）支持打赏功能，付费阅读时代越来越近，特此增加了打赏功能，支持微信打赏和支付宝打赏。 只需要 **主题配置文件** 中填入 微信 和 支付宝 收款二维码图片地址 即可开启该功能。

打赏功能配置示例

```
reward_comment: 坚持原创技术分享，您的支持将鼓励我继续创作！
wechatpay: /path/to/wechat-reward-image
alipay: /path/to/alipay-reward-image
```

### 友情链接

编辑 **主题配置文件** 添加：

友情链接配置示例

```
# title
links_title: Links
links:
  MacTalk: http://macshuo.com/
  Title: http://example.com/
```

### 腾讯公益404页面

腾讯公益404页面，寻找丢失儿童，让大家一起关注此项公益事业！效果如下 <http://www.ixirong.com/404.html>

使用方法，新建 404.html 页面，放到主题的 `source` 目录下，内容如下：

```
<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=utf-8;"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="robots" content="all" />
  <meta name="robots" content="index,follow"/>
  <link rel="stylesheet" type="text/css" href="https://qzone.qq.com/gy/404/style/404style.css">
</head>
<body>
  <script type="text/plain" src="http://www.qq.com/404/search_children.js"
          charset="utf-8" homePageUrl="/"
          homePageName="回到我的主页">
  </script>
  <script src="https://qzone.qq.com/gy/404/data.js" charset="utf-8"></script>
  <script src="https://qzone.qq.com/gy/404/page.js" charset="utf-8"></script>
</body>
</html>
```

### 站点建立时间

这个时间将在站点的底部显示，例如 `© 2013 - 2015`。 编辑 **主题配置文件**，新增字段 `since`。

配置示例

```
since: 2013
```

### 订阅微信公众号

**注意：** 此特性在版本 **5.0.1** 中引入，要使用此功能请确保所使用的 NexT 版本在此之后

在每篇文章的末尾显示微信公众号二维码，扫一扫，轻松订阅博客。

在微信公众号平台下载您的二维码，并将它存放于博客`source/uploads/`目录下。

然后编辑 **主题配置文件**，如下：

配置示例

```
# Wechat Subscriber
wechat_subscriber:
  enabled: true
  qcode: /uploads/wechat-qcode.jpg
  description: 欢迎您扫一扫上面的微信公众号，订阅我的博客！
```

### 设置「动画效果」

NexT 默认开启动画效果，效果使用 JavaScript 编写，因此需要等待 JavaScript 脚本完全加载完毕后才会显示内容。 如果您比较在乎速度，可以将设置此字段的值为 `false` 来关闭动画。

编辑 **主题配置文件**， 搜索 `use_motion`，根据您的需求设置值为 `true` 或者 `false` 即可：

```
use_motion: true  # 开启动画效果
use_motion: false # 关闭动画效果
```

### 设置「背景动画」

NexT 自带两种背景动画效果

编辑 **主题配置文件**， 搜索 `canvas_nest` 或 `three_waves`，根据您的需求设置值为 `true` 或者 `false` 即可：

**注意：** `three_waves` 在版本 **5.1.1** 中引入。只能同时开启一种背景动画效果。

`canvas_nest` 配置示例

```
# canvas_nest
canvas_nest: true //开启动画
canvas_nest: false //关闭动画
```

`three_waves` 配置示例

```
# three_waves
three_waves: true //开启动画
three_waves: false //关闭动画
```

  