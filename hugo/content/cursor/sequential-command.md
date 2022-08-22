+++
title = "3.1. [sequential-command.el] バッファーの先頭と最終行への移動を簡単にする"
draft = false
+++
標準の `C-a` `C-e` を拡張し、バッファーの先頭と最終行への移動を簡単にしてくれます。

* [https://github.com/HKey/sequential-command](https://github.com/HKey/sequential-command)
* `C-a` を連続で打つことで行頭→ファイルの先頭→元の位置とカーソルが移動
* `C-e` を連続で打つことで行末→ファイルの最終行→元の位置とカーソルが移動

地味ながら一度使うと便利すぎて止められません。

MELPAから Installできますが、私は HKey氏の改良版を `el-get` でインストールしました。

```elisp
(leaf sequential-command
  :doc "https://bre.is/6Xu4fQs6"
  :el-get HKey/sequential-command
  :config
  (leaf sequential-command-config
	:hook (emacs-startup-hook . sequential-command-setup-keys)))
```
