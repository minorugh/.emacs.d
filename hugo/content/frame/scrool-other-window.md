+++
title = "5.3. scrool-other-Window"
draft = false
weight = 3
+++

`Scrool-other-Window` は、`deactive` なwindowをスクロールさせるための設定です。

一画面のとき `<next>` / `<prior>` は、PgUp / PgDn として使うが、画面分割のときだけ `other-Window` に対応させている。
標準機能の `C-v: scroll-uo-command` / `M-v: scroll-down-command` を使い分ければ快適に二画面同時閲覧が可能となる。

```elisp
(leaf *my:scroll-other-window
  :bind (("<next>" . my:scroll-other-window)
		 ("<prior>" . my:scroll-other-window-down))
  :init
  (defun my:scroll-other-window ()
	"If there are two windows, `scroll-other-window'."
	(interactive)
	(when (one-window-p)
	  (scroll-up))
	(scroll-other-window))

  (defun my:scroll-other-window-down ()
	"If there are two windows, `scroll-other-window-down'."
	(interactive)
	(when (one-window-p)
	  (scroll-down))
	(scroll-other-window-down)))
```
