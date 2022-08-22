+++
title = "起動設定"
draft = false
pre = "<b>1. </b>"
weight = 1
disableToc = true
+++

Emacs の起動設定に関わる部分をここでは設定している
* Emacs-27導入にあわせて `early-init.el` を設定しました。 
* ブートシーケンスは以下のとおり。

1. early-init.el の読み込み
2. init.el の読み込み
3. inits/ のファイル群を読み込み （init-loader 使用）


[eary-init.el を使う]({{< relref "eary-init" >}})
: 早期設定ファイルの設定

[speed up startup]({{< relref "magick-file" >}})
: Magic File Name を一時的に無効にして起動時間を短縮するためのおまじない(^^)

[leaf.el を使う]({{< relref "leaf" >}})
: 設定ファイルを明示的に書くためのパッケージです。

[init-loader.el を使う]({{< relref "init-loader" >}})
: 設定ファイル群のローダーです。

[test.el]({{< relref "test" >}})
: 最小限の emacs を起動させるための設定

