+++
title = "4.1. [hl-line.el] カーソル行に色をつける"
draft = false
+++

* ビルトインの `hl-line` を使います.

* http://murakan.cocolog-nifty.com/blog/2009/01/emacs-tips-1d45.html 
* https://www.emacswiki.org/emacs/highlight-current-line.el

機能別に`hl-line` のon/off や色を変えたりという設定もできますが、私の場合は、シンプルに `global` 設定して色は `theme` に依存というスタイルです。

```code
(global-hl-line-mode 1)
```
