+++
title = "2.7. change gloal keybind"
draft = false
+++
## デフォルトキーバインドの挙動をカスタマイズ

デフォルトの挙動を自分好みにカスタマイズしたり、使いやすいキーバインドに変更したりしています。
その前準備としてクリップボードを使えるようにします。

```elisp
;; Use the X11 clipboard
(setq select-enable-clipboard  t)
(setq mouse-drag-copy-region t)
```

マウスで選択すると，勝手にペーストボードにデータが流れます．

`C-w` は、`kill-ring-save` に割り当てられたものですが、`region` 選択されていないときは、一行削除になるようにカスタマイズしてます。

`kill-buffer` は、`yes/no` 確認されるのが煩わしいので、確認なしの `kill-this-buffer` を愛用しています。

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
