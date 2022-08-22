+++
title = "all-the-icons"
draft = false
+++

```emacs-lisp
(leaf display-line-numbers
  :hook ((after-init-hook . global-display-line-numbers-mode)
		 (lisp-interaction-mode-hook dired-mode-hook). my:disable-modes)
  :bind ("<f9>" . display-line-numbers-mode)
  :custom (display-line-numbers-width-start . t)
  :init
  (defun my:disable-modes ()
	"Disable modes in scrtch buffer."
	(interactive)
	(display-line-numbers-mode 0)
	(flymake-mode 0)))
```
