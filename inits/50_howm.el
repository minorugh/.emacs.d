;;; 50_howm.el --- howm mode configurations. -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:
;;; Code:
;; (setq debug-on-error t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Howm configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(leaf howm
  :ensure t
  :hook (after-init-hook . howm-mode)
  :bind (:howm-view-summary-mode-map
		 ("<return>" . my:howm-summary-view-mode-open)
		 ([backtab] . howm-view-summary-previous-section))
  :init
  (setq howm-view-title-header "#"
		howm-directory "~/Dropbox/howm"
		howm-file-name-format "%Y/%m/%Y%m%d%H%M.md")
  :custom `((howm-view-split-horizontally . t)
			(howm-view-summary-persistent . nil)
			(howm-normalizer . 'howm-sort-items-by-reverse-date)
			(howm-user-font-lock-keywords
			 . '(("memo:" . (0 'compilation-error))
				 ("note:" . (0 'compilation-info))
				 ("tech" . (0 'font-lock-constant-face)))))
  :config
  (defun my:howm-summary-view-mode-open ()
	(interactive)
	(howm-view-summary-open)
	(view-mode 1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; open-junk-file configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(leaf open-junk-file
  :ensure t
  :custom  `((open-junk-file-format . "~/Dropbox/howm/junk/%Y%m%d.")
			 (open-junk-file-find-file-function . 'find-file)))

;; Open last created disposable file in one shot
;; https://qiita.com/zonkyy/items/eba6bc64f66d278f0032
(leaf em-glob
  :require t
  :after open-junk-file
  :config
  (defvar junk-file-dir "~/Dropbox/howm/junk/")
  (defun open-last-junk-file ()
	"Open last created junk-file."
	(interactive)
	(find-file
	 (car
	  (last (eshell-extended-glob
			 (concat
			  (file-name-as-directory junk-file-dir)
			  "*.*.*")))))))


(provide '50_howm)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 50_howm.el ends here
