+++
title = "4.2. blink-cursor-mode"
draft = false
+++
* `blink-cursor-mode` を設定してカーソルの点滅を制御します。

以下の例では、入力が止まってから 10 秒後に 0.3 秒間隔で点滅します。次に入力が始まるまで点滅が続きます．

```elisp
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.3)
(setq blink-cursor-delay 10)
(add-hook 'emacs-startup-hook . blink-cursor-mode)
```
