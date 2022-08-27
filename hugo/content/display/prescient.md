+++
title = "7.5. prescient"
draft = false
+++
### [prescient.el] リスト項目の並び替えとイニシャル入力機能（ivy and company）
🔗 [radian-software/prescient.el: Simple but effective sorting and filtering for Emacs.](https://github.com/radian-software/prescient.el) 

`prescient.el` は、`ivy` や `company` などのパッケージを使用したときに表示される候補のリストをソートおよびフィルタリングするライブラリです。

`ivy-prescient.el` や `company-prescient.el` などの拡張パッケージは、さまざまなフレームワークで使用できるようにライブラリを適合させます。

コマンド履歴を保存していて、コマンドのイニシャル入力も可能にします。例えば `counsel-M-x` で `cc` と入力すると `company-compile` が真っ先にヒットします。これなしではやっていけない体質になりました。
 
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
