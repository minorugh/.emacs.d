+++
title = "3.2. ウインドウ間のカーソル移動"
draft = false
+++

* `C-c o` でもいいですが，ワンアクションで移動できるほうが楽なので、次のように双方向で使えるように設定しています．
* 画面分割されていないときは、左右分割して `follow-mode` `dimmer-mode` も `ON` にしています。（詳細後述）

```elisp
(defun other-window-or-split ()
 "With turn on dimmer."
 (interactive)
 (when (one-window-p)
	 (split-window-horizontally)
	 (follow-mode 1)
	 (dimmer-mode 1))
   (other-window 1))
(bind-key "C-q" 'other-window-or-split)
```
