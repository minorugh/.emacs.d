+++
title = "9.1. auto-save-buffer-enhanced"
draft = false
+++
* `auto-save-buffer-enhanced` は、ファイルの自動保存機能を提供します。
* [kentaro/auto-save-buffer-enhanced.el: Provide file autosave in Emacs](https://github.com/kentaro/auto-save-buffers-enhanced) 

```elisp
;; auto-save-buffers
(leaf auto-save-buffers-enhanced
  :ensure t
  :custom
  `((auto-save-buffers-enhanced-exclude-regexps . '("^/ssh:" "^/scp:" "/sudo:"))
	(auto-save-buffers-enhanced-quiet-save-p . t)
	;; Disable to prevent freeze in tramp-mode
	(auto-save-buffers-enhanced-include-only-checkout-path . nil))
  :config
  (auto-save-buffers-enhanced t))
```
