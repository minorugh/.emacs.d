+++
title = "4.7. rainbow-mode"
draft = false
+++
* `rainbow-mode.el` は `red`, `green` などの色名や `#aabbcc` といったカラーコードから実際の色を表示するマイナーモードです。
* 常時表示しているとうざいときもあるので、`global` 設定しないで必要なときだけ使えるようにしています。

```elisp
(leaf rainbow-mode
  :ensure t
  :bind ("C-c r" . rainbow-mode))
```
