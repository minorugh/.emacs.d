+++
title = "3.5. migemo"
draft = false
+++

```elisp
(leaf migemo
  :ensure t
  :hook (after-init-hook . migemo-init)
  :when (executable-find "cmigemo")
  :custom `((migemo-command . "cmigemo")
			(migemo-dictionary . "/usr/share/cmigemo/utf-8/migemo-dict")))

```

[`avy-migemo-e.g.swiper.el`](https://github.com/momomo5717/avy-migemo) を使って出来ていたのですが、２年ほど前から更新が止まってしまっていて動きません。

つい最近、avy-migemo を使わない [`swiper-migemo`](https://github.com/tam17aki/swiper-migemo)を GitHubで見つけたので試した処、機嫌よく動いてくれています。
MELPAにはアップされていないみたいなので el-get で取得しています。

```elisp
(leaf swiper-migemo
	:doc "https://github.com/tam17aki/swiper-migemo"
	:el-get tam17aki/swiper-migemo
	:after migemo
	:global-minor-mode t
	:config
	(setq migemo-options '("--quiet" "--nonewline" "--emacs"))
	(add-to-list 'swiper-migemo-enable-command 'counsel-rg)
	(migemo-kill)
	(migemo-init))
```
