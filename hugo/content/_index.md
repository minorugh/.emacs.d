+++
date = "2022-08-29T06:03:08+09:00"
title = "minoru's Emacs Configuration"
description = ""
+++
# minoru's Emacs Config

## はじめに
* [@minoruGH](https://twitter.com/minorugh)  の Emacs設定ファイルの一部を解説しているページです。
* [https://github.com/minorugh/emacs.d/](https://github.com/minorugh/emacs.d/) から
Hugo を使ってGitHub Pages にWebサイトを構築しています。
* 執筆用途に特化して設定していますので、コンセプトやキーバイドなどは極めて邪道思想になっています。

## 動作確認環境
以下の環境で使用しています。が、動作を保証するものではありません。

* Debian 11.4  86_64 GNU/Linux
* 自分でビルドした Emacs 29.4

## デレクトリ構成
設定ファイルの構成は下記のとおりです。

```shellsession
~/.emacs.d
│
├── elisp/
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
└── init-mini.el
```
