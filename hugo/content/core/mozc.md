+++
title = "2.3. mozc"
draft = false
+++
### Emacs上でmozcを使うための手順
Linux環境を前提にした説明になりますが、ごめんなさい。

1. Linuxに日本語入力メソッドエンジンをインストールして有効化します。おすすめは、`fcitx-Mozc` です。
2. Emacsでmozcを使うためのmozcサーバー `emacs-Mozc` をインストールします。

`fcitx-mozc` のインストール

```shellsession
$ sudo apt install fcitx-mozc --install-recommends
```
インストールが済んだら `fcitx`を有効化します。

```shellsession
im-config -n fcitx
```
一旦、ログアウトし、ログインし直すと、mozcが使えるようになります。

続いて、`emacs-mozc` をインストール

```shellsession
$ sudo apt install emacs-mozc
```
`/user/bin/` に `mozc_emacs_helper` がインストールされていたらOKです。

### [mozc.el] Mozcサーバーを使って日本語テキストを入力
🔗 [google/mozc.el: Input Japanese text using Mozc server.](https://github.com/google/mozc/blob/master/src/unix/emacs/mozc.el)

デフォルトでは、`C-\` で `mozc`が起動しますが、できれば `<hiragana-katakana>` で使いたいので、Emacsでのインライン入力を無効にします。

`~/.Xresources` を作成して下記のように設定します。

```zshrc
! ~/.Xresources
! Emacs XIMを無効化
Emacs*useXIM: false
```
再起動をするか，xrdb ~/.Xresources を実行することで設定が有効になります。
これで、`<hiragana-katakana>` をEmacsの `toggle-input-method` に割り当てることができます。

また、句読点などを入力したとき、自動的に確定させるように `mozc-insert-str` を宣言します。

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
	(insert str)))
```

### Emacsから単語登録する

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

### Mozc 辞書の共有
Linux環境でMozcを使うメリットは辞書の共有です。

1. Emacs以外のコンテンツでも同じMozc辞書を使うのでEmacsから単語登録しておけば全てのコンテンツで有効になる。
2. 辞書ファイルをDropboxなどのクラウドに置くことで複数のマシンで共有できる。

### Dropboxで辞書を共有する
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

### 辞書共有の課題
Dropboxに保存された辞書ファイルを複数マシンで同時アクセスした場合、複製（競合コピー）がいっぱい作られるという問題があります。
Google Driveは大丈夫という情報もありますが試せてません。

