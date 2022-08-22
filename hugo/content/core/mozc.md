### 3.2. [emacs-mozc] 日本語入力

* Debian11 にインストールした Emacs上で [`emacs-mozc`](https://wiki.debian.org/JapaneseEnvironment/Mozc) を使っています。
* debian でのインストール手順は以下の通り。

```shell
$ sudo apt-get install fcitx-mozc emacs-mozc
```

Emacsをソースからビルドするときに `--without-xim` しなかったので、インライン XIMでも日本語入力ができてしまいます。
特に使い分けする必要もなく紛らわしいので `.Xresources` で XIM無効化の設定をしました。

```zshrc
! ~/.Xresources
! Emacs XIMを無効化
Emacs*useXIM: false
```

句読点などを入力したとき、わざわざ mozcに変換してもらう必要はないので以下を設定しておくことでワンアクションスピーディーになります。
```elisp
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

## Emacsから単語登録する

Emacsで文章編集中にShellコマンドで [`mozc-tool`](https://www.mk-mode.com/blog/2017/06/27/linux-mozc-tool-command/) を起動し、Emacsを閉じることなく単語登録できるようにしています。

```elisp
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

## Mozc 辞書の共有
Linux環境でMozcを使うメリットは辞書の共有です。

1. Emacs以外のコンテンツでも同じMozc辞書を使うのでEmacsから単語登録しておけば全てのコンテンツで有効になる。
2. 辞書ファイルをDropboxなどのクラウドに置くことで複数のマシンで共有できる。

## Dropboxで辞書を共有する
やり方は簡単です。

1. Dropboxに `~/Dropbox/mozc` フォルダを新規作成します。
2. つぎに、`~/.mozc` フォルダーを `~/Dropboc/mozc/` へコピーします。
2. 最後に、`~/.mozc` を削除してDropboxにコピーした `.mozc` のシンボリックファイルを `~/` へ貼り付けます。

`makefile` で自動化するなら次のようになるかと思います。

```code
mozc_copy:
	mkdir -p ~/Dropbox/mozc
	cp -r ~/.mozc/ ~/Dropbox/mozc/
	test -L ~/.mozc || rm -rf ~/.mozc
	ln -vsfn ~/Dropbox/mozc/.mozc ~/.mozc
```

## 辞書共有の課題
Dropboxに保存された辞書ファイルを複数マシンで同時アクセスした場合、複製（競合コピー）がいっぱい作られるという問題があります。
Google Driveは大丈夫という情報もありますが試せてません。

