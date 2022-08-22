+++
title = "all-the-icons"
draft = false
+++
`all-the-icons.el` を使うとバッファ内やモードライン、ミニバッファでアイコンを表示できるようになります。

* [domtronn/all-the-icons.el: A utility package to collect various Icon Fonts and propertize them within Emacs.](https://github.com/domtronn/all-the-icons.el)

初めて使うときはパッケージを使えるようにした後、`M-x all-the-icons-install-fonts` すると自動的にフォントがインストールされます。以下の設定では自動化しています。

```emacs-lisp
(leaf display-line-numbers
  :hook ((after-init-hook . global-display-line-numbers-mode)
		 (lisp-interaction-mode-hook dired-mode-hook). my:disable-modes)
  :bind ("<f9>" . display-line-numbers-mode)
  :custom (display-line-numbers-width-start . t)
  :init
  (defun my:disable-modes ()
	"Disable modes in scrtch buffer."
	(interactive)
	(display-line-numbers-mode 0)
	(flymake-mode 0)))
```
## [all-the-icons-dired]
`dired` でファイルのアイコンを表示します。

* Emacs27以降、MELPA版は白色にしか表示されないので [jtbm37/all-the-icons-dired](https://github.com/jtbm37/all-the-icons-dired) をel-getでインストールしています。
```elisp
(leaf all-the-icons-dired
  :el-get jtbm37/all-the-icons-dired
  :after doom-modeline
  :hook (dired-mode-hook . all-the-icons-dired-mode))
```
## [all-the-icons-ivy-rich]
`ivy-mode` でアイコン表示をします。
```elisp
(leaf all-the-icons-ivy-rich
  :ensure t
  :hook (after-init-hook . all-the-icons-ivy-rich-mode))
```

## [all-the-icons-ibuffer]
`ibuffer-mode` でアイコン表示をします。
```elisp
(leaf all-the-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode-hook . all-the-icons-ibuffer-mode))
```
