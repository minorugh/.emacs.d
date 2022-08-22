+++
title = "1.1. eary-init.el"
draft = false
+++
* [`early-init.el`](https://ayatakesi.github.io/emacs/28.1/html/Early-Init-File.html) は、Emacs27から導入されました。 
* [https://github.com/minorugh/dotfiles/blob/main/.emacs.d/early-init.el](https://github.com/minorugh/dotfiles/blob/main/.emacs.d/early-init.el)

`init.el` でパッケージシステムやGUIの初期化が実行される前にロードされるので、UI関係や `package-enable-at-startup` のようなパッケージ初期化プロセスに影響を与える変数をカスタマイズできます。

## GCを減らす
GC の閾値を最大にしておくことで GC を実質止めることができます。とりあえず書いておけば速くなる系なのでおすすめです。

```elisp
;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)
```
eary-init.el の先頭に書くことが重要です。

## Package の初期化を抑制する 
Emacs27では、(package-initialize) が 2回実行されます。
(1回は init ファイルの評価中に、もう 1回は Emacs が initファイルの読み取りを終了した後に)。

1回目を抑制するために以下を `eary-init.el` に記述することで初期化が少し早くなります。

```elisp
;; For slightly faster startup
(setq package-enable-at-startup nil)
```

## 常に最新のバイトコードをロードする

```elisp
;; Always load newest byte code
(setq load-prefer-newer t)

```

## フレームのサイズ変更を禁止する

```elisp
;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t)
```

## これらを無効にする方が速い (初期化される前)

```elisp
;; Faster to disable these here (before they've been initialized)
(push '(fullscreen . maximized) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
```

## 起動時の点滅を抑える
Emacsが設定ファイルを読み込むプロセスで画面がちらつくのを抑制します。

```elisp
;; Suppress flashing at startup
(setq inhibit-redisplay t)
(setq inhibit-message t)
(add-hook 'window-setup-hook
		  (lambda ()
			(setq inhibit-redisplay nil)
			(setq inhibit-message nil)
			(redisplay)))
```

## 起動時の背景色を指定する
Emacsが設定を読み込む色段階の背景色は白です。
自分は、タークテーマを使っているので、起動時から即黒背景になるようにここで設定しています。

```elisp
;; Startup setting
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq byte-compile-warnings '(cl-functions))
(custom-set-faces '(default ((t (:background "#282a36")))))
```
