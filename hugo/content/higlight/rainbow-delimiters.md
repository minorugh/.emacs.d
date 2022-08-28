+++
title = "4.6. rainbow-delimiters"
draft = false
+++
## [rainbow-delimiters.el] 対応するカッコを色付する
🔗 [yanyingwang/rainbow-delimiters: Highlights delimiters such as parentheses.](https://github.com/Fanael/rainbow-delimiters) 

複数の括弧が重なる言語では、括弧の対応関係がひと目で理解し難い場合があります。
`rainbow-delimiters.el` を使うと対応する括弧を七色に色付けしてくれるのでとても見やすなります。

```elisp
(leaf rainbow-delimiters
  :ensure t
  :hook (prog-mode-hook . rainbow-delimiters-mode))
```
