+++
title = "9.3. auto-delete"
draft = false
weight = 1
+++
### 8.2. 空になったファイルを自動的に削除

howm や org でメモをとるときに、ゴミファイルが残らないように時々メンテしています。ファイルを開いて中味を確認してから、一度閉じて dited で削除するというプロセスは手間がかかりすぎます。

下記の設定をしておくと、`C-x h` で全選択して delete したあと `kill-buffer` することで自動的にファイルが削除されるので便利です。

```elisp
(defun my:delete-file-if-no-contents ()
  "Automatic deletion for empty files (Valid in all modes)."
  (when (and (buffer-file-name (current-buffer))
			 (= (point-min) (point-max)))
    (delete-file
     (buffer-file-name (current-buffer)))))
(if (not (memq 'my:delete-file-if-no-contents after-save-hook))
    (setq after-save-hook
		  (cons 'my:delete-file-if-no-contents after-save-hook)))

```
