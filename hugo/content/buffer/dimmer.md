+++
title = "dimmer"
draft = false
+++


[takaxp.github.io](https://takaxp.github.io/init.html#org8ba0784e) の設定をそのままパクリました。
on/off できるのが快適です。

`global` 設定にすると多くのシーンでDisable対策の設定が必要になり面倒です。下記の通り発想転換すれば呪いから逃れることができます。

* 画面分割を発動するときに `dimmer-on`
* 画面分割を閉じるときに `dimmer-off`

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
