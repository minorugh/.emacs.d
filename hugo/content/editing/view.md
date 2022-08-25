+++
title = "7.2. veiw-mode"
draft = false
+++
### [view-mode] ファイル閲覧モード（標準機能）
[view-mode](https://www.emacswiki.org/emacs/ViewMode) はビルトインの機能です。

特定の拡張子に対して常に `view-mode` で開きたいときやgzされた `elisp`ソースを見るときに使います。

下記の設定では、`my:auto-view-dirs` に追加したディレクトリのファイルを開くと連携して `view-mode` が有効になります．

```elisp
(leaf view
  :hook
  (find-file-hook . my:auto-view)
  (server-visit-hook . my:unlock-view-mode)
  :chord ("::" . view-mode)
  :bind (:view-mode-map
		 ("h" . backward-char)
		 ("l" . forward-char)
		 ("a" . beginning-of-buffer)
		 ("e" . end-of-buffer)
		 ("w" . forward-word)
		 ("b" . scroll-down)
		 ("c" . kill-ring-save)
		 ("r" . xref-find-references)
		 ("RET" . xref-find-definitions)
		 ("x" . my:view-del-char)
		 ("y" . my:view-yank)
		 ("d" . my:view-kill-region)
		 ("u" . my:view-undo)
		 ("m" . magit-status)
		 ("g" . my:google)
		 ("s" . swiper-region)
		 ("%" . my:jump-brace)
		 ("@" . counsel-mark-ring)
		 ("n" . my:org-view-next-heading)
		 ("p" . my:org-view-previous-heading)
		 ("o" . other-window-or-split)
		 ("G" . end-of-buffer)
		 ("0" . my:delete-window)
		 ("1" . my:delete-other-windows)
		 ("2" . my:split-window-below)
		 ("+" . text-scale-increase)
		 ("-" . text-scale-decrease)
		 ("/" . (lambda ()(interactive)(text-scale-set 0)))
		 ("_" . kill-other-buffers)
		 (":" . View-exit-and-edit)
		 ("i" . View-exit-and-edit)
		 ("]" . winner-undo)
		 ("[" . winner-redo)
		 ("." . hydra-view/body)
		 ("?" . hydra-view/body))
  :init
  ;; Specific extension / directory
  (defvar my:auto-view-regexp "\\.php\\|\\.pl\\|\\.el.gz?\\|\\.tar.gz?\\'")

  ;; Specific directory
  (defvar my:auto-view-dirs nil)
  (add-to-list 'my:auto-view-dirs "~/src/")
  (add-to-list 'my:auto-view-dirs "~/Dropbox/GH/")
  (add-to-list 'my:auto-view-dirs "/scp:xsrv:/home/minorugh/")

  (defun my:auto-view ()
	"Open a file with view mode."
	(when (file-exists-p buffer-file-name)
	  (when (and my:auto-view-regexp
				 (string-match my:auto-view-regexp buffer-file-name))
		(view-mode 1))
	  (dolist (dir my:auto-view-dirs)
		(when (eq 0 (string-match (expand-file-name dir) buffer-file-name))
		  (view-mode 1)))))

  (defun my:unlock-view-mode ()
	"Unlock view mode with git commit."
	(when (string-match "COMMIT_EDITMSG" buffer-file-name)
	  (view-mode 0))))
```

### [viewer.el] モードラインの色を変える
🔗 [rubikitch/viewer: Emacs view-mode extension.](https://github.com/rubikitch/viewer) 

`view-mode` のときにモードラインの色を変えるのは `viewer.el`を使うと設定が簡単です。

```elisp
;; Change-modeline-color
(leaf viewer
  :ensure t
  :hook (view-mode-hook . viewer-change-modeline-color-setup)
  :custom `((viewer-modeline-color-view . "#852941")
	        (viewer-modeline-color-unwritable . "#2F6828")))
```

### カスタマイズコマンド
`view-mode` からでも簡単な編集ができるように `vim like` なコマンドをいくつか作りました。

```elisp
(with-eval-after-load 'view
  ;; save-buffer no message
  (defun my:save-buffer ()
	"With clear Wrote message."
	(interactive)
	(save-buffer)
	(message nil))

  ;; Like as 'x' of vim
  (defun my:view-del-char ()
	"Delete charactor in view mode."
	(interactive)
	(view-mode 0)
	(delete-char 1)
	(my:save-buffer)
	(view-mode 1))

  ;; Like as 'dd' of vim
  (defun my:view-kill-region ()
	"If the region is active, to kill region.
If the region is inactive, to kill whole line."
	(interactive)
	(view-mode 0)
	(if (use-region-p)
		(kill-region (region-beginning) (region-end))
	  (kill-whole-line))
	(my:save-buffer)
	(view-mode 1))

  ;; Like as 'u' of vim
  (defun my:view-undo ()
	"Undo in view mode."
	(interactive)
	(view-mode 0)
	(undo)
	(my:save-buffer)
	(view-mode 1))

  ;; Like as 'y' of vim
  (defun my:view-yank ()
	"Yank in view mode."
	(interactive)
	(view-mode 0)
	(yank)
	(my:save-buffer)
	(view-mode 1))

  ;; Like as '%' of vim
  (defun my:jump-brace ()
	"Jump to the corresponding parenthesis."
	(interactive)
	(let ((c (following-char))
		  (p (preceding-char)))
	  (if (eq (char-syntax c) 40) (forward-list)
		(if (eq (char-syntax p) 41) (backward-list)
		  (backward-up-list)))))

  (defun my:org-view-next-heading ()
	"Org-view-next-heading."
	(interactive)
	(if (and (derived-mode-p 'org-mode)
			 (org-at-heading-p))
		(org-next-visible-heading 1)
	  (next-line)))

  (defun my:org-view-previous-heading ()
	"Org-view-previous-heading."
	(interactive)
	(if (and (derived-mode-p 'org-mode)
			 (org-at-heading-p))
		(org-previous-visible-heading 1)
	  (previous-line))))
```

