+++
title = "7.9. key-chord"
draft = false
+++
### [key-chord.el] 同時押しでキーバインド
🔗 [emacsorphanage/key-chord: Map pairs of simultaneously pressed keys to commands.](https://github.com/emacsorphanage/key-chord) 

同時押しというキーバインドを提供します。

同時押しの許容時間、その前後で別のキーが押されていたら発動しない判断をする、みたいな設定をしている。

```elisp
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
