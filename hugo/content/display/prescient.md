+++
title = "7.5. prescient"
draft = false
+++
### [prescient.el] リスト項目の並び替えとイニシャル入力機能（ivy and company）
🔗 [radian-software/prescient.el: Simple but effective sorting and filtering for Emacs.](https://github.com/radian-software/prescient.el) 

コマンド履歴を保存、コマンドのイニシャル入力を可能にする。

```elisp
(leaf prescient
  :ensure t
  :hook (after-init-hook . prescient-persist-mode)
  :custom
  `((prescient-aggressive-file-save . t)
	(prescient-save-file . "~/.emacs.d/tmp/prescient-save"))
  :init
  (with-eval-after-load 'prescient
	(leaf ivy-prescient :ensure t :global-minor-mode t)
	(leaf company-prescient :ensure t :global-minor-mode t)))
```
