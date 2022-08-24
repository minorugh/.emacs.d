+++
title = "7.13. pangu-spacing"
draft = false
+++
### [pangu-spacing.el] 漢字と英字の間にスペースを自動追加

[coldnew/pangu-spacing: Add space between Chinese and English characters.](https://github.com/coldnew/pangu-spacing) 

`pangu-spacing`は、漢字と英字の間にスペースを自動追加してくれます。
やや不満なところもあるので少しカスタマイズしました。

* 英字の前方のみとし後方にはスペースは挿入しない。
* 半角数字は、対象から除外。

```elisp
;; Add space between full-width and half-width
(leaf pangu-spacing
  :ensure t
  :after mozc
  :hook ((markdown-mode-hook text-mode-hook) . pangu-spacing-mode)
  :config
  (setq pangu-spacing-include-regexp
		(rx (or (and (or (group-n 3 (any "。，！？；：「」（）、"))
						 (group-n 1 (or (category japanese))))))
			(group-n 2 (in "a-zA-Z")))))

```
