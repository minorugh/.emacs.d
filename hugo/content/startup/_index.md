+++
date = "2022-08-29T05:45:20+09:00"
title = "起動設定"
pre = "<b>1. </b>"
weight = 1
disableToc = true
+++

Emacs の起動設定に関わる設定

Emacs-27導入にあわせて `early-init.el` を設定しました。 
起動するまでの流れは以下のとおり。

```shellsession
1. early-init.el の読み込み
2. init.el の読み込み
3. inits/ の設定ファイル群の読み込み
```

## # INDEX

[eary-init.el を使う]({{< relref "eary-init" >}})
: 早期設定ファイルの設定

[speed up startup]({{< relref "speed-up" >}})
: 起動時間を短縮するためのおまじない(^^)

[leaf.el を使って]({{< relref "leaf" >}})
: 設定ファイルを明示的に書く

[init-loader.el を使う]({{< relref "init-loader" >}})
: 設定ファイル群のローダー

[init-mini.el]({{< relref "init-mini" >}})
: 最小限の emacs を起動させる設定

[dashboard]({{< relref "dashboard" >}})
: dashboardを起動初期画面にする

