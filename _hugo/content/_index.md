+++
title = "minoru's Emacs Configuration"
author = ["minorugh"]
draft = false
+++

## はじめに {#はじめに}

ここは @minorugh のEmacs の設定ファイルの一部を解説しているページです。

<https://github.com/minorugh/.emacs.d/blob/main/init.org> から
ox-hugo を使ってWebサイトに仕立て上げています。


## 動作確認環境 {#動作確認環境}

以下の環境で使用しています。が、動作を保証するものではありません。

-   Debian 11.4 86_64 GNU/Linux
-   自分でビルドした Emacs 27.2.50


## デレクトリ構成 {#デレクトリ構成}

設定ファイルの構成は下記のとおりです。

```text
~/.emacs.d
│
├── el-get/
├── elpa/
├── inits/
│   ├── 00_base.el
│   ├── 01_dashboard.el
│   ├── ...
│   ├── 90_eshell.el
│   └── 99_chromium.el
├── snippets/
├── tmp/
├── early-init.el
├── init.el
└── mini-init.el
```
