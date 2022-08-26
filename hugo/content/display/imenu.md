+++
title = "7.7. imenu-list"
draft = false
+++
### [imenu-list.el] サイドバー的にファイル内容の目次要素を表示
🔗 [bmag/imenu-list: Emacs plugin to show the current buffer's imenu entries in a separate buffer.](https://github.com/bmag/imenu-list) 

`imenu-list` は、`imenu` の各エントリを `*Ilist*` バッファで一覧します。
このバッファの当該エントリーでRETを押すと関数定義に移動します。

`*Ilist*` 上のエントリーをカーソルで選ぶと自動的に当該関数へジャンプしてくれるともっと嬉しいけれど、ビギナーな私は他力を待つしかない。
```elisp
(leaf imenu-list
  :ensure t
  :bind ("<f2>" . imenu-list-smart-toggle)
  :custom
  `((imenu-list-size . 30)
	(imenu-list-position . 'left)
	(imenu-list-focus-after-activation . t)))
```
