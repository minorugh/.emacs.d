+++
title = "4.8. volatile-highlight"
draft = false
+++
### [volatile-highlights.el] コピペした領域を強調

[k-talo/volatile-highlights.el: Highlighting copied area.](https://github.com/k-talo/volatile-highlights.el) 

* `volatile-highlights.el` は、コピペした領域を強調します。
* 下記の設定は、コピペ直後の数秒に限定してコピペした領域をフラッシングさせます。

```elisp
(leaf volatile-highlights
  :ensure t
  :hook (after-init-hook . volatile-highlights-mode)
  :config
  (when (fboundp 'pulse-momentary-highlight-region)
	(defun my:vhl-pulse (beg end &optional _buf face)
	  "Pulse the changes."
	  (pulse-momentary-highlight-region beg end face))
	(advice-add #'vhl/.make-hl :override #'my:vhl-pulse)))
```
