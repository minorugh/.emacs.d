+++
title = "9.2. undo-fu"
draft = false
+++
## 8.3. [undo-fu.el] シンプルな undo/redo を提供
🔗 [emacsmirror/undo-fu: Undo helper with redo.](https://github.com/emacsmirror/undo-fu)

`undo-fu` は、シンプルながら安定した `undo/redo` 機能を提供してくれるので重宝しています。

もっといろいろできる [undo-tree](https://github.com/apchamberlain/undo-tree.el)  を使っていたけど、何気に不安定だったので乗り換えました。

```elisp
(leaf undo-fu
  :ensure t
  :bind (("C-_" . undo-fu-only-undo)
		 ("C-/" . undo-fu-only-redo)))
```
