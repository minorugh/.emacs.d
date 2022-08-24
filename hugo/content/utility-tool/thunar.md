### 13.3. Thunar を Emacsから呼び出す
Emacsで開いている`buffer` の`current-dir` で `Debian` の `Thuner` を開くというものです。
使う機会は少ないと思いますが...

```code
(defun filer-current-dir-open ()
  "Open filer in current dir."
  (interactive)
  (compile (concat "Thunar " default-directory)))
(bind-key "<f3>" 'filer-current-dir-open)
```
