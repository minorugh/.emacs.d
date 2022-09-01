+++
date = "2022-08-29T06:01:24+09:00"
title = "10.8. counsel-tramp"
draft = false
weight = 8
+++
## [counsel-tramp.el] 
🔗 [masasam/emacs-counsel-tramp: Tramp ivy interface for ssh and docker and ‎vagrant.](https://github.com/masasam/emacs-counsel-tramp) 

管理している俳句サイトのレンタルサーバー`xsrver`を覗くのに `counsel-tramp` を使っています。

サーバー上のファイルを直接編集するというのはまずないのですが、サーバー内をチラ見するのに使っています。
手元が滑って重要なファイルを触ってしまわないように `view-mode` で開くようにしている。

```elisp
(leaf counsel-tramp
  :ensure t
  :hook (find-file-hook . my:auto-view)
  :custom `((tramp-persistency-file-name . ,"~/.emacs.d/tmp/tramp")
	        (tramp-default-method . "scp")
	        (counsel-tramp-custom-connections
	         . '(/scp:xsrv:/home/minorugh/gospel-haiku.com/public_html/)))
  :config
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

  (defun my:tramp-quit ()
	"Quit tramp, if tramp connencted."
	(interactive)
	(when (get-buffer "*tramp/scp xsrv*")
	  (tramp-cleanup-all-connections)
	  (counsel-tramp-quit)
	  (message "Tramp Quit!"))))
```
