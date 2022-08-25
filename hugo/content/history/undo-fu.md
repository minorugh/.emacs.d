+++
title = "9.2. undo-fua"
draft = false
+++
### 8.3. [undo-fu.el] シンプルな undo/redo を提供
🔗 [emacsmirror/undo-fu: Undo helper with redo.](https://github.com/emacsmirror/undo-fu)

シンプルな undo/redo 機能を提供してくれるやつです。

昔はもっと色々できる [undo-tree](https://github.com/apchamberlain/undo-tree.el)  を使っていたけどそっちにバグがあるっぽいので乗り換えました。

```elisp
(leaf undo-fu
  :ensure t
  :bind (("C-_" . undo-fu-only-undo)
		 ("C-/" . undo-fu-only-redo)))
```
