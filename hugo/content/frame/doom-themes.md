+++
title = "5.7. doom-thmes"
draft = false
weight = 7
+++

```emacs-lisp
(leaf doom-themes
  :ensure t
  :hook (after-init-hook . (lambda () (load-theme 'doom-dracula t)))
  :custom
  (doom-themes-enable-italic . nil)
  (doom-themes-enable-bold . nil)
  :config
  (doom-themes-neotree-config)
  (doom-themes-org-config))
```
