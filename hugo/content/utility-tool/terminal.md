+++
title = "12.4. open terminal"
draft = false
+++
### nome-terminal を Emacsから呼び出す
Emacsで開いている`buffer` の`current-dir` で `gonome-terminal` を起動させるのでとても便利です。
こちらを使うようになってからは`eelisp` を使わななりました。

```elisp
(defun term-current-dir-open ()
  "Open terminal application in current dir."
  (interactive)
  (let ((dir (directory-file-name default-directory)))
    (compile (concat "gnome-terminal --working-directory " dir))))
(bind-key "<f4>" 'term-current-dir-open)
```
