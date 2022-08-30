;;; 50_journal.el --- Org journal mode configurations. -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:
;;; Code:
;; (setq debug-on-error t)

(leaf org-journal
  :doc "https://www.emacswiki.org/emacs/OrgJournal"
  :ensure t
  :hook (emacs-startup-hook . org-journal-mode)
  :chord (";;" . hydra-journal/body)
  :bind (("C-c j" . org-journal-new-entry)
		 ("C-c t" . journal-file-today)
		 ("C-c y" . journal-file-yesterday))
  :custom `((org-journal-dir . "~/Dropbox/howm/journal/")
			(org-journal-file-format . "%Y%m%d")
			(org-journal-date-format . "%Y-%m-%d (%A)"))
  :hydra
  (hydra-journal
   (:color red :hint nil)
   "
    Journal: 新規_;_   昨日.今日: _[_._]_    Task: 新規_._  一覧_,_   : _@_    window: _0_._1_._/_"
   (";" org-journal-new-entry)
   ("." org-journal-new-scheduled-entry)
   ("," my:org-journal-schedule-view)
   ("]" journal-file-today)
   ("[" journal-file-yesterday)
   ("@" my:journal-command)
   ("/" kill-this-buffer :exit t)
   ("0" delete-window :exit t)
   ("1" delete-other-windows :exit t))
  :preface
  (defun get-journal-file-today ()
    "Gets filename for today's journal entry."
    (let ((daily-name (format-time-string "%Y%m%d")))
      (expand-file-name (concat org-journal-dir daily-name))))

  (defun journal-file-today ()
	"Creates and load a journal file based on today's date."
	(interactive)
	(find-file (get-journal-file-today)))

  (defun get-journal-file-yesterday ()
	"Gets filename for yesterday's journal entry."
	(let* ((yesterday (time-subtract (current-time) (days-to-time 1)))
           (daily-name (format-time-string "%Y%m%d" yesterday)))
      (expand-file-name (concat org-journal-dir daily-name))))

  (defun journal-file-yesterday ()
	"Creates and load a file based on yesterday's date."
	(interactive)
	(find-file (get-journal-file-yesterday)))

  (defun my:org-journal-schedule-view ()
	(interactive)
	(org-journal-schedule-view)
	(delete-other-windows))

  (defun my:journal-command ()
	(interactive)
	(counsel-M-x "^org-journal-")))


(provide '50_org-journal)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 50_journal.el ends here
