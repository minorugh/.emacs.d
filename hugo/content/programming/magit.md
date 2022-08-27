+++
title = "10.5. magit"
draft = false
+++
### [magit.el] Gitクライアント
🔗 [magit/magit.el: Git user interface.](https://github.com/magit/magit/tree/master/lisp) 

`magit status` は、デフォルトでは `other-window` に表示されますが、フルフレームで表示されるようにしました。

```elisp
(leaf magit
  :ensure t
  :bind (("M-g s" . magit-status)
		 ("M-g b" . magit-blame)
		 ("M-g t" . git-timemachine-toggle))
  :hook (magit-post-refresh-hook . diff-hl-magit-post-refresh)
  :custom (transient-history-file . "~/.emacs.d/tmp/transient-history")
  :init
  (leaf diff-hl	:ensure t
	:hook ((after-init-hook . global-diff-hl-mode)
		   (after-init-hook . diff-hl-margin-mode)))

  (leaf git-timemachine	:ensure t)

  (leaf browse-at-remote :ensure t
	:custom (browse-at-remote-prefer-symbolic . nil)))
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
```


### [browse-at-remote.el]
🔗 [rmuslimov/browse-at-remote: Browse target page on github/bitbucket from emacs buffers](https://github.com/rmuslimov/browse-at-remote) 

`browse-at-remote.el` は、Git管理しているEmacsバッファーからgithubの特定リンクを瞬時に開くことができる優れものです。

