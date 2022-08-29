+++
date = "2022-08-29T05:57:02+09:00"
title = "4.7. rainbow-mode"
draft = false
+++
## [rainbow-mode.el] バッファ内のカラーコードに実際の色をつける
🔗 [emacsmirror/rainbow-mode: Colorize color names in buffers.]( https://github.com/emacsmirror/rainbow-mode) 

`rainbow-mode.el` は `red`, `green` などの色名や `#aabbcc` といったカラーコードを実際の色に表示してくれる。

`global` 設定にするとうざいと思うシーンもあるので、自分は必要なときだけ使えるようにしています。

```elisp
(leaf rainbow-mode
  :ensure t
  :bind ("C-c r" . rainbow-mode))
```
