+++
title = "doom-thmes"
draft = false
+++

```emaxs-lisp
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
