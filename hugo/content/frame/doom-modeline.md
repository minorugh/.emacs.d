+++
title = "5.8. doom-modeline"
draft = false
+++
### [doom-modeline.el]
🔗 [seagle0128/doom-modeline: A fancy and fast mode-line inspired by minimalism design.](https://github.com/seagle0128/doom-modeline) 

* [Emacsモダン化計画 -かわEmacs編](https://qiita.com/Ladicle/items/feb5f9dce9adf89652cf) の記事に触発されて以来、`doom-modeline` を愛用しています。 
* [TeMPOraL/nyan-mode.el](https://github.com/TeMPOraL/nyan-mode) も可愛くて癒やされています(^^)

```emacs-lisp
(leaf doom-modeline
  :ensure t
  :hook (after-init-hook . doom-modeline-mode)
  :custom
  (doom-modeline-icon . t)
  (doom-modeline-major-mode-icon . nil)
  (doom-modeline-minor-modes . nil)
  :config
  (line-number-mode 0)
  (column-number-mode 0)
  (doom-modeline-def-modeline 'main
    '(bar window-number matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs checker))
  :init
  (leaf nyan-mode
	:ensure t
	:config
	(nyan-mode 1)
	(nyan-start-animation)))
```
