+++
title = "12.7. sudo-edit"
draft = false
+++
## [sudo-edit.el] Root権限でファイルを開き直す
🔗 [nflath/sudo-edit: Utilities for opening files with sudo.](https://github.com/nflath/sudo-edit)

`sudo-edit.el`は、現在アクセスしているファイルをsudoで開きなおします。

```elisp
(leaf sudo-edit
  :ensure t
  :bind ("C-c s" . sudo-edit))
```
`sudo-edit-find-file` というコマンドもあるようなのでお好みで…
