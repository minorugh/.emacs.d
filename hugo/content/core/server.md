+++
date = "2022-08-29T05:48:41+09:00"
title = "2.4. server"
+++
## emacsclientを使う

コマンドラインから `emacsclient` をよく使うので、Emacs起動時にビルトインの `server` を起動させています。

```elisp
;; Server start for emacs-client
(leaf server
  :require t
  :config
  (unless (server-running-p)
    (server-start)))
```
