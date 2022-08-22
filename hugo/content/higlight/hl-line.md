+++
title = "4.1. hl-line-mode"
draft = false
+++

ビルトインの `hl-line-mode` は、カーソル行に色をつける設定です。

* http://murakan.cocolog-nifty.com/blog/2009/01/emacs-tips-1d45.html 
* https://www.emacswiki.org/emacs/highlight-current-line.el

機能別に`hl-line` の`ON/OFF` や色を変えたりという設定もできますが、
私の場合は、シンプルに `global` 設定して色は `theme` に依存というスタイルです。

```emacs-lisp
(global-hl-line-mode 1)
```
