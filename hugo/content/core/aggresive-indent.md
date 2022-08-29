+++
date = "2022-08-29T05:48:41+09:00"
title = "2.7. aggressive-indent"
+++
## [aggressive-indent.el] 即時バッファ整形
🔗 [Malabarba/aggressive-indent-mode: Emacs minor mode that keeps your code always indented. More reliable than electric-indent-mode.](https://github.com/Malabarba/aggressive-indent-mode) 

特定のメジャーモードで，とにかく整形しまくります。
あまりにも強烈なので、現在は `emacs-lisp-mode` と `css-mode` だけにしています。

```elisp
(leaf aggressive-indent
  :ensure t
  :hook ((emacs-lisp-mode-hook css-mode-hook) . aggressive-indent-mode))
```
