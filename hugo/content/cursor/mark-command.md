+++
title = "3.4. [my:exchange-point-and-mark] 直前の編集ポイントと現在のポイントとを行き来する。"
draft = false
+++
* `C-x C-x` は、直前の編集ポイントと現在のポイントとを行き来できる設定です。

```elisp
(defun my:exchange-point-and-mark ()
  "No mark active `exchange-point-and-mark'."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark))		 
(bind-key "C-x C-x" 'my:exchange-point-and-mark)
```

## *標準機能の `C-u C-SPC` でマーク箇所を辿れるようになります。

```elisp
(setq set-mark-command-repeat-pop t)
(setq mark-ring-max 32)
(setq global-mark-ring-max 64)
```

