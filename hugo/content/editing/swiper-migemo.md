+++
title = "6.12. swiper-migemo"
draft = false
weight = 12
+++
## [swiper-migemo.el] swiperでもmigemoを使う
🔗 [tam17aki/swiper-migemo: Use ivy/counsel/swiper with migemo.](https://github.com/tam17aki/swiper-migemo)

`avy-migemo-e.g.swiper.el` を使って出来ていたのですが、２年ほど前から更新が止まってしまっていて動きません。

つい最近、avy-migemo を使わない `swiper-migemo.el`を GitHubで見つけたので試した処、機嫌よく動いてくれています。
MELPAにはアップされていないみたいなので `el-get`で取得しています。

```elisp
(leaf swiper-migemo
	:doc "https://github.com/tam17aki/swiper-migemo"
	:el-get tam17aki/swiper-migemo
	:config
	(global-swiper-migemo-mode +1))
```
