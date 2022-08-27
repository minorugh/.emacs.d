+++
title = "2.7. aggressive-indent"
draft = false
+++
### [aggressive-indent.el] 即時バッファ整形
特定のメジャーモードで，とにかく整形しまくります。

```elisp
(leaf aggressive-indent
  :ensure t
  :hook ((emacs-lisp-mode-hook css-mode-hook) . aggressive-indent-mode))
```
