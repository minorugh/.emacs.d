+++
title = "3.2. other-window-or-split"
draft = false
+++
### 画面分割時のカーソルの移動
* `other-window-or-split` は、画面分割コマンド `C-x 3` を拡張します。
* 画面分割されていないときは、左右分割して `follow-mode` `dimmer-mode` も `ON` にしています。（詳細後述）
* 画面移動だけなら `C-c o` でもいいですが，ワンアクションで分割と移動を賢くしてくれるので便利です。

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
