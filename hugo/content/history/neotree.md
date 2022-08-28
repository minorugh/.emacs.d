+++
title = "9.7. neotree"
draft = false
+++
## [neotree.el] Emacs 上でディレクトリツリーを表示させる

🔗 [jaypei/emacs-neotree: A Emacs tree plugin like NerdTree for Vim.](https://github.com/jaypei/emacs-neotree) 

最近は、`Dired` よりももっぱらこちらを愛用している。`Rename`, `Delete` などの簡単なコマンドも使えて便利。

```elisp
(leaf neotree
  :ensure t
  :bind (("<f10>" . neotree-find)
		 (:neotree-mode-map
		  ("RET" . neotree-enter-hide)
		  ("a" . neotree-hidden-file-toggle)
		  ("<left>" . neotree-select-up-node)
		  ("<right>" . neotree-change-root)
		  ("<f10>" . neotree-toggle)))
  :custom
  `((neo-keymap-style . 'concise)
    (neo-create-file-auto-open . t)))
```
アイコンは `all-the-icons` より `doom-themes` の拡張設定のほうがシンプルで見やすい。

```elisp
;; doom-themes 
(doom-themes-neotree-config)
```

### カスタマイズ設定
ツリーバッファーでRETを押したらツリーを自動で閉じるように設定している。

```elisp
(with-eval-after-load neotree
  ;; Change neotree's font size
  ;; Tips from https://github.com/jaypei/emacs-neotree/issues/218
  (defun neotree-text-scale ()
	"Neotree text scale."
	(interactive)
	(text-scale-adjust 0)
	(text-scale-decrease 0.8)
	(message nil))
  (add-hook 'neo-after-create-hook
			(lambda (_)
			  (call-interactively 'neotree-text-scale)))

  ;; neotree enter hide
  ;; Tips from https://github.com/jaypei/emacs-neotree/issues/77
  (defun neo-open-file-hide (full-path &optional arg)
	"Neotree enter hide with FULL-PATH ARG."
	(neo-global--select-mru-window arg)
	(find-file full-path)
	(neotree-hide))

  (defun neotree-enter-hide (&optional arg)
	"Neotree enter hide with ARG."
	(interactive "P")
	(neo-buffer--execute arg 'neo-open-file-hide 'neo-open-dir)))
```
