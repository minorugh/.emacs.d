+++
title = "12.4. open terminal"
draft = false
+++
## gnome-terminal を Emacsから呼び出す
Emacsで開いている`buffer` の`current-dir` で `gnome-terminal` を起動させます。

こちらを使うようになってからは`eshell` を使う機会が減りました。

```elisp
(defun term-current-dir-open ()
  "Open terminal application in current dir."
  (interactive)
  (let ((dir (directory-file-name default-directory)))
    (compile (concat "gnome-terminal --working-directory " dir))))
(bind-key "<f4>" 'term-current-dir-open)
```
