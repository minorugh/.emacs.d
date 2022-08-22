+++
title = "2.8. 基本キーバインドをカスタマイズ"
draft = false
+++
### 3.4. 基本キーバインド

* いつでもどこでも使えるキーバインド周りの設定をここにまとめています。 
* `C-w` は、`kill-ring-save` に割り当てられたものですが、`region` 選択されていないときは、一行削除になるようにカスタマイズしてます。

```elisp
;; Change global key bind
(leaf cus-global-keybind
  :bind (("M-w" . clipboard-kill-ring-save)
		 ("C-w" . my:kill-whole-line-or-region)
		 ("s-c" . clipboard-kill-ring-save)
		 ("s-v" . clipboard-yank)
		 ("M-/" . kill-this-buffer)))

;; Overwrite `C-w' to the whole-line-or-region
(defun my:kill-whole-line-or-region ()
  "If the region is active, to kill region.
If the region is inactive, to kill whole line."
  (interactive)
  (if (use-region-p)
	  (clipboard-kill-region (region-beginning) (region-end))
    (kill-whole-line)))
```
