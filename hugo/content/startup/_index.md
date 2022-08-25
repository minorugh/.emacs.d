+++
title = "起動設定"
draft = false
pre = "<b>1. </b>"
weight = 1
disableToc = true
+++

Emacs の起動設定に関わる部分をここでは設定しています。
Emacs-27導入にあわせて `early-init.el' を設定しました。 

* ブートシーケンスは以下のとおり。

```shellsession
1. early-init.el の読み込み
2. init.el の読み込み
3. inits/ のファイル群を読み込み
```

### # INDEX

[eary-init.el を使う]({{< relref "eary-init" >}})
: 早期設定ファイルの設定

[speed up startup]({{< relref "speed-up" >}})
: 起動時間を短縮するためのおまじない(^^)

[leaf.el を使って]({{< relref "leaf" >}})
: 設定ファイルを明示的に書く

[init-loader.el を使う]({{< relref "init-loader" >}})
: 設定ファイル群のローダー

[test.el]({{< relref "test" >}})
: 最小限の emacs を起動させる設定

[dashboard]({{< relref "dashboard" >}})
: dashboardを起動初期画面にする

