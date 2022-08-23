+++
title = "7.8. key-chord"
draft = false
weight = 8
+++

### 5.14. [key-chord.el] 同時押しでキーバインド
* 同時押しというキーバインドを提供してくれるやつ
* 同時押し時の許容時間、その前後で別のキーが押されていたら発動しない判断をする、みたいな設定を入れている。

```code
(leaf key-chord
  :ensure t
  :hook (after-init-hook . key-chord-mode)
  :chord (("df" . counsel-descbinds)
		  ("l;" . init-loader-show-log)
		  ("@@" . howm-list-all)
		  ("jk" . open-junk-file))
  :custom
  `((key-chord-two-keys-delay . 0.25)
	(key-chord-safety-interval-backward . 0.1)
	(key-chord-safety-interval-forward  . 0.15)))
```
キーの同時押し判定は 0.15 秒で、それらのキーが押される直前の 0.1 秒以内、または直後の 0.15 秒に押されていたら発動しない、という設定にしている。

改良版の作者の記事だと、直後判定は 0.25 秒で設定されていたが自分は `Hydra` の起動にも使っている上に、よく使うやつは覚えているので表示を待たずに次のキーを押すので 0.25 秒も待っていられないという事情があった。
