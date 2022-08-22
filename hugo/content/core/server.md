## [server.el] Server機能を使う

```elisp
;; Server start for emacs-client
(leaf server
  :require t
  :config
  (unless (server-running-p)
    (server-start)))
```
