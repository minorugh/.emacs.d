+++
title = "10.2. gist interface"
draft = false
weight = 2
+++

## Gistインターフェイス
リスト管理などもできる [`gist.el`](https://github.com/defunkt/gist.el) というパッケージを使っていましたが、そもそもローカルで管理する必要がないから `Gist`を使うのだと思うので `post` 専用の簡単な関数を作りました。

`gist` をinstallしておく必要があります。

```shellsession 
$ sudo apt install gist
```
ターミナルで `gist --help` と打つと沢山の起動オプションが表示される。

`gist -o` でポスト後の結果の URLをブラウザで開いてくれるのでこれを採用した。

```elisp
(leaf *gist-configurations
  :bind ("s-g" . gist-region-or-buffer)
  :init
  (defun gist-description ()
	"Add gist description."
	(code-quote-argument (read-from-minibuffer "Add gist description: ")))

  (defun gist-filename ()
	"The character string entered in minibuffer is used as file-name.
If enter is pressed without file-name, that's will be buffer-file-neme."
	(interactive)
	(let ((file (file-name-nondirectory (buffer-file-name (current-buffer)))))
	  (read-from-minibuffer (format "File name (%s): " file) file)))

  (defun gist-region-or-buffer ()
	"If region is selected, post from the region.
If region isn't selected, post from the buffer."
	(interactive)
	(let ((file (buffer-file-name)))
	  (if (not (use-region-p))
		  (compile (concat "gist -od " (gist-description) " " file))
		(compile (concat "gist -oPd " (gist-description) " -f " (gist-filename)))))
	(delete-other-windows))
```
`dired` からも使えるように定義しています。

```elisp
  (defun dired-do-gist ()
	"Dired-get-filename do gist and open in browser."
	(interactive)
	(let ((file (dired-get-filename nil t)))
	  (compile (concat "gist -od " (gist-description) " " file)))
	(delete-other-windows))
```
