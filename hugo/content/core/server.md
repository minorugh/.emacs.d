+++
title = "2.4. emacsclient を使う"
draft = false
+++
* `shell-command` で `emacsclient` をよく使うので、Emacs起動時に `server` を起動させています。
* 重複起動させない設定です。

```elisp
;; Server start for emacs-client
(leaf server
  :require t
  :config
  (unless (server-running-p)
    (server-start)))
```

## Linux の起動時に Emacsを最小化起動させる 

起動オプションに `--iconic` を付すことで最小化起動します。

MENUから「セッションと起動」を立ち上げて「自動開始アプリケーション」に以下を設定すといいです。

```sell
$ emacs --iconic
```
Emacsから最小化するのは、`C-z: suspend-frame` です。
