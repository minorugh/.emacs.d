+++
title = "4.2. hl-line"
draft = false
+++
### カーソル行に色を付ける

ビルトインの `hl-line.el` を使ってカーソル行に色をつける設定です。

機能別に`hl-line-mode` をON/OFF したり色を変えたりという設定もできますが、
自分は、`global` 設定して、色設定は `doome-themes` に依存しています。

```emacs-lisp
(global-hl-line-mode 1)
```
