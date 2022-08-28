+++
title = "7.8. diff-hl"
draft = false
+++
## [diff-hl.el] 編集差分をフレーム端で視覚化
🔗 [dgutov/diff-hl: Emacs package for highlighting uncommitted changes.](https://github.com/dgutov/diff-hl) 

編集差分の視覚化は、元々 `git-gutter` が提供している機能です。しかし有効にするとフレームの幅が若干広がってしまうなどの不便さがあったので `diff-hl` に乗り換えました。

```elisp
(leaf diff-hl
  :ensure t
  :hook ((after-init-hook . global-diff-hl-mode)
         (after-init-hook . diff-hl-margin-mode)))
```
