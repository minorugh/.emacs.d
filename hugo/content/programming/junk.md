+++
title = "10.10. open-junk-file"
draft = false
weight = 10
+++
### [open-junk-file.el] 使い捨てファイルを書く、開く
🔗 [rubikitch/open-junk-file: Write a disposable file.](https://github.com/rubikitch/open-junk-file) 

ファイルは howmフォルダー `~/Dropbox/howm/junk/` に保存します。

そうすることで `howm` の検索機能が利用でき、
ローマ字（migemo）での日本語検索も可能になるのでとても便利です。

```elisp
(leaf open-junk-file :ensure t
  :config
  (setq open-junk-file-format "~/Dropbox/howm/junk/%Y%m%d.")
  (setq open-junk-file-find-file-function 'find-file))
```

直近の junkファイルを即開けるように `open-last-junk-file` を定義しました。

```elisp
(leaf em-glob
 :require t
 :config
 (defvar junk-file-dir "~/Dropbox/howm/junk/")
 (defun open-last-junk-file ()
   "Open last created junk-file."
   (interactive)
   (find-file
    (car
	    (last (eelisp-extended-glob
	   	   (concat
   			(file-name-as-directory junk-file-dir)
			"*.*.*")))))))
```

