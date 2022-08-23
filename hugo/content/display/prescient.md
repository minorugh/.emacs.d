+++
title = "7.. calendar"
draft = false
+++

### 6.13. [prescient.el] リスト項目の並び替えとイニシャル入力機能（ivy and company）
コマンド履歴を保存、コマンドのイニシャル入力を可能にする。

```code
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
