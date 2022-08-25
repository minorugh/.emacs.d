+++
title = "5.4. cus-sprit-window-functions"
draft = false
+++
### デフォルトの画面分割コマンドをカスタマイズ

`dimmer-mode` 連携のためにデフォルトのコマンドをカスタマイズします。

* 同じバッファーを分割したときは、`follow-mode` にする。
* 画面分割したときは、`dimmer-mode-on` にする。
* 画面分割を閉じたときは、`dimmer-mode-off` にする。

```emacs-lisp
(leaf *cus-sprit-window-functions
  :bind (("C-q" . other-window-or-split)
		 ("C-x 2" . my:split-window-below)
		 ("C-x 1" . my:delete-other-windows)
		 ("C-x 0" . my:delete-window)
		 ("<C-return>" . window-swap-states))
  :init
  (defun other-window-or-split ()
	"With turn on dimmer."
	(interactive)
	(when (one-window-p)
	  (split-window-horizontally)
	  (follow-mode 1)
	  (dimmer-mode 1))
	(other-window 1))

  (defun my:split-window-below ()
	"With turn on dimmer."
	(interactive)
	(split-window-below)
	(follow-mode 1)
	(dimmer-mode 1))

  (defun my:delete-window ()
	"With turn off dimmer."
	(interactive)
	(delete-window)
	(follow-mode -1)
	(dimmer-mode -1))

  (defun my:delete-other-windows ()
	"With turn off dimmer."
	(interactive)
	(delete-other-windows)
	(follow-mode -1)
	(dimmer-mode -1))

  (defun kill-other-buffers ()
	"Kill all other buffers."
	(interactive)
	(mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
	(message "killl-other-buffers!"))
```
