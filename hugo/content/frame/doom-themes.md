+++
title = "5.7. doom-thmes"
draft = false
+++
### [doom-thems.el] テーマ設定
[doomemacs/themes: Doom Emacs' Theme Pack.](https://github.com/doomemacs/themes) 

* わんさかとthemeファイルがパックされています。自分は、`doom-dracula` を愛用しています。

```emacs-lisp
(leaf doom-themes
  :ensure t
  :hook (after-init-hook . (lambda () (load-theme 'doom-dracula t)))
  :custom
  (doom-themes-enable-italic . nil)
  (doom-themes-enable-bold . nil)
  :config
  (doom-themes-neotree-config)
  (doom-themes-org-config))
```

### [cycle-custom-themes] 複数テーマを切り替えて使う
作業用途によってテーマを変える設定です。
いまは使ってません。

```elisp
(leaf cycle-custom-theme
  :doc "https://bre.is/5tE2BvUp"
  :config
  (setq my:themes (list 'doom-dracula 'iceberg 'doom-solarized-light))
  (setq curr-theme my:themes)
  (defun cycle-custom-theme ()
    "Switch themes to cycle."
 	(interactive)
 	(disable-theme (car curr-theme))
    (setq curr-theme (cdr curr-theme))
    (if (null curr-theme) (setq curr-theme my:themes))
 	(load-theme (car curr-theme) t)
 	(message "%s" (car curr-theme)))
  (load-theme (car curr-theme) t)
  :init
  (leaf iceberg-theme
 	:doc "modified version for myself"
 	:el-get minorugh/iceberg-theme)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/iceberg-theme/"))
```
