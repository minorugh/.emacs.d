+++
date = "2022-08-29T05:55:43+09:00"
title = "5.1. dimmer-mode"
draft = false
+++
## [dimmer.el] 現在のバッファ以外の輝度を落とす
🔗 [gonewest818/dimmer.el: Visually highlight the selected buffer.](https://github.com/gonewest818/dimmer.el) 

現在のバッファ以外の輝度を落とす機能を実現するためのパッケージです。

[takaxp.github.io](https://takaxp.github.io/init.html#org8ba0784e) の設定をそのままパクリました。
ON/OFF できるのが快適です。

```emacs-lisp
(leaf dimmer
  :ensure t
  :chord (".." . my:toggle-dimmer)
  :config
  (defvar my:dimmer-mode 1)
  (setq dimmer-buffer-exclusion-regexps '("^ \\*which-key\\|^ \\*LV\\|^ \\*.*posframe.*buffer.*\\*$"))
  (setq dimmer-fraction 0.6)

  (defun my:toggle-dimmer ()
	(interactive)
	(unless (one-window-p)
	  (if (setq my:dimmer-mode (not my:dimmer-mode))
		  (dimmer-on) (dimmer-off))))

  (defun dimmer-off ()
	(dimmer-process-all)
	(dimmer-mode -1))

  (defun dimmer-on ()
	(when my:dimmer-mode
	  (dimmer-mode 1)
	  (dimmer-process-all))))
```

## 画面分割との連携

`dimmer-mode` を global に設定すると多くのシーンでDisable対策の設定が必要になり面倒です。

下記の通り発想転換すれば呪縛から逃れることができます。

* 画面分割したときは、`dimmer-mode-on` にする。
* 画面分割を閉じるときは、`dimmer-mode-off` にする。

```emacs-lisp
(leaf *sprit-window-configurations
  :bind (("C-q" . other-window-or-split)
		 ("C-x 3" . my:split-window-right)
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

  (defun my:split-window-right ()
	"With turn on dimmer."
	(interactive)
	(split-window-right)
	(follow-mode 1)
	(dimmer-mode 1))

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
	(when (one-window-p)
	  (dimmer-mode -1)))

  (defun my:delete-other-windows ()
	"With turn off dimmer."
	(interactive)
	(delete-other-windows)
	(dimmer-mode -1))

  (defun kill-other-buffers ()
	"Kill all other buffers."
	(interactive)
	(mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
	(message "killl-other-buffers!")))
```
長行のファイルを画面分割で見るのに便利な `follow-mode` も有効にしています。
