+++
date = "2022-08-29T06:00:38+09:00"
title = "11.1. howm"
draft = false
weight = 1
+++

## [howm.el] お手軽メモ環境
🔗 [howm: Write fragmentarily and read collectively.](https://howm.osdn.jp/) 

メモ書きに特化した使い方なので`howm-menu` は使わない。
`howm-list-all` の一覧画面をよく使うが、ここからでも一連のワンキーコマンドは全て使える。

タイトルの行頭にタグ（memo: note: など）を自動挿入して `howm-create`出来るように設定していて色付もしている。お好みだけれど私は自動的に執筆モードになるようにしている。

```elisp
(leaf howm
  :ensure t
  :hook (after-init-hook . howm-mode)
  :bind ((:howm-view-summary-mode-map
		  ([backtab] . howm-view-summary-previous-section)
		  ("<return>" . howm-view-summary-open)
		  ("," . my:howm-create-memo)
		  ("t" . my:howm-create-tech)))
  :init
  (setq howm-view-title-header "#"
		howm-directory "~/Dropbox/howm"
		howm-file-name-format "%Y/%m/%Y%m%d%H%M.md")
  :custom `((howm-view-split-horizontally . t)
			(howm-view-summary-persistent . nil)
			(howm-normalizer . 'howm-sort-items-by-reverse-date)
			(howm-user-font-lock-keywords
			 . '(("memo:" . (0 'compilation-error))
				 ("tech:" . (0 'compilation-info)))))
  :config
  (setq howm-template '("# %title%cursor\n%date%file"
						"# memo: %cursor\n%date%file"
						"# tech: %cursor\n%date%file"))
  (defun my:howm-create-memo ()
    "Create by inserting tags automatically."
	(interactive)
	(howm-create 2 nil)
	(my:darkroom-mode-hook)
	(delete-other-windows))

  (defun my:howm-create-tech ()
    "Create by inserting tags automatically."
	(interactive)
	(howm-create 3 nil)
	(my:darkroom-mode-hook)
	(delete-other-windows))

  (defun my:darkroom-mode-hook ()
	"For `darkroom-mode-hook'."
	(interactive)
	(darkroom-mode 1)
	(display-line-numbers-mode 0)))
```
