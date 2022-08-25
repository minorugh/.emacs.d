+++
title = "4.2. hl-line-mode"
draft = false
+++
### [hi-line.el] カーソル行に色を付ける

ビルトインの `hl-line-mode` を使ってカーソル行に色をつける設定です。

機能別に`hl-line` の`ON/OFF` や色を変えたりという設定もできますが、
私の場合は、シンプルに `global` 設定して色は `theme` に依存というスタイルです。

```emacs-lisp
(global-hl-line-mode 1)
```
