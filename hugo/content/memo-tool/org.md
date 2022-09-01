+++
date = "2022-08-29T06:00:38+09:00"
title = "11.2. org-capture"
draft = false
weight = 2
+++
## [org-capture.el] ウエブページをキャプチャーする 
🔗 [sprig/org-capture-extension: A Chrome and firefox extension facilitating org-capture in emacs](https://github.com/sprig/org-capture-extension) 

メモ書きは、`howm`と`org-journal`がメインなので、GTD目的で `org-capture` を使うことはないのですが、
Google-Chrome や Firefoxの拡張機能を使って、お気に入りURLやCODEをワンクリックでEmacsにキャプチャーできるので便利に使っています。
導入法は上記リンク先に詳しいです。


```elisp
(leaf org
  :hook ((emacs-startup-hook . (lambda () (require 'org-protocol)))
		 (org-capture-mode-hook . delete-other-windows))
  :chord (";;" . org-capture)
  :bind (("C-c a" . org-agenda)
		 ("C-c c" . org-capture)
		 ("C-c k" . org-capture-kill)
		 ("C-c o" . org-open-at-point)
		 ("C-c i" . org-edit-src-exit)
		 (:org-mode-map
		  ("C-c i" . org-edit-special)))
  :custom `((org-log-done . 'time)
			(timep-use-speed-commands . t)
			(org-src-fontify-natively . t)
			(org-startup-folded . 'content)
			(org-agenda-files . '("~/Dropbox/org/journal/"))
			(org-agenda-span . 30))
  :config
  (setq org-capture-templates
		'(("m" " Memo" entry (file+headline "~/Dropbox/org/memo.org" "Memo")
		   "* %? %U %i")
		  ("i" " Idea" entry (file+headline "~/Dropbox/howm//org/idea.org" "Idea")
		   "* %? %U %i")
		  ("t" " Task" entry (file+headline "~/Dropbox/org/task.org" "TASK")
		   "** TODO %?\n SCHEDULED: %^t \n")
		  ("e" " Experiment" entry (file+headline "~/Dropbox/org/experiment.org" "Experiment")
		   "* %? %i\n#+BEGIN_SRC perl\n\n#+END_SRC\n\n%U")
		  ("p" " Code capture" entry (file+headline "~/Dropbox/org/capture.org" "Code")
		   "* %^{Title} \nSOURCE: %:link\nCAPTURED: %U\n\n#+BEGIN_SRC\n%i\n#+END_SRC\n" :prepend t)
		  ("L" " Link capture" entry (file+headline "~/Dropbox/org/capture.org" "Link")
		   "* [[%:link][%:description]] \nCAPTURED: %U\nREMARKS: %?" :prepend t)))

  (setq org-refile-targets
		(quote (("~/Dropbox/org/archives.org" :level . 1)
				("~/Dropbox/org/remember.org" :level . 1)
				("~/Dropbox/org/memo.org" :level . 1)
				("~/Dropbox/org/task.org" :level . 1)))))
```

