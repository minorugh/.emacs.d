+++
date = "2022-08-29T06:00:38+09:00"
title = "11.2. org-capture"
draft = false
weight = 2
+++
## [org-mode] ごくシンプルに使う設定 

メモ書きは、`howm`メインなのですが、自動タグ挿入を兼ねてメニュー代わりに `org-capture` を利用しています。

`org-capture` から`howm-create` や `org-journal` を発動できるように `org-capture-template` を作りました。

`org-capture` からだとデフォルトでは、画面が半分（othe-window）になるのがいやなので、最大化で開くように変更しています。

`dashboard`画面に簡単なタスクを表示させるために `org-agenda` も使っています。

```elisp
(leaf org
  :hook ((emacs-startup-hook . (lambda () (require 'org-protocol)))
		 (org-capture-mode-hook . delete-other-windows))
  :chord (",," . org-capture)
  :bind (("C-c a" . org-agenda)
		 ("C-c c" . org-capture)
		 ("C-c o" . org-open-at-point)
		 ("C-c i" . org-edit-src-exit)
		 (:org-mode-map
		  ("C-c i" . org-edit-special)))
  :custom `((org-log-done . 'time)
			(timep-use-speed-commands . t)
			(org-src-fontify-natively . t)
			(org-agenda-files . '("~/Dropbox/org/journal/"))
			(org-agenda-span . 30))
  :config
  ;; For `howm-create' from org-capture
  (defun my:howm-create-file ()
	"Howm create file for 'org-capture'."
	(interactive)
	(format-time-string "~/Dropbox/howm/%Y/%m/%Y%m%d%H%M.md" (current-time)))

  ;; For `org-journal-new-entry' from org-capture
  (defun org-journal-find-location ()
	"Insert a heading and open today's journal."
	(org-journal-new-entry t)
	(unless (eq org-journal-file-type 'daily)
      (org-narrow-to-subtree))
	(goto-char (point-min)))

  (defvar org-journal--date-location-scheduled-time nil)
  (defun org-journal-date-location (&optional scheduled-time)
	"Schedule tasks for future date."
	(let ((scheduled-time (or scheduled-time (org-read-date nil nil nil "Date:"))))
      (setq org-journal--date-location-scheduled-time scheduled-time)
      (org-journal-new-entry t (org-time-string-to-time scheduled-time))
      (unless (eq org-journal-file-type 'daily)
		(org-narrow-to-subtree))
      (goto-char (point-max))))

  ;; Caputure Settings
  (setq org-capture-templates
		'(("m" " Howm memo" plain (file my:howm-create-file)
		   "# memo: %?\n%U %i")
		  ("t" " Howm tech" plain (file my:howm-create-file)
		   "# note: %?\n%U %i")
		  ("j" " Journal entry" entry (function org-journal-find-location)
           "* %(format-time-string org-journal-time-format)%i%?")
		  ("e" " Journal emacs" entry (function org-journal-find-location)
           "* %(format-time-string org-journal-time-format)emacs: %i%?")
		  ("s" " Journal schedule" plain (function org-journal-date-location)
           "** TODO %?\n <%(princ org-journal--date-location-scheduled-time)>\n"
           :jump-to-captured t)
		  ("p" " Code capture by protocol" entry (file+headline "~/Dropbox/org/capture.org" "Code")
		   "* %^{Title} \nSOURCE: %:link\nCAPTURED: %U\n\n#+BEGIN_SRC\n%i\n#+END_SRC\n" :prepend t)
		  ("L" " Link capture by pritocol" entry (file+headline "~/Dropbox/org/capture.org" "Link")
		   "* [[%:link][%:description]] \nCAPTURED: %U\nREMARKS: %?" :prepend t)))

  ;; Maximize the org-capture buffer
  (defvar my:org-capture-before-config nil
	"Window configuration before 'org-capture'.")
  (defadvice org-capture (before save-config activate)
	"Save the window configuration before 'org-capture'."
	(setq my:org-capture-before-config (current-window-configuration))))
```

