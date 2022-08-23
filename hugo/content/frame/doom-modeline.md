+++
title = "5.8. doom-modeline"
draft = false
weight = 8
+++

```emacs-lisp
(leaf doom-modeline
  :ensure t
  :hook (after-init-hook . doom-modeline-mode)
  :custom
  (doom-modeline-icon . t)
  (doom-modeline-major-mode-icon . nil)
  (doom-modeline-minor-modes . nil)
  :config
  (line-number-mode 0)
  (column-number-mode 0)
  (doom-modeline-def-modeline 'main
    '(bar window-number matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs checker))
  :init
  (leaf nyan-mode
	:ensure t
	:config
	(nyan-mode 1)
	(nyan-start-animation)))
```
