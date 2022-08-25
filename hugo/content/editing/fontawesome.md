+++
title = "7.14. font-awesome"
draft = false
+++
### [font-awesom.el] 絵文字フォント入力支援
🔗 [krismolendyke/font-awesome.el: A simple library for using Font Awesome icons in Emacs.](https://github.com/krismolendyke/font-awesome.el) 

`Font-awesome` の入力を`counsel` で支援してくれる。

```elisp
(leaf font-awesome
  :ensure t
  :bind ("s-f" . counsel-fontwesame))
```

