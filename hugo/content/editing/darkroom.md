+++
title = "7.5. darkroom"
draft = false
+++

### [darkroom-mode.el] 執筆モード
🔗 [joaotavora/darkroom: Simple distraction-free editing.](https://github.com/joaotavora/darkroom)

画面の余計な項目を最小限にして、文章の執筆に集中できるようにするパッケージです。

[F12] キーで モードのIN/OUT をトグルしています。

`darkroom-mode` から抜けるときは、`revert-buffer` で再読込してもとに戻します。`yes/no`確認を聞かれるのが煩わしいので `my:revery-buffer-no-confirm` の関数を作りました。

```elisp
(leaf darkroom
  :ensure t
  :bind (("<f12>" . my:darkroom-in)
		 (:darkroom-mode-map
		  ("<f12>" . my:darkroom-out)))
  :config
  (defun my:darkroom-in ()
	"Enter to the `darkroom-mode'."
	(interactive)
	(view-mode 0)
	(diff-hl-mode 0)
	(display-line-numbers-mode 0)
	(darkroom-tentative-mode 1)
	(setq-local line-spacing 0.4))

  (defun my:darkroom-out ()
	"Returns from `darkroom-mode' to the previous state."
	(interactive)
	(my:linespacing)
	(darkroom-tentative-mode 0)
	(display-line-numbers-mode 1)
	(my:revert-buffer-no-confirm))

  (defun my:revert-buffer-no-confirm ()
	"Revert buffer without confirmation."
	(interactive)
	(revert-buffer t t)))
```
