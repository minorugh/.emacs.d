+++
title = "3.3. 括弧の先頭と最後へ交互にポイント移動します。"
draft = false
+++

括弧の先頭と最後へ交互にポイント移動します。

* `C-M-SPC` (mark-sexp) は，カーソル位置から順方向に選択．
* `C-M-U` (backward-up-list) は，一つ外のカッコの先頭にポイントを移す．

ただ、上記標準機能はなにげに使いにくいので `my:jump-brace` を定義しました。
括弧の先頭と最後へ交互にポイント移動します。

```elisp
(defun my:jump-brace ()
 "Jump to the corresponding parenthesis."
 (interactive)
 (let ((c (following-char))
	 (p (preceding-char)))
   (if (eq (char-syntax c) 40) (forward-list)
	 (if (eq (char-syntax p) 41) (backward-list)
       (backward-up-list)))))
(bind-key "C-M-9" 'my:jump-brace)
```
