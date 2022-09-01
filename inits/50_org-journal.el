;;; 50_org-journal.el --- Org journal mode configurations. -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:
;;; Code:
;; (setq debug-on-error t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-journal configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(leaf org-journal
  :doc "https://www.emacswiki.org/emacs/OrgJournal"
  :ensure t
  :hook (find-file-hook . my:journal-auto-darkroom)
  :chord (",," . hydra-journal/body)
  :bind ((:org-journal-mode-map
		  ("<muhenkan>" . org-journal-save-entry-and-exit))
		 ("C-c j" . org-journal-new-entry)
		 ("C-c t" . journal-file-today)
		 ("C-c y" . journal-file-yesterday))
  :custom `((org-journal-dir . "~/Dropbox/org/journal/")
			(org-journal-file-format . "%Y%m%d.org")
			(org-journal-date-format . "%Y-%m-%d (%A)")
			(org-journal-find-file . 'find-file))
  :hydra
  (hydra-journal
   (:color red :hint nil)
   "
    Journal…   New._,_   Task._;_   昨日.今日.未来:_[__.__]_   Search._@_   Func._:_   Quit._/_"
   ("," org-journal-new-entry)
   (";" org-journal-new-scheduled-entry)
   ("]" my:org-journal-schedule-view)
   ("." journal-file-today)
   ("[" journal-file-yesterday)
   (":" my:journal-function)
   ("@" org-journal-search-forever)
   ("/" open-dashboard :exit t))
  :config
  (defun my:org-journal-schedule-view ()
	"Turn on `darkroom', disable to `line-numbers' & `view-mode'."
	(interactive)
	(org-journal-schedule-view)
	(darkroom-mode 1)
	(display-line-numbers-mode 0)
	(view-mode 0))

  (defun get-journal-file-today ()
	"Gets filename for today's journal entry."
	(let ((daily-name (format-time-string "%Y%m%d.org")))
      (expand-file-name (concat org-journal-dir daily-name))))

  (defun journal-file-today ()
	"Creates and load a journal file based on today's date."
	(interactive)
	(find-file (get-journal-file-today)))

  (defun get-journal-file-yesterday ()
	"Gets filename for yesterday's journal entry."
	(let* ((yesterday (time-subtract (current-time) (days-to-time 1)))
           (daily-name (format-time-string "%Y%m%d.org" yesterday)))
      (expand-file-name (concat org-journal-dir daily-name))))

  (defun journal-file-yesterday ()
	"Creates and load a file based on yesterday's date."
	(interactive)
	(find-file (get-journal-file-yesterday)))

  (defun org-journal-save-entry-and-exit()
	"Simple convenience function.
  Saves the buffer of the current day's entry and kills the window
  Similar to org-capture like behavior"
	(interactive)
	(save-buffer)
	(kill-buffer-and-window))

  (defun org-journal-file-header-func (time)
	"Custom function to create journal header."
	(concat
	 (pcase org-journal-file-type
       (`daily "#+STARTUP: content indent inlineimages"))))
  (setq org-journal-file-header 'org-journal-file-header-func))

(defun my:journal-function ()
  "Search Journal functions with counsel."
  (interactive)
  (counsel-M-x "^org-journal-"))

;; Auto Darkroom for journal dir
(defvar my:journal-dirs nil)
(add-to-list 'my:journal-dirs "~/Dropbox/org/journal/")

(defun my:journal-auto-darkroom ()
  "Enable `darkroom', disable `line-numbers'."
  (interactive)
  (dolist (dir my:journal-dirs)
	(when (eq 0 (string-match (expand-file-name dir) buffer-file-name))
	  (darkroom-mode 1)
	  (display-line-numbers-mode 0))))


(provide '50_org-journal)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 50_org-journal.el ends here
