### 13.2. Terminal を Emacsから呼び出す
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

### 13.3. Thunar を Emacsから呼び出す
Emacsで開いている`buffer` の`current-dir` で `Debian` の `Thuner` を開くというものです。
使う機会は少ないと思いますが...

```elisp
(defun filer-current-dir-open ()
  "Open filer in current dir."
  (interactive)
  (compile (concat "Thunar " default-directory)))
(bind-key "<f3>" 'filer-current-dir-open)
```
