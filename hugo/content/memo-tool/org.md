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
		 ("C-c k" . org-capture-kill)
		 ("C-c o" . org-open-at-point)
		 ("C-c i" . org-edit-src-exit)
		 (:org-mode-map
		  ("C-c i" . org-edit-special)))
  :custom `((org-log-done . 'org)
			(timep-use-speed-commands . t)
			(org-src-fontify-natively . t)
			(org-startup-indented . t)
			(org-hide-leading-stars . t)
			(org-startup-folded . 'content)
			(org-indent-mode-turns-on-hiding-stars . nil)
			(org-indent-indentation-per-level . 4)
			(org-startup-folded . 'content)
			(org-agenda-files . '("~/Dropbox/org/task.org"))
			(org-agenda-span . 30))
  :config
  (defun my:howm-create-file ()
	"Make howm create file with 'org-capture'."
	(interactive)
	(format-time-string "~/Dropbox/howm/%Y/%m/%Y%m%d%H%M.md" (current-time)))
  (defun org-journal-find-location ()
	(org-journal-new-entry t)
	(goto-char (point-min)))
  ;; Caputure Settings
  (setq org-capture-templates
		'(("m" " Memo with howm" plain (file my:howm-create-file)
		   "# memo: %?\n%U %i")
		  ("n" " Note with howm" plain (file my:howm-create-file)
		   "# note: %?\n%U %i")
		  ("j" " Journal entry" entry (function org-journal-find-location)
           "* %(format-time-string org-journal-time-format)journal\n%i%?")
		  ("e" " Journal emacs" entry (function org-journal-find-location)
           "* %(format-time-string org-journal-time-format)emacs\n%i%?")
		  ("s" " Schedule" entry (file+headline "~/Dropbox/org/task.org" "TASK")
		   "** %?\n SCHEDULED: %^t \n" :empty-lines 1 :jump-to-captured 1)
		  ("e" " Experiment" entry (file+headline "~/Dropbox/org/experiment.org" "Experiment")
		   "* %? %i\n#+BEGIN_SRC perl\n\n#+END_SRC\n\n%U")
		  ("p" " Code capture by protocol" entry (file+headline "~/Dropbox/org/capture.org" "Code")
		   "* %^{Title} \nSOURCE: %:link\nCAPTURED: %U\n\n#+BEGIN_SRC\n%i\n#+END_SRC\n" :prepend t)
		  ("L" " Link capture by pritocol" entry (file+headline "~/Dropbox/org/capture.org" "Link")
		   "* [[%:link][%:description]] \nCAPTURED: %U\nREMARKS: %?" :prepend t)))
  (setq org-refile-targets
		'(("~/Dropbox/org/archives.org" :level . 1)
		  ("~/Dropbox/org/remember.org" :level . 1)
		  ("~/Dropbox/org/task.org" :level . 1)))

  ;; Maximize the org-capture buffer
  (defvar my:org-capture-before-config nil
	"Window configuration before 'org-capture'.")
  (defadvice org-capture (before save-config activate)
	"Save the window configuration before 'org-capture'."
	(setq my:org-capture-before-config (current-window-configuration))))
```

