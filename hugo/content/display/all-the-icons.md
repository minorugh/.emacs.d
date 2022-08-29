+++
date = "2022-08-29T05:52:08+09:00"
title = "7.2. all-the-icons"
draft = false
+++
## [all-the-icons.el] アイコン表示を可能する
🔗 [domtronn/all-the-icons.el: A utility package to collect various Icon Fonts and propertize them within Emacs.](https://github.com/domtronn/all-the-icons.el)

`all-the-icons.el` を使うとバッファ内やモードライン、ミニバッファでアイコンを表示できるようになります。

初めて使うときは、フォントインストールを促されますが、設定では自動化しています。

```emacs-lisp
(leaf all-the-icons
  :ensure t
  :after doom-modeline
  :custom (all-the-icons-scale-factor . 0.9)
  :config
  (unless (member "all-the-icons" (font-family-list))
	(all-the-icons-install-fonts t)))
```

## [all-the-icons-dired.el] diredでファイルのアイコン表示をする
🔗 [jtbm37/all-the-icons-dired](https://github.com/jtbm37/all-the-icons-dired)

Emacs27以降、MELPA版は白色にしか表示されないので、上記リンク先を`el-get`でインストールしています。

```elisp
(leaf all-the-icons-dired
  :el-get jtbm37/all-the-icons-dired
  :after doom-modeline
  :hook (dired-mode-hook . all-the-icons-dired-mode))
```
## [all-the-icons-ivy-rich.el] ivy-modeでアイコン表示をする
🔗 [seagle0128/all-the-icons-ivy-rich: Display icons for all buffers in ivy.](https://github.com/seagle0128/all-the-icons-ivy-rich) 

```elisp
(leaf all-the-icons-ivy-rich
  :ensure t
  :hook (after-init-hook . all-the-icons-ivy-rich-mode))
```

## [all-the-icons-ibuffer.el] ibuffer-modeでアイコン表示をする。
🔗 [seagle0128/all-the-icons-ibuffer: Display icons for all buffers in ibuffer.](https://github.com/seagle0128/all-the-icons-ibuffer) 

```elisp
(leaf all-the-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode-hook . all-the-icons-ibuffer-mode))
```
