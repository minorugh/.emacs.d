+++
title = "7.11. migemo"
draft = false
+++

### [migemo.el] ローマ字のまま日本語をインクリメンタル検索可能にする。
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

### [swiper-migemo] swiperでもmigemoを使う

[`avy-migemo-e.g.swiper.el`](https://github.com/momomo5717/avy-migemo) を使って出来ていたのですが、２年ほど前から更新が止まってしまっていて動きません。

つい最近、avy-migemo を使わない [`swiper-migemo`](https://github.com/tam17aki/swiper-migemo)を GitHubで見つけたので試した処、機嫌よく動いてくれています。
MELPAにはアップされていないみたいなので el-get で取得しています。

```elisp
(leaf swiper-migemo
	:doc "https://github.com/tam17aki/swiper-migemo"
	:el-get tam17aki/swiper-migemo
	:config
	(global-swiper-migemo-mode +1))
```
