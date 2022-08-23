+++
title = "7.3. web-mode"
draft = false
weight = 3
+++

### [web-mode] HTML編集をサポート
HTML編集をするなら[web-mode](https://github.com/fxbois/web-mode) がお勧めなのですが、私の場合あまり使っていません。

出来上がったHTMLの内容を確認したり部分的に変更したり...という程度の使い方です。

```elisp
(leaf web-mode
  :ensure t
  :mode ("\\.js?\\'" "\\.html?\\'" "\\.php?\\'")
  :custom
  `((web-mode-markup-indent-offset . 2)
	(web-mode-css-indent-offset . 2)
	(web-mode-code-indent-offset . 2)))
```
