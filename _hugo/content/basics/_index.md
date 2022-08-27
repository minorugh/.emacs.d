+++
title = "起動設定"
author = ["minorugh"]
draft = false
pre = "<b>1. </b>"
weight = 1
disableToc = true
+++

Emacs の起動設定に関わる部分をまとめています。
Emacs-27導入にあわせて \`early-init.el\` を設定しました。

起動するまでの流れは以下のとおり。

```text
1. early-init.el の読み込み
2. init.el の読み込み
3. inits/ の設定ファイル群の読み込み
```

[eary-init]({{< relref "eary-init" >}})
: 早期設定ファイルの設定

[auto-format]({{< relref "auto-format" >}})
: ファイル保存時に自動で整形してくれるやつ

[auto-save]({{< relref "auto-save" >}})
: 編集中状態の自動保存や編集前の状態のバックアップに関する設定

[custom-file]({{< relref "custom-file" >}})
: カスタマイズ変数などの保存先を変更している

[ddskk]({{< relref "ddskk" >}})
: ちょっと変わった日本語入力 SKK の Emacs Lisp 版

[exec-path]({{< relref "exec-path" >}})
: PATH などの環境変数を shell と合わせる設定

[font-config]({{< relref "font-config" >}})
: フォントの設定

[load-path]({{< relref "load-path" >}})
: Emacs Lisp が読み込める path の設定

[migemo]({{< relref "migemo" >}})
: 日本語入力オフのままローマ字で検索できるようにするやつ

[savehist]({{< relref "savehist" >}})
: ミニバッファの履歴などを保存してくれる機能

[server]({{< relref "server" >}})
: 起動した Emacs がサーバとしても動くように設定している

[ガベージコレクション]({{< relref "gcmh" >}})
: メモリの開放関係の設定

[ライブラリの読み込み]({{< relref "load-libraries" >}})
: Emacs Lisp を書く上で便利なライブラリの読み込み


## eary-init {#eary-init}


## 早期初期化ファイル {#早期初期化ファイル}

🔗 [minorugh/.emacs.d/early-init.el](https://github.com/minorugh/.emacs.d/blob/main/early-init.el)

Emacs27から導入された eary-init.el は、init.el でGUIやパッケージシステムの初期化が実行される前にロードされるので、UI関係や package-enable-at-startup のようなパッケージ初期化プロセスに影響を与える変数を先に書くことで起動を早くすることが出来るようです。


## GCを減らす {#gcを減らす}

GC の閾値を最大にしておくことで GC を実質止めることができます。とりあえず書いておけば速くなる系なのでおすすめです。

<div class="emacs-lisp">

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)

</div>

eary-init.el の先頭に書きます。
