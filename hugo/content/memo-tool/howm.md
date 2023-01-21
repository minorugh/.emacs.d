+++
date = "2022-08-29T06:00:38+09:00"
title = "11.1. howm"
draft = false
weight = 1
+++

## [howm.el] お手軽メモ環境
🔗 [howm: Write fragmentarily and read collectively.](https://howm.osdn.jp/) 

スケジュール管理は全てスマホに移行したので、メモや記事の下書きなど執筆用として`howm` を利用している。

`howm-menu` は使わないので `howm-list-all` をメニュー代わりにしているが、
この一覧画面からでも `c:hown-create` をはじめ `howm-nenu` の一連のワンキーコマンドは全て使えるので便利だ。

タイトルの行頭にタグ（memo: note: など）を自動挿入して `howm-create`出来るように設定していて色付もしている。

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
  (setq howm-view-title-header "#")
  (setq howm-directory "~/Dropbox/howm")
  (setq howm-file-name-format "%Y/%m/%Y%m%d%H%M.md")
  :custom
  `((howm-view-split-horizontally . t)
	(howm-view-summary-persistent . nil)
	(howm-normalizer . 'howm-sort-items-by-reverse-date)
	(howm-user-font-lock-keywords
	 . '(("memo:" . (0 'compilation-error))
		 ;; ("note:" . (0 'compilation-info))
		 ("tech:" . (0 'compilation-info))))
	(howm-template . '("# %title%cursor\n%date%file"
					   "# memo: %cursor\n%date%file"
					   "# tech: %cursor\n%date%file")))
  :config
  (defun my:howm-create-memo ()
    "Create by inserting tags automatically."
	(interactive)
	(howm-create 2 nil)
	(delete-other-windows))

  (defun my:howm-create-tech ()
    "Create by inserting tags automatically."
	(interactive)
	(howm-create 3 nil)
	(delete-other-windows)))
```
