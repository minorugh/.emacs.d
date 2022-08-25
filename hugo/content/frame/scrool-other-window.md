+++
title = "5.3. scrool-other-window"
draft = false
+++
### deactiveなwindowをスクロールさせる

`scrool-other-window` は、`deactive` なwindowをスクロールさせるための設定です。

通常 `<next>` / `<prior>` は、PgUp / PgDn として使うが、画面分割のときは `other-Window` に対応させている。

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
