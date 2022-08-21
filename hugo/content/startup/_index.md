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

1. `early-init.el` の読み込み
2. `init.el` の読み込み
3. `inits/` のファイル群を読み込み （init-loader 使用）


[eary-init.el]({{< relref "eary-init" >}})
: 早期設定ファイルの設定

[GCを減らす]({{< relref "gc" >}})
: 早期設定ファイルの設定
