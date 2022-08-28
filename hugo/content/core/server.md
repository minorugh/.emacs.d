+++
title = "2.4. server"
draft = false
+++
## クライアントサーバー

コマンドラインから `emacsclient` をよく使うので、Emacs起動時にビルトインの `server` を起動させています。

```elisp
;; Server start for emacs-client
(leaf server
  :require t
  :config
  (unless (server-running-p)
    (server-start)))
```
