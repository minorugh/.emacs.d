+++
title = "11.4. scratch-memo"
draft = false
+++

### [scratch-memo] scratchバッファーを付箋として使う

* 作業中の編集画面から短期的なメモを気軽に使うために `*scratch*`バッファーを付箋メモに使えるように設定してみた。
* Emacsを再起動しても`*scratch*` バッファーの内容が消えないように [`auto-save-buffers-enhanced`](http://emacs.rubikitch.com/auto-save-buffers-enhanced/) の `*scratch*` バッファー自動保存機能を併用しています。専用のパッケージもあるようです。

[persistent-scratch.el: scratch バッファを永続化・自動保存・復元する](http://emacs.rubikitch.com/persistent-scratch/) 

`toggle-scratch` は、編集中のバッファーと`scratch`バッファーとをトグルで切り替えます。

```elisp
;; Scratch for sticky-memo
(leaf *scratch-memo
  :after auto-save-buffers-enhanced
  :bind ("S-<return>" . toggle-scratch)
  :custom ((auto-save-buffers-enhanced-save-scratch-buffer-to-file-p . t)
		   (auto-save-buffers-enhanced-file-related-with-scratch-buffer . "~/.emacs.d/tmp/scratch"))
  :init
  (defun toggle-scratch ()
	"Toggle current buffer and *scratch* buffer."
	(interactive)
	(if (not (string= "*scratch*" (buffer-name)))
		(progn
		  (setq toggle-scratch-prev-buffer (buffer-name))
		  (switch-to-buffer "*scratch*"))
	  (switch-to-buffer toggle-scratch-prev-buffer)))

  (defun read-scratch-data ()
	(let ((file "~/.emacs.d/tmp/scratch"))
	  (when (file-exists-p file)
		(set-buffer (get-buffer "*scratch*"))
		(erase-buffer)
		(insert-file-contents file))))
  (read-scratch-data))
```
