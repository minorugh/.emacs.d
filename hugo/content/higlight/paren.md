+++
title = "4.4. pare"
draft = false
+++

```elisp
(leaf paren
  :hook (after-init-hook . show-paren-mode)
  :custom `((show-paren-style . 'parenthesis)
			(show-paren-when-point-inside-paren . t)
			(show-paren-when-point-in-periphery . t)))
```
