+++
title = "7.14. fontawesome"
draft = false
+++
### [fontawesom.el] 絵文字フォント入力支援

`Font-awesome` の入力を`counsel` で支援してくれる。

```elisp
(leaf fontawesome
  :ensure t
  :bind ("s-f" . counsel-fontwesame))
```

