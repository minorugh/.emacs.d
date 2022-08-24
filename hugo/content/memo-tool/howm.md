+++
title = "12.1. howm-modo"
draft = false
+++

### Howm Mode
Howm-menuは使わないので `howm-list-all` を初期画面として使っています。

この画面からでも [新規(c)] [検索(s)] ほか一連のhowmコマンドは全て使えます。

```elisp
(leaf howm
  :ensure t
  :hook ((emacs-startup-hook . howm-mode)
         ())
  :chord ("@@" . howm-list-all)
  :init
  (setq howm-view-title-header "#")
  (defun my:howm-create-file ()
    "Make howm create file with 'org-capture'."
    (interactive)
    (format-time-string "~/Dropbox/howm/%Y/%m/%Y%m%d%H%M.md" (current-time)))
  :config
  (bind-key [backtab] 'howm-view-summary-previous-section howm-view-summary-mode-map)
  (setq howm-directory "~/Dropbox/howm")
  (setq howm-view-split-horizontally t)
  (setq howm-view-summary-persistent nil)
  (setq howm-normalizer 'howm-sort-items-by-reverse-date)
  (setq howm-user-font-lock-keywords
		'(("memo:" . (0 'gnus-group-mail-3))
		  ("note:" . (0 'epa-mark)))))
```
