+++
title = "9.6. hist-files"
draft = false
+++
Emacsのいろいろな機能の履歴ファイルは、デフォルトではみな `~/.emacs.d/` に保存される。

日毎、設定ファイルを育てている自分は、ここに雑多な履歴ファイルがあると見づらいので、`~/.emace.d/tmp/` に保存場所を変更している。

```elisp
;; change-default-file-location
(leaf change-default-file-location
  :custom `((recentf-save-file . "~/.emacs.d/tmp/recentf")
			(save-place-file . "~/.emacs.d/tmp/places")
			(savehist-file . "~/.emacs.d/tmp/history")
			(url-configuration-directory . "~/.emacs.d/tmp/url")
			(bookmark-file . "~/.emacs.d/tmp/bookmarks")))
```
