+++
title = "4.6. rainbow-delimiters"
draft = false
+++
### [rainbow-delimiters.el] 対応するカッコに色を付ける

[yanyingwang/rainbow-delimiters: Highlights delimiters such as parentheses.](https://github.com/Fanael/rainbow-delimiters) 

複数のカッコが重なる言語では、カッコの対応関係がひと目で理解し難い場合があります。
`rainbow-delimiters` を使うと対応するカッコを七色に色付けして見やすくできます。

```elisp
(leaf rainbow-delimiters
  :ensure t
  :hook (prog-mode-hook . rainbow-delimiters-mode))
```
