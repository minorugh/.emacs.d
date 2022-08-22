+++
title = "2.4. Server 機能を使う"
draft = false
+++


```elisp
;; Server start for emacs-client
(leaf server
  :require t
  :config
  (unless (server-running-p)
    (server-start)))
```
