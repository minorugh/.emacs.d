+++
title = "1.3. leaf.el を使う"
draft = false
+++
これまで `use-pacage.el` を使っていましたが、
[@conao3](https://qiita.com/conao3) さんの開発された `leaf.el` に触発されて全面的に書き直しました。

[Emacs入門から始めるleaf.el入門](https://qiita.com/conao3/items/347d7e472afd0c58fbd7)

```elisp
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
					   ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
	(package-refresh-contents)
	(package-install 'leaf))

  (leaf leaf-keywords
	:ensure t
	:init
	(leaf hydra :ensure t)
	(leaf el-get :ensure t)
	:config
	(leaf-keywords-init)))
```
