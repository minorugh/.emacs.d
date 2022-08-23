+++
title = "7.. imenu-list"
draft = false
+++

### 6.12. [imenu-list] サイドバー的にファイル内容の目次要素を表示
[@takaxpさんの改良版/imenu-list](https://github.com/takaxp/imenu-list) を使ってます。 

![Alt Text](https://live.staticflickr.com/65535/51419973025_01d97fe83b_b.jpg) 

```code
(leaf imenu-list
  :ensure t
  :bind ("<f2>" . imenu-list-smart-toggle)
  :custom
  `((imenu-list-size . 30)
	(imenu-list-position . 'left)
	(imenu-list-focus-after-activation . t)))
```

`counsel-css.el` を導入すると便利です。
```code
(leaf counsel-css
  :ensure t
  :hook (css-mode-hook . counsel-css-imenu-setup))
```
