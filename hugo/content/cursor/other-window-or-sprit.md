+++
date = "2022-08-29T05:50:55+09:00"
title = "3.2. other-window-or-split"
draft = false
+++
## 画面分割時のカーソルの移動
`other-window-or-split` は、画面分割コマンド `C-x 3` を拡張するもので、状況判断して画面分割されていないときは左右分割を実行し、画面が分割されているときは画面移動の `C-x o` になります。

画面分割と移動とを賢く判断してくれるのでとても便利です。

```elisp
(defun other-window-or-split ()
 "With turn on dimmer."
 (interactive)
 (when (one-window-p)
	 (split-window-horizontally)
	 (dimmer-mode 1))
   (other-window 1))
(bind-key "C-q" 'other-window-or-split)
```
