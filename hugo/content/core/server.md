+++
title = "2.4. emacsclient を使う"
draft = false
+++
* `shell-command` で `emacsclient` をよく使うのでEmacs起動時に `server` を起動させています。
* 重複起動させない設定です。

```elisp
;; Server start for emacs-client
(leaf server
  :require t
  :config
  (unless (server-running-p)
    (server-start)))
```
