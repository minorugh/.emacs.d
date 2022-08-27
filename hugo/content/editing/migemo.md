+++
title = "6.11. migemo"
draft = false
weight = 11
+++

### [migemo.el] ローマ字のまま日本語をインクリメンタル検索可能にする。
🔗 [emacs-jp/migemo: emacs migemo client.](https://github.com/emacs-jp/migemo) 

migemo は元々 Ruby で書かれていたようですが，最近の Ruby では動かないので C 言語で再実装された cmigemo を使うのが一般的のよう。
aptでインストール。

```shellsesson
$ sudo apt install cmigemo
```
インストール完了したら、下記コマンドで実行できる事を確認しておきます。

```shellsesson
$ cmigemo --help
```
Emacsの設定は下記のとおりです。

```elisp
(leaf migemo
  :ensure t
  :hook (after-init-hook . migemo-init)
  :when (executable-find "cmigemo")
  :custom `((migemo-command . "cmigemo")
			(migemo-dictionary . "/usr/share/cmigemo/utf-8/migemo-dict")))

```
