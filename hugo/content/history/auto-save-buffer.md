+++
title = "9.1. auto-save-buffer"
draft = false
+++
## [auto-save-buffer-enhanced.el] ファイルの自動保存機能を提供
🔗 [kentaro/auto-save-buffers-enhanced: Enables auto-saving along with vcs.](https://github.com/kentaro/auto-save-buffers-enhanced) 

`auto-save-buffers-enhanced.el` は、快適かつ安全な自動保存機能を提供します。

デフォルトでは、0.5秒間入力がなければ自動で保存されます。
```elisp
(setq auto-save-buffers-enhanced-interval 0.5)
```

`Tramp` でファイル編集しているときに固まることがあるので除外設定しています。

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
