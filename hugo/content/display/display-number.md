+++
title = "7.4. display-line-numbers"
draft = false
+++
### [display-line-number] 行番号を表示

Emacsで左側に行数を表示する`linum-mode` は重いことで有名だった。 
軽くするためにはいろいろと設定しなくてはいけなかった。Emacs26でついに行数表示のネイティブ実装である `diplay-line-numbers-mode` が実装されたのでそちらを使います。.

```elisp
(leaf display-line-numbers
  :hook ((after-init-hook . global-display-line-numbers-mode)
		 ((lisp-interaction-mode-hook dired-mode-hook). my:disable-modes))
  :bind ("<f9>" . display-line-numbers-mode)
  :custom (display-line-numbers-width-start . t)
  :init
  (defun my:disable-modes ()
	"Disable modes in scrtch buffer."
	(interactive)
	(display-line-numbers-mode 0)
	(flymake-mode 0)
	(nyan-mode 0)))
```
