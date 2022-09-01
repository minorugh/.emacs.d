;;; 50_org-mode.el --- Org mode configurations. -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:
;;; Code:
;; (setq debug-on-error t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Calendar configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(leaf calendar
  :leaf-defer t
  :bind (("<f7>" . calendar)
		 (:calendar-mode-map
		  ("<f7>" . calendar-exit)))
  :config
  (leaf japanese-holidays
	:ensure t
	:require t
	:hook ((calendar-today-visible-hook . japanese-holiday-mark-weekend)
		   (calendar-today-invisible-hook . japanese-holiday-mark-weekend)
		   (calendar-today-visible-hook . calendar-mark-today))
	:config
	(setq calendar-holidays
		  (append japanese-holidays holiday-local-holidays holiday-other-holidays))
	(setq calendar-mark-holidays-flag t)))


(provide '50_org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 50_org-mode.el ends here
