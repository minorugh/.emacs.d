+++
title = "core"
draft = false
+++

## 3. コア設定
Emacs を操作して日本語文書編集するうえで必要な設定。

### 3.1. 言語 / 文字コード
シンプルにこれだけです。

``` emacs-lisp
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
```

### 3.2. [emacs-mozc] 日本語入力
* Debian11 にインストールした Emacs上で [`emacs-mozc`](https://wiki.debian.org/JapaneseEnvironment/Mozc) を使っています。
* debian でのインストール手順は以下の通り。

```shell
$ sudo apt-get install fcitx-mozc emacs-mozc
```

Emacsをソースからビルドするときに `--without-xim` しなかったので、インライン XIMでも日本語入力ができてしまいます。
特に使い分けする必要もなく紛らわしいので `.Xresources` で XIM無効化の設定をしました。

```code
! ~/.Xresources
! Emacs XIMを無効化
Emacs*useXIM: false
```

句読点などを入力したとき、わざわざ mozcに変換してもらう必要はないので以下を設定しておくことでワンアクションスピーディーになります。
```emacs-lisp
(leaf mozc
  :ensure t
  :bind (("<hiragana-katakana>" . toggle-input-method)
		 (:mozc-mode-map
		  ("," . (lambda () (interactive) (mozc-insert-str "、")))
		  ("." . (lambda () (interactive) (mozc-insert-str "。")))
		  ("?" . (lambda () (interactive) (mozc-insert-str "？")))
		  ("!" . (lambda () (interactive) (mozc-insert-str "！")))))
  :custom `((default-input-method . "japanese-mozc")
			(mozc-helper-program-name . "mozc_emacs_helper")
			(mozc-leim-title . "かな"))
  :config
  (defun mozc-insert-str (str)
	(mozc-handle-event 'enter)
	(insert str))
  (defadvice toggle-input-method (around toggle-input-method-around activate)
	"Input method function in key-chord.el not to be nil."
	(let ((input-method-function-save input-method-function))
	  ad-do-it
	  (setq input-method-function input-method-function-save))))
```

Emacsで文章編集中にShellコマンドで [`mozc-tool`](https://www.mk-mode.com/blog/2017/06/27/linux-mozc-tool-command/) を起動し、Emacsを閉じることなく単語登録できるようにしています。

```emacs-lisp
(leaf *cus-mozc-tool
  :bind (("s-t" . my:mozc-dictionary-tool)
		 ("s-d" . my:mozc-word-regist))
  :init
  (defun my:mozc-dictionary-tool ()
	"Open `mozc-dictipnary-tool'."
	(interactive)
	(compile "/usr/lib/mozc/mozc_tool --mode=dictionary_tool")
	(delete-other-windows))

  (defun my:mozc-word-regist ()
	"Open `mozc-word-regist'."
	(interactive)
	(compile "/usr/lib/mozc/mozc_tool --mode=word_register_dialog")
	(delete-other-windows)))
```

### 3.3. [Mozc] 辞書の共有
Linux環境でMozcを使うメリットは辞書の共有です。

1. Emacs以外のコンテンツでも同じMozc辞書を使うのでEmacsから単語登録しておけば全てのコンテンツで有効になる。
2. 辞書ファイルをDropboxなどのクラウドに置くことで複数のマシンで共有できる。

#### 3.3.1. Dropboxで辞書を共有する
やり方は簡単です。

1. Dropboxに `~/Dropbox/mozc` フォルダを新規作成します。
2. つぎに、`~/.mozc` フォルダーを `~/Dropboc/mozc/` へコピーします。
2. 最後に、`~/.mozc` を削除してDropboxにコピーした `.mozc` のシンボリックファイルを `~/` へ貼り付けます。

`makefile` で自動化するなら次のようになるかと思います。

```emacs-lisp
mozc_copy:
	mkdir -p ~/Dropbox/mozc
	cp -r ~/.mozc/ ~/Dropbox/mozc/
	test -L ~/.mozc || rm -rf ~/.mozc
	ln -vsfn ~/Dropbox/mozc/.mozc ~/.mozc
```

#### 3.3.2. 辞書共有の問題点
Dropboxに保存された辞書ファイルを複数マシンで同時アクセスした場合、複製（競合コピー）がいっぱい作られるという問題があります。
Google Driveは大丈夫という情報もありますが試せてません。

### 3.4. 基本キーバインド
* いつでもどこでも使えるキーバインド周りの設定をここにまとめています。 

```emacs-lisp
;; C-h is backspace
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(bind-key "M-w" 'clipboard-kill-ring-save)
(bind-key "C-w" 'my:clipboard-kill-region)
(bind-key "s-c" 'clipboard-kill-ring-save)	 ;; Like mac
(bind-key "s-v" 'clipboard-yank)    ;; Like mac
(bind-key "M-/" 'kill-this-buffer)  ;; No inquiry
(bind-key "C-_" 'undo-fu-only-undo) ;; Use undu-fu.el
(bind-key "C-/" 'undo-fu-only-redo) ;; Use undo-fu.el
```

```emacs-lisp
(defun my:kill-whoile-ine-or-region ()
  "If the region is active, to kill region.
If the region is inactive, to kill whole line."
  (interactive)
  (if (use-region-p)
	  (clipboard-kill-region (region-beginning) (region-end))
    (kill-whole-line)))
```

### 3.5. マウスで選択した領域を自動コピー
マウスで選択すると，勝手にペーストボードにデータが流れます．

```emacs-lisp
(setq mouse-drag-copy-region t)
```
### 3.6. compilation buffer を自動的に閉じる
`compile` コマンドをよく使うので実行後は自動で閉じるようにしました。

```emacs-lisp
(setq compilation-always-kill t)
(setq compilation-finish-functions 'compile-autoclose)

(defun compile-autoclose (buffer string)
  "Automatically close the compilation buffer."
  (cond ((string-match "finished" string)
	     (bury-buffer "*compilation*")
		 (delete-other-windows)
		 (message "Build successful."))
	    (t (message "Compilation exited abnormally: %s" string))))
```
また、defaultだと出力が続いてもスクロールされないので自動的にスクロールさせる設定を追加。
```emacs-lisp
(setq compilation-scroll-output t)
```

### 3.7. C-x C-c でEmacsを終了させないようにする
* 終了させることはまずないので、再起動コマンドに変更しています。
* [`restart-emacs`](https://github.com/iqbalansari/restart-emacs) はMELPAからインストールできます。

```emacs-lisp
(leaf restart-emacs
  :ensure t
  :bind ("C-x C-c" . restart-emacs))
```
### 3.8. [aggressive-indent.el] 即時バッファー整形
特定のメジャーモードで、とにかく整形しまくります。

```emacs-lisp
(leaf aggressive-indent
  :ensure t
  :hook ((emacs-lisp-mode-hook css-mode-hook) . aggressive-indent-mode))
```
### 3.9.  [uniquify.el] 同じバッファ名が開かれた場合に区別する
ビルトインの `uniquify` を使います。モードラインの表示が変わります。

```emacs-lisp
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
```

### 3.10. [el-get] パッケージ管理
* MELPAをメインに管理していますが、MELPAにないものは`el-get` でGitHubやEmacsWikiからインストールします。
* 個人用に開発したものも、自分のGitHubリポジトリで管理し`el-get` で読み込んでいます。
