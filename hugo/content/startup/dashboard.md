+++
title = "1.6. dashboard"
draft = false
+++

### [dashboard.el]起動初期画面をイケメンにする
100分の1秒でもemacsの起動を早くしようと試行錯誤している一方、せめて初期画面くらいは、ホットするようなものにしたい…ということで、`dashbord.el` を導入してみた。

[emacs-dashboard: An extensible emacs startup screen](https://github.com/emacs-dashboard/emacs-dashboard) 

![dashboard](https://camo.githubusercontent.com/de931cfbad673c47366b2a3cd8d0aa7eede1ae13899512c0d51ba731866d5c40/68747470733a2f2f6c6976652e737461746963666c69636b722e636f6d2f36353533352f35313633313934363035335f623964383438613335375f622e6a7067) 

* どのような状況からでも `dashboard`画面に戻れるように設定しています。
* `<home>` キーのトグル操作で編集中のバッファーと`dashboard`画面とを行き来します。

```elisp
(leaf dashboard
  :ensure t
  :hook ((after-init-hook . dashboard-setup-startup-hook)
		 (dashboard-mode-hook . page-break-lines-mode))
  :defun (dashboard-setup-startup-hook)
  :bind (("<home>" . open-dashboard)
		 (:dashboard-mode-map
		  ("c" . chromium-calendar)
		  ("y" . chromium-yahoo-japan)
		  ("n" . chromium-nhk-news)
		  ("w" . chromium-weather)
		  ("t" . chromium-tweetdeck)
		  ("h" . chromium-homepage)
		  ("m" . sylpheed)
		  ("s" . slack)
		  ("." . hydra-browse/body)
		  ("<home>" . quit-dashboard)))
  :advice (:override emacs-init-time ad:emacs-init-time)
  :init
  (leaf page-break-lines :ensure t)
  :config
  ;; Set the title
  (setq dashboard-banner-logo-title
		(concat "GNU Emacs " emacs-version " kernel "
				(car (split-string (shell-command-to-string "uname -r")))  " Debian "
				(car (split-string (shell-command-to-string "cat /etc/debian_version"))) " 86_64 GNU/Linux"))

  ;; Set the banner
  (setq dashboard-startup-banner (expand-file-name "emacs.png" user-emacs-directory)
		dashboard-page-separator "\n\f\f\n"
		dashboard-set-heading-icons t
		dashboard-set-file-icons t
		show-week-agenda-p t
		dashboard-items '((recents  . 5)
						  (agenda . 5)))

  ;; Set the footer
  (setq dashboard-footer-messages
		'("Always be joyful. Never stop praying. Be thankful in all circumstances."))
  (setq dashboard-footer-icon
		(all-the-icons-octicon "dashboard" :height 1.0 :v-adjust -0.05 :face 'font-lock-keyword-face))

  (defun dashboard-insert-custom (list-size)
	"Insert custom itemes LIST-SIZE."
	(interactive)
	(insert " GH: (h)    calendar: (c)    News: (n.y.w)    Mail: (m)    Slack: (s)    Twitter: (t)    (.)"))

  ;; Insert custom item
  (add-to-list 'dashboard-item-generators  '(custom . dashboard-insert-custom))
  (add-to-list 'dashboard-items '(custom) t))
```

### カスタマイズ設定
`dashbord`画面を好みにカスタマイズするためのユーザー関数です。

```elisp
;; Custom configurations
(defun dashboard-goto-recent-files ()
  "Go to recent files."
  (interactive)
  (let ((func (local-key-binding "r")))
    (and func (funcall func))))

(defvar dashboard-recover-layout-p nil
  "Wether recovers the layout.")


(defun open-dashboard ()
  "Open the *dashboard* buffer and jump to the first widget."
  (interactive)
  (if (length> (window-list-1)
			   (if (and (fboundp 'treemacs-current-visibility)
                        (eq (treemacs-current-visibility) 'visible))
				   2
				 1))
	  (setq dashboard-recover-layout-p t))
  (delete-other-windows)
  (dashboard-refresh-buffer)
  (dashboard-goto-recent-files))


(defun quit-dashboard ()
  "Quit dashboard window."
  (interactive)
  (quit-window t)
  (when (and dashboard-recover-layout-p
			 (bound-and-true-p winner-mode))
    (winner-undo)
    (setq dashboard-recover-layout-p nil)))


;; Return a string giving the duration of the Emacs initialization
(defun ad:emacs-init-time ()
  "Advice `emacs-init-time'."
  (interactive)
  (let ((str
		 (format "%.3f seconds"
				 (float-time
				  (time-subtract after-init-time before-init-time)))))
	(if (called-interactively-p 'interactive)
		(message "%s" str)
	  str)))

(defun sylpheed ()
  "Open sylpheed."
  (interactive)
  (compile "sylpheed")
  (delete-other-windows))

(defun slack ()
  "Open sylpheed."
  (interactive)
  (compile "slack")
  (delete-other-windows))
```
