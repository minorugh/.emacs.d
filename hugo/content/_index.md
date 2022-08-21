+++
title = "minoru's Emacs Configuration"
description = ""
+++
# Emacs Configuration

## はじめに
  
* ここは [@minoruGH](https://twitter.com/minorugh)  の Emacs設定ファイルの一部を解説しているページです。
* [https://github.com/minorugh/emacs.d/](https://github.com/minorugh/emacs.d/) から
`jekyll` を使ってGithub pages にWebサイトを構築しています。
* 本ドキュメントは、[@takaxp](https://twitter.com/takaxp)さんが公開されている [takaxp.github.io/](https://takaxp.github.io/init.html) の記事を下敷きにした模倣版です。
* 執筆用途に特化してカスタマイズしていますので、コンセプトやキーバイドなどは極めて邪道思想になっています。

### 動作確認環境
以下の環境で使用しています。が、動作を保証するものではありません。

* Debian 11.4  86_64 GNU/Linux
* 自分でビルドした Emacs 27.2.50

### デレクトリ構成
設定ファイルの構成は下記のとおりです。

```shellsession
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
