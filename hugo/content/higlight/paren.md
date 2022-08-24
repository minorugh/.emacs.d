+++
title = "4.5. pare"
draft = false
+++
### 対応するカッコをハイライトする
ビルトインの `paren` を利用して対応するカッコをハイライトさせます。

```elisp
(leaf paren
  :hook (after-init-hook . show-paren-mode)
  :custom `((show-paren-style . 'parenthesis)
			(show-paren-when-point-inside-paren . t)
			(show-paren-when-point-in-periphery . t)))
```
