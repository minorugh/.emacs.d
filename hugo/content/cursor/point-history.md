+++
date = "2022-08-29T05:50:55+09:00"
title = "3.6. point histry"
draft = false
+++
## [point-history.el] 過去のカーソル位置を記憶・閲覧・選択・移動する

🔗 [blue0513/point-history: Show the history of points you visited before.](https://github.com/blue0513/point-history) 

過去に訪れた箇所の一覧をリストとして表示して、そこから戻りたい箇所を選択できます。
デフォルトは `tab`移動ですが変更しています。また、`g` でリスト画面が消えてくれるので、わかりやすく`gg`で発動するようにキーバインドしています。

リスト上でポイントを移動させると、連動してビューバッファーを表示し対応位置をハイライトしてくれるところが優れものです。

`ignore-buffer`の正規表現、なかなか難しいのですが…

* `^*`:  *scratch* *dashboard* *Message* *init-log* などが有効になるようです。
* `^magit`: 先頭に`magit` とつく`magit commit`時に作られる`buffer` を無視します。
* `\]$` diredで開いたバッファーには 末尾に[dir]がつくようにカスタマイズしているので、最後尾の`]`がマッチすれば無視します。

```elisp
(leaf point-history
  :el-get blue0513/point-history
  :hook (after-init-hook . point-history-mode)
  :chord ("gg" . point-history-show) ;; Since it disappears with `g'
  :bind ((:point-history-show-mode-map
		  ("<SPC>" . point-history-next-line)
		  ("b" . point-history-prev-line)))
  :custom (point-history-show-buffer-height . 15)
  :custom
  (point-history-ignore-buffer . "^ \\*Minibuf\\|^*\\|^ \\*point-history-show*\\|^magit\\|\]$"))
```

## デレクトリバッファー名の末尾に [dir]をつける
`counsel-switch-buffer` でファイルとデレクトリとを区別しやすいようにこのようにしてます。
```elisp
(defun dired-my-append-buffer-name-hint ()
  "Append a auxiliary string [Dir] to a name of dired buffer."
  (when (eq major-mode 'dired-mode)
	(let* ((dir (expand-file-name list-buffers-directory))
    	   ;; Add a drive letter for Windows
		   (drive (if (and (eq 'system-type 'windows-nt)
			               (string-match "^\\([a-zA-Z]:\\)/" dir))
	                  (match-string 1 dir) "")))
	  (rename-buffer (concat (buffer-name) " [" drive "dir]") t))))
```
