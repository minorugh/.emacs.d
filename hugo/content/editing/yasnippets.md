+++
title = "7.7. yasunippets"
draft = false
+++
### [yasnippets.el] テンプレート システム
[joaotavora/yasnippet: Template system for Emacs.](https://github.com/joaotavora/yasnippet) 
 
```elisp
(leaf yasnippet
  :ensure t
  :hook (after-init-hook . yas-global-mode)
  :config
  (leaf yasnippet-snippets :ensure t))
```
