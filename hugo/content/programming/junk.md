+++
title = "10.8. open-junk-file"
draft = false
+++
### [open-junk-file.el] 使い捨てファイルを書く、開く
🔗 [rubikitch/open-junk-file: Write a disposable file.](https://github.com/rubikitch/open-junk-file) 

* junkファイルの保存も howmフォルダーに置くことで、`howm-list` からの検索機能が利用できて便利です。
* `howm`の [`m`: migemo検索] は、ローマ字での日本語検索も可能なのでとても便利です。

```elisp
(leaf open-junk-file :ensure t
  :config
  (setq open-junk-file-format "~/Dropbox/howm/junk/%Y%m%d.")
  (setq open-junk-file-find-file-function 'find-file))
```

下記のTipsを参考にして、直近の junkファイルを即開けるように `open-last-junk-file` を定義しました。

* [`Emacs で作成した使い捨てファイルを簡単に開く`](htotps://qiita.com/zonkyy/items/eba6bc64f66d278f0032) 

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


