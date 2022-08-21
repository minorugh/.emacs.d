+++
title = "1.2. GCを減らす"
draft = false
+++
#### 2.1.1. GCを減らす
GC の閾値を最大にしておくことで GC を実質止めることができます。これもとりあえず書いておけば速くなる系なのでおすすめです。

```emacs-lisp
(setq gc-cons-threshold most-positive-fixnum)
```
`eary-init.el` の先頭に書くことで起動時間を短縮します。
