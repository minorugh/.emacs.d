+++
title = "3.4. my:exchange-point-and-mark"
draft = false
+++
### 直前の編集ポイントと現在のポイントとを行き来する設定

`my:exchange-point-and-mark` は、直前の編集ポイントと現在のポイントとを行き来できる設定です。

```elisp
(defun my:exchange-point-and-mark ()
  "No mark active `exchange-point-and-mark'."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark))		 
(bind-key "C-x C-x" 'my:exchange-point-and-mark)
```

## 標準機能の `C-u C-SPC` でもマーク箇所を辿れます。

```elisp
(setq set-mark-command-repeat-pop t)
(setq mark-ring-max 32)
(setq global-mark-ring-max 64)
```

