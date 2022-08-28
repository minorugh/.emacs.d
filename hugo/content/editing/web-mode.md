+++
title = "6.3. web-mode"
draft = false
weight = 3
+++
## [web-mode.el] HTML編集サポート
🔗 [fxbois/web-mode: Web template editing mode for Emacs.](https://github.com/fxbois/web-mode) 

タグ直打ちでHTML編集するならお勧めなのですが、私はあまり使っていません。

HTMLの内容を確認したり部分的に変更したり...という程度の使い方です。

```elisp
(leaf web-mode
  :ensure t
  :mode ("\\.js?\\'" "\\.html?\\'" "\\.php?\\'")
  :custom
  `((web-mode-markup-indent-offset . 2)
	(web-mode-css-indent-offset . 2)
	(web-mode-code-indent-offset . 2)))
```
