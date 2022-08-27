+++
title = "4.9. whitespace"
draft = false
+++
### [whitespace.el] 全角スペースを強調表示する
🔗 [emacs/whitespace.el: visualize blanks (TAB, (HARD) SPACE and NEWLINE).](https://github.com/emacs-mirror/emacs/tree/master/lisp) 

`show-trailing-whitespace` は、便利だけれど`text-mode`などでは多少うざいときもあるので `prog-mode-hook` で使っている。

[ファイルの保存時に行末のスペースや末尾の改行を削除する](https://qiita.com/itiut@github/items/4d74da2412a29ef59c3a) 

というTipsもありますが、自分は手動で削除できるようにしている。

```elisp
(leaf whitespace
  :ensure t
  :bind ("C-c C-c" . my:cleanup-for-spaces)
  :hook (prog-mode-hook . my:enable-trailing-mode)
  :custom (show-trailing-whitespace . nil)
  :config
  (defun my:enable-trailing-mode ()
    "Show tail whitespace."
    (setq show-trailing-whitespace t))
  (defun my:cleanup-for-spaces ()
    "Remove contiguous line breaks at end of line + end of file."
    (interactive)
    (delete-trailing-whitespace)
    (save-excursion
      (save-restriction
		(widen)
		(goto-char (point-max))
		(delete-blank-lines)))))
```

