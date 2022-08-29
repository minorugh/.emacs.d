+++
date = "2022-08-29T06:03:08+09:00"
title = "12.7. open with sudo"
draft = false
+++
## ファイルをsudoで開き直す
🔗 [Emacs でファイルをsudoで開き直す](https://ameblo.jp/grennarthmurmand1976/entry-12151018656.html)

上記Tipsからのパクリです。
root所有なファイルを開いた時だけ、sudoで開き直すか聞いてきます。

```elisp
;; Automatically open root permission file with sudo
(defun file-root-p (filename)
  "Return t if file FILENAME created by root."
  (eq 0 (nth 2 (file-attributes filename))))

(defadvice find-file (around my:find-file activate)
  "Open FILENAME using tramp's sudo method if it's root permission."
  (if (and (file-root-p (ad-get-arg 0))
	       (not (file-writable-p (ad-get-arg 0)))
		   (y-or-n-p (concat (ad-get-arg 0)
			                 " is root permission. Open it as root? ")))
	  (my:find-file-sudo (ad-get-arg 0))
	ad-do-it))

(defun my:find-file-sudo (file)
  "Opens FILE with root privileges."
  (interactive "F")
  (set-buffer (find-file (concat "/sudo::" file))))
```
以前は、MELPAにある下記パッケージを使っていました。
* [nflath/sudo-edit: Utilities for opening files with sudo.](https://github.com/nflath/sudo-edit) 
