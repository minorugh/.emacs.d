+++
title = "1.1. eary-init.el"
draft = false
+++
### 早期初期化ファイル
🔗 [minorugh/.emacs.d/early-init.el](https://github.com/minorugh/.emacs.d/blob/main/early-init.el)

Emacs27から導入された `eary-init.el`は、パッケージシステムやGUIの初期化が `init.el` で実行される前にロードされるので、UI関係や `package-enable-at-startup` のようなパッケージ初期化プロセスに影響を与える変数をカスタマイズできます。

### GCを減らす
GC の閾値を最大にしておくことで GC を実質止めることができます。とりあえず書いておけば速くなる系なのでおすすめです。

```elisp
;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)
```
`eary-init.el` の先頭に書きます。

### パッケージの初期化を抑制する 
Emacs27では、`package-initialize` が 2回実行されます。
1回は、初期化ファイルの評価中に、もう 1回は、初期化ファイルの読み取りを終了した後にです。

`eary-init.el` に以下を書いて、1回目の実行を抑制することで少し早くなります。

```elisp
;; For slightly faster startup
(setq package-enable-at-startup nil)
```

### 常に最新のバイトコードをロードする

```elisp
;; Always load newest byte code
(setq load-prefer-newer t)

```

### フレームのサイズ変更を禁止する

```elisp
;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t)
```

### 起動時画面最大化を設定
メニューバー、ツールバー、スクロールなどは、ここで無効にする方が速くなります。 (初期化される前)

ここで最大化を宣言しておくことで `toggle-frame-fullscreen` コマンドによる「最大化<->フルスクリーン」のトグル表示を可能にします。
```elisp
;; Faster to disable these here (before they've been initialized)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(fullscreen . maximized) default-frame-alist)
```

### 起動時の点滅を抑える
初期設定を読み終えるまではEmacsの画面表示を抑止しています。
そこまでする必要はないのですが、起動時間短縮にもなるようで一石二鳥です。

```elisp
(set-frame-parameter nil 'fullscreen 'fullboth)
```
初期化後にフルスクリーンにしているのは、
うっかりタイトルバーの閉じるをクリックする悪癖を直すための対策です(^^)

```elisp
;; Suppress flashing at startup
(setq inhibit-redisplay t)
(setq inhibit-message t)
(add-hook 'window-setup-hook
		  (lambda ()
			(setq inhibit-redisplay nil)
			(setq inhibit-message nil)
			(redisplay)
			(set-frame-parameter nil 'fullscreen 'fullboth)))
```

### 起動直後の背景色をテーマのそれと合わせる
Emacsが設定を読み込む色段階の背景色は白です。
自分は、タークテーマを使っているので、起動時から即黒背景になるようにここで設定しています。

```elisp
;; Startup setting
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq byte-compile-warnings '(cl-functions))
(custom-set-faces '(default ((t (:background "#282a36")))))
```

### 常駐環境を考えてみた 
GUIのEmacsを常駐化させるのは、自分にはハードルが高い課題なので疑似環境ということで紹介します。

* 最小化で自動起動させる
* `C-x C-c` で閉じれないようにする→他の用途に置き換えます
* フレームの閉じるボタンを隠す→常にフルスクリーンで使う
* Emacsを閉じたいときは、最小化（suspend-frame）する

Emacsは、起動オプションに `--iconic` を付すことで最小化起動します。
```sell
emacs --iconic
```
Linuxの場合、「セッションと起動」を立ち上げて「自動開始アプリケーション」に上記設定を追加するといいです。
