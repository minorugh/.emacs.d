+++
title = "2.4. server / emacsclient"
draft = false
+++
### [server.el] クライアントサーバー

* `shell-command` で `emacsclient` をよく使うので、Emacs起動時にビルトインの `server` を起動させています。
* 重複起動させない設定です。

```elisp
;; Server start for emacs-client
(leaf server
  :require t
  :config
  (unless (server-running-p)
    (server-start)))
```
